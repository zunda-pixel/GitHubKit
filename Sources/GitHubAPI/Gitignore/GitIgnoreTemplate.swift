//
//  GitignoreTemplate.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Get a gitignore template
  /// https://docs.github.com/en/rest/gitignore/gitignore#get-a-gitignore-template
  /// - Returns: GitignoreTemplate
  public func gitignoreTemplate(
    name: String
  ) async throws -> GitignoreTemplate {
    let path = "/gitignore/templates/\(name)"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: [:],
      headers: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let template = try decode(GitignoreTemplate.self, from: data)

    return template
  }
}
