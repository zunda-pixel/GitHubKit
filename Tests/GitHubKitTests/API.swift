//
//  API.swift
//

import Foundation
import GitHubAPI
import HTTPClient

let token = ProcessInfo.processInfo.environment["GITHUB_TOKEN"]!
let api = GitHubAPI(
  type: .bearerToken(accessToken: token),
  httpClient: .urlSession(.shared)
)
