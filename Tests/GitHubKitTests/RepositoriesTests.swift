//
//  RepositoriesTests.swift
//

import Foundation
import GitHubAPI
import Testing

@Test
func ownedRepositories() async throws {
  _ = try await api.ownedRepositories(
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
}

@Test
func createRepositoryWithTemplate() async throws {
  _ = try await api.createRepository(
    templateOwnerID: "zunda-pixel",
    templateRepositoryName: "TemplateApp",
    name: "TestRepository",
    description: "Repository Description",
    includeAllBranches: false,
    isPrivate: false
  )
}

@Test(arguments: [
  ("TestRepository\(Int.random(in: Int.min..<Int.max))", "homepage", true)
])
func createRepository(
  repositoryName: String,
  homepage: String,
  isPrivate: Bool
) async throws {
  let newRepository = NewRepository(
    name: repositoryName,
    description: "Description",
    homepage: homepage,
    isPrivate: isPrivate,
    hasIssues: true,
    hasProjects: true,
    hasWiki: true,
    hasDiscussions: true,
    teamID: nil,
    autoInit: true,
    gitignoreTemplate: nil,
    licenseTemplate: nil,
    allowSquashMerge: true,
    allowMergeCommit: true,
    allowRebaseMerge: true,
    allowAutoMerge: true,
    deleteBranchOnMerge: true,
    squashMergeCommitTitle: .prTitle,
    squashMergeCommitMessage: .prBody,
    mergeCommitTitle: .prTitle,
    mergeCommitMessage: .prBody,
    hasDownloads: true,
    isTemplate: true
  )
  _ = try await api.createRepository(
    repository: newRepository
  )
}

@Test(arguments: [
  ("zunda-pixel", "GitHubKit", ["github-api", "swift", "apple"])
])
func setTopics(ownerID: String, repositoryName: String, topics: [String]) async throws {
  _ = try await api.setTopics(
    ownerID: ownerID,
    repositoryName: repositoryName,
    topics: topics
  )
}

@Test(arguments: [
  ("zunda-pixel", "GitHubKit")
])
func topics(ownerID: String, repositoryName: String) async throws {
  _ = try await api.topics(
    ownerID: ownerID,
    repositoryName: repositoryName,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: [
  ("zunda-pixel", "GitHubKit")
])
func repositoryTeams(ownerID: String, repositoryName: String) async throws {
  _ = try await api.teams(
    ownerID: ownerID,
    repositoryName: repositoryName,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: [
  ("swiftlang", "swift")
])
func repositoryLanguages(ownerID: String, repositoryName: String) async throws {
  _ = try await api.languages(
    ownerID: ownerID,
    repositoryName: repositoryName
  )
}

@Test
func updateRepositoryEncodable() throws {
  let updateRepository = UpdateRepository(name: "Hello")
  _ = try JSONEncoder.github.encode(updateRepository)
}

@Test
func updateRepository() async throws {
  let repositoryName: String = "TestRepository\(Int.random(in: Int.min..<Int.max))"
  _ = try await createRepository(
    repositoryName: repositoryName,
    homepage: UUID().uuidString,
    isPrivate: true
  )

  let updateRepository = UpdateRepository(
    name: "TestRepository\(Int.random(in: Int.min..<Int.max))",
    homepage: UUID().uuidString,
    isPrivate: false,
    visibility: .public,
    securityAnalytics: .init(
      advancedSecurity: true,
      dependabotSecurityUpdates: true,
      secretScanning: true,
      secretScanningPushProtection: true
    ),
    hasIssues: .random(),
    hasProjects: .random(),
    hasWiki: .random(),
    isTemplate: .random(),
    defaultBranch: UUID().uuidString,
    allowSquashMerge: .random(),
    allowMergeCommit: .random(),
    allowRebaseMerge: .random(),
    allowAutoMerge: .random(),
    deleteBranchOnMerge: .random(),
    allowUpdateBranch: .random(),
    useSquashPrTitleAsDefault: .random(),
    squashMergeCommitTitle: .commitOrPrTitle,
    squashMergeCommitMessage: .commitMessages,
    mergeCommitTitle: .mergeMessage,
    mergeCommitMessage: .prBody,
    isArchived: .random(),
    allowForking: .random(),
    webCommitSignoffRequired: .random()
  )

  _ = try await api.updateRepository(
    ownerID: "zunda-pixel",
    repositoryName: repositoryName,
    repository: updateRepository
  )
}

@Test(arguments: ["TestRepository-\(UUID())"])
func deleteRepository(repositoryName: String) async throws {
  try await createRepository(
    repositoryName: repositoryName,
    homepage: "homepage",
    isPrivate: true
  )

  try await api.deleteRepository(
    ownerID: "zunda-pixel",
    repositoryName: repositoryName
  )
}

@Test(arguments: [("github", "explore"), ("swiftlang", "swift"), ("zunda-pixel", "GitHubKit")])
func repository(ownerID: String, repositoryName: String) async throws {
  _ = try await api.repository(
    ownerID: ownerID,
    repositoryName: repositoryName
  )
}

@Test(arguments: ["github", "apple", "swiftlang"])
func repositories(ownerID: String) async throws {
  _ = try await api.repositories(
    ownerID: ownerID,
    type: .all,
    sort: .updated,
    direction: .desc,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: [
  ("github", "explore"),
  ("swiftlang", "swift"),
  ("swiftlang", "swift-format"),
  ("zunda-pixel", "GitHubKit"),
])
func contributors(ownerID: String, repositoryName: String) async throws {
  _ = try await api.contributors(
    ownerID: ownerID,
    repositoryName: repositoryName,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: [
  ("github", "explore"),
  ("swiftlang", "swift"),
  ("swiftlang", "swift-format"),
  ("zunda-pixel", "GitHubKit"),
])
func stargazers(ownerID: String, repositoryName: String) async throws {
  _ = try await api.stargazers(
    ownerID: ownerID,
    repositoryName: repositoryName,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: [
  ("github", "explore"),
  ("swiftlang", "swift"),
  ("swiftlang", "swift-format"),
  ("zunda-pixel", "GitHubKit"),
])
func forks(ownerID: String, repositoryName: String) async throws {
  _ = try await api.forks(
    ownerID: ownerID,
    repositoryName: repositoryName,
    sort: .newest,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: [
  ("github", "explore"),
  ("github", "gitignore"),
  ("github", "docs"),
])
func createFork(ownerID: String, repositoryName: String) async throws {
  _ = try await api.createFork(
    ownerID: ownerID,
    repositoryName: repositoryName,
    name: repositoryName,
    defaultBranchOnly: true
  )
  try await api.deleteRepository(
    ownerID: "zunda-pixel",
    repositoryName: repositoryName
  )
}

@Test
func securityAnalyticsCodable() throws {
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

  #expect(securityAnalytics == decodedSecurityAnalytics)
}

@Test(arguments: [
  ("github", "explore"),
  ("swiftlang", "swift"),
  ("swiftlang", "swift-format"),
  ("zunda-pixel", "GitHubKit"),
])
func tags(ownerID: String, repositoryName: String) async throws {
  _ = try await api.tags(
    ownerID: ownerID,
    repositoryName: repositoryName,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: ["apple"])
func organizationRepositories(organizationID: String) async throws {
  _ = try await api.repositories(
    organizationID: organizationID,
    type: .all,
    direction: .asc,
    perPage: 100,
    page: 1
  )
}

@Test(arguments: [
  ("zunda-pixel", "GitHubKit"),
  ("zunda-pixel", "GitBoard"),
])
func protectionTags(ownerID: String, repositoryName: String) async throws {
  _ = try await api.protectionTags(
    ownerID: ownerID,
    repositoryName: repositoryName
  )
}

@Test(arguments: [
  ("zunda-pixel", "GitHubKit", "v1.*")
])
func createProtectionTag(ownerID: String, repositoryName: String, pattern: String) async throws {
  let tag = try await api.createProtectionTag(
    ownerID: ownerID,
    repositoryName: repositoryName,
    pattern: pattern
  )
  try await api.deleteProtectionTag(
    ownerID: ownerID,
    repositoryName: repositoryName,
    tagID: tag.id
  )
}

@Test(arguments: [
  ("zunda-pixel", "GitHubKit")
]) func deleteProtectionTag(ownerID: String, repositoryName: String) async throws {
  let tags = try await api.protectionTags(
    ownerID: ownerID,
    repositoryName: repositoryName
  )

  for tag in tags {
    try await api.deleteProtectionTag(
      ownerID: ownerID,
      repositoryName: repositoryName,
      tagID: tag.id
    )
  }
}
