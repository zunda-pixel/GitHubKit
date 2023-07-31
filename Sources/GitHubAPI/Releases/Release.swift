//
//  Release.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Get a release
  /// https://docs.github.com/en/rest/releases/releases?apiVersion=2022-11-28#get-a-release
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - releaseID: The unique identifier of the release.
  /// - Returns: Release
  public func release(
    ownerID: String,
    repositoryName: String,
    releaseID: Int
  ) async throws -> Release {
    let path = "/repos/\(ownerID)/\(repositoryName)/releases/\(releaseID)"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get
    
    let request = HTTPRequest(method: method, url: endpoint, queries: [:], headers: headers)
    
    let (data, _) = try await session.data(for: request)
    
    let release = try JSONDecoder.github.decode(Release.self, from: data)
    
    return release
  }
}
