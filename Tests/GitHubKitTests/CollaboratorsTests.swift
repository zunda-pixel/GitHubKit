//
//  CollaboratorsTests.swift
//

import Foundation

import XCTest
@testable import GitHubKit

final class CollaboratorsTests: XCTestCase {
  func testCollaborators() async throws {
    let api = GitHubAPI(type: authorizationType)
    
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
