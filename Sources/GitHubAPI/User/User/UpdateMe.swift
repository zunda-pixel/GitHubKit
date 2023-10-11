//
//  UpdateUser.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Update the authenticated user
  /// https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#update-the-authenticated-user
  /// - Parameter updateUser: Update User
  /// - Returns: User
  @discardableResult
  public func update(me updateUser: UpdateUser) async throws -> User {
    let path = "/user"
    let method: HTTPRequest.Method = .patch
    let endpoint = baseURL.appending(path: path)
    
    let body = try JSONEncoder().encode(updateUser)
    
    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: [:],
      headers: headers
    )
    
    var urlRequest = URLRequest(httpRequest: request)!
    urlRequest.httpBody = body

    let (data, response) = try await session.data(for: urlRequest)
    
    try verifyResopnseStatus(urlResopnse: response)
    
    let user = try decode(User.self, from: data)
    
    return user
  }
}
