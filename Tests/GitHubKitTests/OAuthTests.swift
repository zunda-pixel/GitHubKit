import Foundation
import GitHubAPI
import Testing

let clientID = ProcessInfo.processInfo.environment["CLIENT_ID"]!
let clientSecret = ProcessInfo.processInfo.environment["CLIENT_SECRET"]!
var enableManualTest: Bool { ProcessInfo.processInfo.environment["MANUAL_TEST"] != nil}

@Test
func authorizingURL() {
  let oauth = OAuthRequest(
    clientID: clientID,
    scopes: Scope.allCases
  )
  _ = oauth.authorizingURL()
}

@Test(.enabled(if: enableManualTest), arguments: ["test"])
func authorize(code: String) async throws {
  let oauth = OAuth(
    clientID: clientID,
    clientSecret: clientSecret,
    code: code
  )
  _ = try await oauth.authorize(
    httpClient: .urlSession(.shared)
  )
}
