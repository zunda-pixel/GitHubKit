//
//  GitignoreTests.swift
//

import Foundation
import XCTest

@testable import GitHubAPI

final class GitignoreTests: XCTestCase {
  func testAllGitignoreTemplates() async throws {
    let gitignoreTemplateNames = try await api.allGitignoreTemplateNames()

    print(gitignoreTemplateNames)
  }

  func testGitignoreTemplate() async throws {
    let gitignoreTemplate = try await api.gitignoreTemplate(name: "Swift")

    print(gitignoreTemplate)
  }
}
