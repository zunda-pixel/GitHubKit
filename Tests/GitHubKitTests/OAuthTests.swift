import XCTest
@testable import GitHubKit

final class OAuthTests: XCTestCase {
  let clientID = "g7j5DeETKUfN1e1swdOU"
  let clientSecret = "QORWumaSE24K1C4ijJnUjxwYxqEr7nB2rxcHKeUo"
  
  func testAuthorizingURL() {
    let oauth = OAuthRequest(
      clientID: clientID,
      scopes: Scope.allCases
    )
    print(oauth.authorizingURL())
  }
  
  func testAuthorizing() async throws {
    let code = "gJJf4LnMHJlydjdRhmbS"
    let oauth = OAuth(
      clientID: clientID,
      clientSecret: clientSecret,
      code: code
    )
    let response = try await oauth.authorize()
    print(response.accessToken)
  }
}
