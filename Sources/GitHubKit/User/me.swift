//
//  me.swift
//

import Foundation
import HTTPMethod

extension GitHubKit {
  public func me() async throws -> User {
    let path = "/user"
    let method: HTTPMethod = .get
    let endpoint = baseURL.appending(path: path)
    let request = URLRequest(
      url: endpoint,
      method: method,
      queries: [:],
      headers: headers()
    )
    
    let (data, _) = try await session.data(for: request)
    let decoder = JSONDecoder.github
    
    let user = try decoder.decode(User.self, from: data)
    return user
  }
}
