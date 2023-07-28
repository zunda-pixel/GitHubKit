//
//  UpdateRepository.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Update a repository
  /// https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#update-a-repository
  /// - Parameters:
  ///   - ownerID: The account owner of the repository. The name is not case sensitive.
  ///   - repositoryName: The name of the repository without the .git extension. The name is not case sensitive.
  ///   - repository: Update Repository
  /// - Returns: Repository
  public func updateRepository(
    ownerID: String,
    repositoryName: String,
    repository: UpdateRepository
  ) async throws -> Repository {
    let path = "/repos/\(ownerID)/\(repositoryName)"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .patch
    
    let body = try JSONEncoder.github.encode(repository)
    
    let httpRequest = HTTPRequest(method: method, url: endpoint, queries: [:], headers: headers)
    var urlRequest = URLRequest(httpRequest: httpRequest)!
    urlRequest.httpBody = body
    
    let (data, _) = try await session.data(for: urlRequest)
    
    let repository = try JSONDecoder.github.decode(Repository.self, from: data)
    
    return repository
  }
}

public struct UpdateRepository: Encodable {
  public var name: String?
  public var homepage: String?
  public var isPrivate: Bool?
  public var visibility: Visibility?
  public var securityAnalytics: SecurityAnalytics?
  public var hasIssues: Bool?
  public var hasProjects: Bool?
  public var hasWiki: Bool?
  public var isTemplate: Bool?
  public var defaultBranch: String?
  public var allowSquashMerge: Bool?
  public var allowMergeCommit: Bool?
  public var allowRebaseMerge: Bool?
  public var allowAutoMerge: Bool?
  public var deleteBranchOnMerge: Bool?
  public var allowUpdateBranch: Bool?
  public var useSquashPrTitleAsDefault: Bool?
  public var squashMergeCommitTitle: String?
  public var squashMergeCommitMessage: String?
  public var mergeCommitTitle: String?
  public var mergeCommitMessage: String?
  public var isArchived: Bool?
  public var allowForking: Bool?
  public var webCommitSignoffRequired: Bool?
  
  public init(
    name: String? = nil,
    homepage: String? = nil,
    isPrivate: Bool? = nil,
    visibility: Visibility? = nil,
    securityAnalytics: SecurityAnalytics? = nil,
    hasIssues: Bool? = nil,
    hasProjects: Bool? = nil,
    hasWiki: Bool? = nil,
    isTemplate: Bool? = nil,
    defaultBranch: String? = nil,
    allowSquashMerge: Bool? = nil,
    allowMergeCommit: Bool? = nil,
    allowRebaseMerge: Bool? = nil,
    allowAutoMerge: Bool? = nil,
    deleteBranchOnMerge: Bool? = nil,
    allowUpdateBranch: Bool? = nil,
    useSquashPrTitleAsDefault: Bool? = nil,
    squashMergeCommitTitle: String? = nil,
    squashMergeCommitMessage: String? = nil,
    mergeCommitTitle: String? = nil,
    mergeCommitMessage: String? = nil,
    isArchived: Bool? = nil,
    allowForking: Bool? = nil,
    webCommitSignoffRequired: Bool? = nil
  ) {
    self.name = name
    self.homepage = homepage
    self.isPrivate = isPrivate
    self.visibility = visibility
    self.securityAnalytics = securityAnalytics
    self.hasIssues = hasIssues
    self.hasProjects = hasProjects
    self.hasWiki = hasWiki
    self.isTemplate = isTemplate
    self.defaultBranch = defaultBranch
    self.allowSquashMerge = allowSquashMerge
    self.allowMergeCommit = allowMergeCommit
    self.allowRebaseMerge = allowRebaseMerge
    self.allowAutoMerge = allowAutoMerge
    self.deleteBranchOnMerge = deleteBranchOnMerge
    self.allowUpdateBranch = allowUpdateBranch
    self.useSquashPrTitleAsDefault = useSquashPrTitleAsDefault
    self.squashMergeCommitTitle = squashMergeCommitTitle
    self.squashMergeCommitMessage = squashMergeCommitMessage
    self.mergeCommitTitle = mergeCommitTitle
    self.mergeCommitMessage = mergeCommitMessage
    self.isArchived = isArchived
    self.allowForking = allowForking
    self.webCommitSignoffRequired = webCommitSignoffRequired
  }
  
  private enum CodingKeys: String, CodingKey {
    case name
    case homepage
    case isPrivate = "private"
    case visibility
    case securityAnalytics = "security_and_analysis"
    case hasIssues = "has_issues"
    case hasProjects = "has_projects"
    case hasWiki = "has_wiki"
    case isTemplate = "is_template"
    case defaultBranch = "default_branch"
    case allowSquashMerge = "allow_squash_merge"
    case allowMergeCommit = "allow_merge_commit"
    case allowRebaseMerge = "allow_rebase_merge"
    case allowAutoMerge = "allow_auto_merge"
    case deleteBranchOnMerge = "delete_branch_on_merge"
    case allowUpdateBranch = "allow_update_branch"
    case useSquashPrTitleAsDefault = "use_squash_pr_title_as_default"
    case squashMergeCommitTitle = "squash_merge_commit_title"
    case squashMergeCommitMessage = "squash_merge_commit_message"
    case mergeCommitTitle = "merge_commit_title"
    case mergeCommitMessage = "merge_commit_message"
    case isArchived = "archived"
    case allowForking = "allow_forking"
    case webCommitSignoffRequired = "web_commit_signoff_required"
  }
}
