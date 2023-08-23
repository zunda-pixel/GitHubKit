//
//  GitHubAPI.swift
//

import Foundation

public struct GitHubAPI: Sendable {
  public var baseURL = URL(string: "https://api.github.com")!
  public var authorizationType: AuthorizationType
  public var session: URLSession
  
  public init(
    type authorizationType: AuthorizationType,
    session: URLSession = .shared
  ) {
    self.authorizationType = authorizationType
    self.session = session
  }
  
  public init(
    accessToken: String,
    session: URLSession = .shared
  ) {
    self.authorizationType = .bearerToken(accessToken: accessToken)
    self.session = session
  }
  
  var headers: [String: String] {
    var headers: [String: String] = [
      "Accept": "application/vnd.github+json"
    ]
    if case .bearerToken(accessToken: let token) = authorizationType {
      headers["Authorization"] = "Bearer \(token)"
    }
    return headers
  }
}
