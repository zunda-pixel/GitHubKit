//
//  GitignoreTests.swift
//

import Foundation
import GitHubAPI
import Testing

@Test
func allGitignoreTemplates() async throws {
  _ = try await api.allGitignoreTemplateNames()
}

@Test(arguments: ["Xcode", "Swift"])
func gitignoreTemplate(name: String) async throws {
  _ = try await api.gitignoreTemplate(name: name)
}
