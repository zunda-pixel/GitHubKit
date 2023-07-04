//
//  DataCodableTests.swift
//

import XCTest
@testable import GitHubKit

final class DataCodableTests: XCTestCase {
  func testUserCodable() async throws {
    let json = """
{
  "login": "zunda",
  "id": 30968,
  "node_id": "MDQ6VXNlcjMwOTY4",
  "avatar_url": "https://avatars.githubusercontent.com/u/30968?v=4",
  "gravatar_id": "",
  "url": "https://api.github.com/users/zunda",
  "html_url": "https://github.com/zunda",
  "followers_url": "https://api.github.com/users/zunda/followers",
  "following_url": "https://api.github.com/users/zunda/following{/other_user}",
  "gists_url": "https://api.github.com/users/zunda/gists{/gist_id}",
  "starred_url": "https://api.github.com/users/zunda/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/zunda/subscriptions",
  "organizations_url": "https://api.github.com/users/zunda/orgs",
  "repos_url": "https://api.github.com/users/zunda/repos",
  "events_url": "https://api.github.com/users/zunda/events{/privacy}",
  "received_events_url": "https://api.github.com/users/zunda/received_events",
  "type": "User",
  "site_admin": false,
  "score": 1
}
"""
    
    let data = Data(json.utf8)
    let decoder = JSONDecoder()
    let user = try decoder.decode(User.self, from: data)
    print(user)
  }
}
