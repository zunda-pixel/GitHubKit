//
//  RepositoriesTests.swift
//

import Foundation

import XCTest
@testable import GitHubKit

final class RepositoriesTests: XCTestCase {  
  func testRepositories() async throws {
    let api = GitHubAPI(type: authorizationType)
    let repositories = try await api.repositories(
      ownerID: "zunda-pixel",
      type: .all,
      sort: .updated,
      direction: .desc
    )
    print(repositories)
  }
  
  func testContributors() async throws {
    let api = GitHubAPI(type: authorizationType)
    let contributors = try await api.contributors(
      ownerID: "apple",
      repositoryName: "swift-format",
      perPage: 100,
      page: 1
    )
    print(contributors.count)
  }
  
  func testLicense() async throws {
    let api = GitHubAPI(type: authorizationType)
    
    let license = try await api.license(
      ownerID: "apple",
      repositoryName: "swift"
    )
    
    print(license)
  }
  
  func testStarringUsers() async throws {
    let api = GitHubAPI(type: authorizationType)
    
    let users = try await api.starringUsers(
      ownerID: "apple",
      repositoryName: "swift",
      perPage: 100,
      page: 1
    )
    
    print(users.count)
  }
}
