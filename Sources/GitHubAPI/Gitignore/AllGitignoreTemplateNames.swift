//
//  AllGitignoreTemplates.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Get all gitignore templates
  /// https://docs.github.com/en/rest/gitignore/gitignore#get-all-gitignore-templates
  /// - Returns: [String]
  public func allGitignoreTemplateNames() async throws -> [String] {
    let path = "/gitignore/templates"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      queries: [:],
      headers: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let templates = try decode([String].self, from: data)

    return templates
  }
}
