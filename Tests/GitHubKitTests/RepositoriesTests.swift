//
//  RepositoriesTests.swift
//

import Foundation

import XCTest
@testable import GitHubAPI

final class RepositoriesTests: XCTestCase {
  func testOwnedRepositories() async throws {
    let api = GitHubAPI(type: authorizationType)
    
    let repositories = try await api.ownedRepositories(
      visibility: nil,
      affiliation: nil,
      type: .all,
      sort: .created,
      direction: .asc,
      since: nil,
      before: nil,
      perPage: 100,
      page: 1
    )
    
    print(repositories.count)
  }
  
  func testCreateRepositoryWithTemplate() async throws {
    let api = GitHubAPI(type: authorizationType)
    
    let repository = try await api.createRepository(
      templateOwnerID: "zunda-pixel",
      templateRepositoryName: "TemplateApp",
      name: "TestRepository",
      description: "Repository Description",
      includeAllBranches: false,
      isPrivate: false
    )
    
    print(repository)
  }
  
  func testCreateRepository() async throws {
    let api = GitHubAPI(type: authorizationType)
    let newRepository = NewRepository(name: "TestRepository")
    let repository = try await api.createRepository(repository: newRepository)
    print(repository)
  }
  
  func testSetTopics() async throws {
    let api = GitHubAPI(type: authorizationType)
    let topics = try await api.setTopics(
      ownerID: "zunda-pixel",
      repositoryName: "GitHubKit",
      topics: ["github-api", "swift", "apple"]
    )
    
    print(topics)
  }
  
  func testTopics() async throws {
    let api = GitHubAPI(type: authorizationType)
    let topics = try await api.topics(
      ownerID: "zunda-pixel",
      repositoryName: "GitHubKit",
      perPage: 100,
      page: 1
    )
    
    print(topics)
  }
  
  func testRepositoryTeams() async throws {
    let api = GitHubAPI(type: authorizationType)
    let teams = try await api.teams(
      ownerID: "zunda-pixel",
      repositoryName: "GitHubKit",
      perPage: 100,
      page: 1
    )
    
    print(teams)
  }
  
  func testRepositoryLanguages() async throws {
    let api = GitHubAPI(type: authorizationType)
    let languages = try await api.languages(
      ownerID: "apple",
      repositoryName: "swift"
    )
    print(languages)
  }
  
  func testUpdateRepositoryEncodable() throws {
    let updateRepository = UpdateRepository(name: "Hello")
    let data = try JSONEncoder.github.encode(updateRepository)
    print(String(data: data, encoding: .utf8)!)
  }
  
  func testUpdateRepository() async throws {
    let api = GitHubAPI(type: authorizationType)
    let repositoryName: String = "TestRepository1111"
    let repository = try await api.updateRepository(
      ownerID: "zunda-pixel",
      repositoryName: repositoryName,
      repository: .init(
        name: repositoryName,
        homepage: "https://github.com/sample",
        isPrivate: true,
        allowForking: false
      )
    )
    
    print(repository)
  }
  
  func testDeleteRepository() async throws {
    let api = GitHubAPI(type: authorizationType)
    try await api.deleteRepository(
      ownerID: "zunda-pixel",
      repositoryName: "TestRepository"
    )
  }
  
  func testRepository() async throws {
    let api = GitHubAPI(type: authorizationType)
    let repository = try await api.repository(
      ownerID: "apple",
      repositoryName: "swift"
    )
    
    print(repository)
  }
  
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
  
  func testTags() async throws {
    let api = GitHubAPI(type: authorizationType)
    let tags = try await api.tags(
      ownerID: "apple",
      repositoryName: "swift-format",
      perPage: 100,
      page: 1
    )
    print(tags)
  }
  
  func testOrganizationRepositories() async throws {
    let api = GitHubAPI(type: authorizationType)
    let repositories = try await api.repositories(
      organization: "apple",
      type: .all,
      direction: .asc,
      perPage: 100,
      page: 1
    )
    
    print(repositories.count)
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
