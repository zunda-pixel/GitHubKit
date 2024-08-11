//
//  OAuth.swift
//

import Foundation
import HTTPTypes
import HTTPClient

/// OAuth
/// https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps#2-users-are-redirected-back-to-your-site-by-github
public struct OAuth: Sendable {
  public enum ResponseType: String, Sendable {
    case `default`
    case json = "application/json"
    case xml = "application/xml"
  }

  public var baseURL = URL(string: "https://github.com/login")!
  private let path = "/oauth/access_token"

  public var clientID: String
  public var clientSecret: String
  public var code: String
  public var redirectURL: URL?

  public init(
    clientID: String,
    clientSecret: String,
    code: String,
    redirectURL: URL? = nil,
    responseType: ResponseType = .default
  ) {
    self.clientID = clientID
    self.clientSecret = clientSecret
    self.code = code
    self.redirectURL = redirectURL
  }

  public func request(responseType: ResponseType = .default) -> HTTPRequest {
    let endpoint = baseURL.appending(path: path)

    var queries: [String: String] = [
      "client_id": clientID,
      "client_secret": clientSecret,
      "code": code,
    ]

    redirectURL.map { queries["redirect_uri"] = $0.absoluteString }

    var urlComponents = URLComponents(url: endpoint, resolvingAgainstBaseURL: false)!
    urlComponents.queryItems = queries.map { .init(name: $0.key, value: $0.value) }

    var headers: HTTPFields = [:]
    if responseType != .default {
      headers[.accept] = responseType.rawValue
    }

    return HTTPRequest(
      method: .post,
      url: endpoint,
      queries: queries,
      headers: headers
    )
  }

  public func authorize<HTTPClient: HTTPClientProtocol>(httpClient: HTTPClient) async throws -> OAuthResponse where HTTPClient.Data == Foundation.Data {
    let request = request(responseType: .json)
    let data: Data
    let response: HTTPResponse

    do {
      (data, response) = try await httpClient.execute(for: request, from: nil)
    } catch {
      throw GitHubError.request(request: request)
    }

    do {
      let oauthResponse = try JSONDecoder.github.decode(OAuthResponse.self, from: data)
      return oauthResponse
    } catch {
      throw GitHubError.decode(data: data, response: response)
    }
  }
}
