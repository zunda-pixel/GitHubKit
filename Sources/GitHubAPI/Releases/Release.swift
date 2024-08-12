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
    let method: HTTPRequest.Method = .get
    let endpoint = baseURL.appending(path: path)

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let release = try decode(Release.self, from: data)

    return release
  }

  /// Get a release by tag name
  /// https://docs.github.com/en/rest/releases/releases?apiVersion=2022-11-28#get-a-release-by-tag-name
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - tag: tag parameter
  /// - Returns: Release
  public func release(
    ownerID: String,
    repositoryName: String,
    tag: String
  ) async throws -> Release {
    let path = "/repos/\(ownerID)/\(repositoryName)/releases/tags/\(tag)"
    let method: HTTPRequest.Method = .get
    let endpoint = baseURL.appending(path: path)

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let release = try decode(Release.self, from: data)

    return release
  }
}
