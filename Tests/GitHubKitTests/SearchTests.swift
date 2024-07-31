//
//  SearchTests.swift
//

import Foundation
import GitHubAPI
import Testing

@Test(arguments: ["apple"])
func tearchUsers(query: String) async throws {
  _ = try await api.searchUsers(query: query)
}

@Test(arguments: ["tetris+language:assembly&sort=stars&order=desc"])
func searchRepositories(query: String) async throws {
  _ = try await api.searchRepositories(query: query)
}
