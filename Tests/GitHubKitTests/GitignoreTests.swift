//
//  GitignoreTests.swift
//

import Foundation

import XCTest
@testable import GitHubAPI

final class GitignoreTests: XCTestCase {
  func testAllGitignoreTemplates() async throws {
    let api = GitHubAPI(type: authorizationType)
    
    let gitignoreTemplateNames = try await api.allGitignoreTemplateNames()
    
    print(gitignoreTemplateNames)
  }
  
  func testGitignoreTemplate() async throws {
    let api = GitHubAPI(type: authorizationType)
    
    let gitignoreTemplate = try await api.gitignoreTemplate(name: "Swift")
    
    print(gitignoreTemplate)
  }
}
