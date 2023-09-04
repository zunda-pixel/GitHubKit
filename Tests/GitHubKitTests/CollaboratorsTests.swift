//
//  CollaboratorsTests.swift
//

import Foundation
import XCTest

@testable import GitHubAPI

final class CollaboratorsTests: XCTestCase {
  func testCollaborators() async throws {
    let collaborators = try await api.collaborators(
      ownerID: "zunda-pixel",
      repositoryName: "GitHubKit",
      affiliation: .all,
      permission: .pull,
      perPage: 100,
      page: 1
    )

    print(collaborators)
  }
}
