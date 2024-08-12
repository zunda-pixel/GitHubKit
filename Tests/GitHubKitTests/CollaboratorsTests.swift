//
//  CollaboratorsTests.swift
//

import Foundation
import GitHubAPI
import Testing

@Test(arguments: [
  ("zunda-pixel", "GitHubKit"),
  ("zunda-pixel", "GitBoard")
])
func collaborators(ownerID: String, repositoryName: String) async throws {
  _ = try await api.collaborators(
    ownerID: ownerID,
    repositoryName: repositoryName,
    affiliation: .all,
    permission: .admin,
    perPage: 100,
    page: 1
  )
}
