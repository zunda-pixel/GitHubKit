//
//  GitHubAPI.swift
//

import Foundation
import HTTPClient
import HTTPTypes
import HTTPClient

public struct GitHubAPI<HTTPClient: HTTPClientProtocol>: Sendable, Hashable where HTTPClient.Data == Foundation.Data, HTTPClient.Body == Foundation.Data, HTTPClient: Hashable {
  public var baseURL = URL(string: "https://api.github.com")!
  public var authorizationType: AuthorizationType
  public var httpClient: HTTPClient

  public init(
    type authorizationType: AuthorizationType,
    httpClient: HTTPClient
  ) {
    self.authorizationType = authorizationType
    self.httpClient = httpClient
  }

  public init(
    accessToken: String,
    httpClient: HTTPClient
  ) {
    self.authorizationType = .bearerToken(accessToken: accessToken)
    self.httpClient = httpClient
  }

  var headers: HTTPFields {
    var headers: HTTPFields = [
      .accept: "application/vnd.github+json"
    ]
    if case .bearerToken(accessToken: let token) = authorizationType {
      headers[.authorization] = "Bearer \(token)"
    }
    return headers
  }
}
