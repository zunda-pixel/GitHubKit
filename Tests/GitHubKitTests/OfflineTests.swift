import Foundation
import GitHubAPI
import HTTPClient
import HTTPTypes
import Testing

private struct StubHTTPClient: HTTPClientProtocol, Hashable {
  func execute(for request: HTTPRequest, from body: Data?) async throws -> (Data, HTTPResponse) {
    #expect(request.method == .get)
    #expect(request.path == "/gitignore/templates")
    #expect(request.headerFields[.authorization] == "Bearer test-token")
    #expect(request.headerFields[.accept] == "application/vnd.github+json")
    #expect(body == nil)

    return (Data(#"["Swift","Xcode"]"#.utf8), HTTPResponse(status: .ok))
  }
}

@Suite
struct OfflineTests {
  @Test
  func gitignoreTemplates() async throws {
    let client = GitHubAPI(accessToken: "test-token", httpClient: StubHTTPClient())

    let templates = try await client.allGitignoreTemplateNames()

    #expect(templates == ["Swift", "Xcode"])
  }

  @Test
  func authorizationURL() {
    let oauth = OAuthRequest(clientID: "test-client", scopes: Scope.allCases)
    let url = oauth.authorizingURL()

    #expect(url.host == "github.com")
    #expect(url.path == "/login/oauth/authorize")
    #expect(
      URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.contains(
        URLQueryItem(name: "client_id", value: "test-client")
      ) == true)
  }

  @Test
  func updateRepositoryEncodable() throws {
    let updateRepository = UpdateRepository(name: "Hello")
    _ = try JSONEncoder.github.encode(updateRepository)
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
}
