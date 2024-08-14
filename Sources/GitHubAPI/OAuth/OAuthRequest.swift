//
//  OAuthRequest.swift
//

import Foundation

/// OAuth
/// https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps#1-request-a-users-github-identity
public struct OAuthRequest: Sendable {
  public var baseURL = URL(string: "https://github.com")!
  public let path = "login/oauth/authorize"
  public var clientID: String
  public var redirectURL: URL?
  public var userID: String?
  public var scopes: [Scope]
  public var state: String?
  public var allowSignUp: Bool

  public init(
    clientID: String,
    redirectURL: URL? = nil,
    userID: String? = nil,
    scopes: [Scope] = [],
    state: String? = nil,
    allowSignUp: Bool = true
  ) {
    self.clientID = clientID
    self.redirectURL = redirectURL
    self.userID = userID
    self.scopes = scopes
    self.state = state
    self.allowSignUp = allowSignUp
  }

  public func authorizingURL() -> URL {
    var queries: [URLQueryItem] = [
      .init(name: "client_id", value: clientID),
      .init(name: "allow_signup", value: allowSignUp.description),
    ]

    redirectURL.map { queries.append(.init(name: "redirect_uri", value: $0.absoluteString)) }
    userID.map { queries.append(.init(name: "login", value: $0)) }
    state.map { queries.append(.init(name: "state", value: $0)) }

    if !scopes.isEmpty {
      queries.append(.init(name: "scope", value: scopes.map(\.rawValue).joined(separator: " ")))
    }

    let endpoint = baseURL
      .appending(path: path)
      .appending(queryItems: queries)

    return endpoint
  }
}
