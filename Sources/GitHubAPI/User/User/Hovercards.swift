//
//  Hovercard.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Get contextual information for a user
  /// https://docs.github.com/en/rest/users/users?apiVersion=2022-11-28#get-contextual-information-for-a-user
  /// - Parameters:
  ///   - userID: The handle for the GitHub user account.
  ///   - subjectType: Identifies which additional information you'd like to receive about the person's hovercard.
  ///   - subjectID: Uses the ID for the subjectType you specified. Required when using subjectType.
  public func hovercards(
    userID: String,
    subjectType: SubjectType? = nil,
    subjectID: String? = nil
  ) async throws -> [Hovercard] {
    let path = "/users/\(userID)/hovercard"
    let method: HTTPRequest.Method = .get
    let queries: [URLQueryItem] = [
      .init(name: "subject_type", value: subjectType?.rawValue),
      .init(name: "subject_id", value: subjectID),
    ].filter { $0.value != nil }

    let endpoint =
      baseURL
      .appending(path: path)
      .appending(queryItems: queries)

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let response = try decode(HovercardResponse.self, from: data)

    return response.contexts
  }
}

public enum SubjectType: String {
  case organization
  case repository
  case issue
  case pullRequest = "pull_request"
}

struct HovercardResponse: Codable {
  let contexts: [Hovercard]
}
