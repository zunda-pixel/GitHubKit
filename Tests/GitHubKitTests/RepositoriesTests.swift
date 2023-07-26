//
//  RepositoriesTests.swift
//

import Foundation

import XCTest
@testable import GitHubAPI

final class RepositoriesTests: XCTestCase {  
  func testRepositories() async throws {
    let api = GitHubAPI(type: authorizationType)
    let repositories = try await api.repositories(
      ownerID: "apple",
      type: .all,
      sort: .updated,
      direction: .desc,
      perPage: 100,
      page: 1
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
  
  func testStargazers() async throws {
    let api = GitHubAPI(type: authorizationType)
    
    let users = try await api.stargazers(
      ownerID: "apple",
      repositoryName: "swift",
      perPage: 100,
      page: 1
    )
    
    print(users.count)
  }
  
  func testForks() async throws {
    let api = GitHubAPI(type: authorizationType)
    
    let repositories = try await api.forks(
      ownerID: "apple",
      repositoryName: "swift-http-types",
      sort: .newest,
      perPage: 100,
      page: 1
    )
    
    print(repositories.count)
  }
  
  func testCreateFork() async throws {
    let api = GitHubAPI(type: authorizationType)
    let repository = try await api.createFork(
      ownerID: "apple",
      repositoryName: "swift",
      name: "swift",
      defaultBranchOnly: true
    )
    print(repository)
  }
  
  func testSecurityAnalyticsCodable() throws {
    let securityAnalytics = SecurityAnalytics(
      advancedSecurity: true,
      dependabotSecurityUpdates: true,
      secretScanning: true,
      secretScanningPushProtection: true
    )
    let encoder = JSONEncoder.github
    
    let data = try encoder.encode(securityAnalytics)
        
    let decoder = JSONDecoder.github
    
    let decodedSecurityAnalytics = try decoder.decode(SecurityAnalytics.self, from: data)
    
    XCTAssertEqual(securityAnalytics, decodedSecurityAnalytics)
  }
  
  func testProtectionTags() async throws {
    let api = GitHubAPI(type: authorizationType)
    let tags = try await api.protectionTags(
      ownerID: "zunda-pixel",
      repositoryName: "GitHubKit"
    )
    print(tags)
  }
}
