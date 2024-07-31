//
//  DataCodableTests.swift
//

import Foundation
import GitHubAPI
import Testing

@Test
func userCodable() async throws {
  let json = """
    {
      "login": "zunda-pixel",
      "id": 47569369,
      "node_id": "MDQ6VXNlcjQ3NTY5MzY5",
      "avatar_url": "https://avatars.githubusercontent.com/u/47569369?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/zunda-pixel",
      "html_url": "https://github.com/zunda-pixel",
      "followers_url": "https://api.github.com/users/zunda-pixel/followers",
      "following_url": "https://api.github.com/users/zunda-pixel/following{/other_user}",
      "gists_url": "https://api.github.com/users/zunda-pixel/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/zunda-pixel/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/zunda-pixel/subscriptions",
      "organizations_url": "https://api.github.com/users/zunda-pixel/orgs",
      "repos_url": "https://api.github.com/users/zunda-pixel/repos",
      "events_url": "https://api.github.com/users/zunda-pixel/events{/privacy}",
      "received_events_url": "https://api.github.com/users/zunda-pixel/received_events",
      "type": "User",
      "site_admin": false,
      "name": "zunda",
      "company": null,
      "blog": "",
      "location": "Japan",
      "email": null,
      "hireable": null,
      "bio": null,
      "twitter_username": "zunda_pixel",
      "public_repos": 48,
      "public_gists": 12,
      "followers": 6,
      "following": 149,
      "created_at": "2019-02-12T16:11:15Z",
      "updated_at": "2023-04-20T03:24:36Z"
    }
    """

  let data = Data(json.utf8)
  let decoder = JSONDecoder.github

  let user1 = try decoder.decode(User.self, from: data)
  let encoder = JSONEncoder.github
  let encodedData = try encoder.encode(user1)

  let user2 = try decoder.decode(User.self, from: encodedData)
  #expect(user1 == user2)
}
