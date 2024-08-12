//
//  Languages.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// List repository languages
  /// https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-repository-languages
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  /// - Returns: [String:  Int]: [Language Name: Bytes of Code]
  public func languages(
    ownerID: String,
    repositoryName: String
  ) async throws -> [String: Int] {
    let path = "/repos/\(ownerID)/\(repositoryName)/languages"
    let method: HTTPRequest.Method = .get
    let endpoint = baseURL.appending(path: path)

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let languages = try decode([String: Int].self, from: data)

    return languages
  }
}
