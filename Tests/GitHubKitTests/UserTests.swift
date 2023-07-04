//
//  UserTests.swift
//

import Foundation

import XCTest
@testable import GitHubKit

final class UserTests: XCTestCase {
  let accessToken = "flsdjfsdjfoisjdiofjsdklfjsdlk"
  
  func testMe() async throws {
    let user = try await GitHubKit(accessToken: accessToken).me()
    print(user)
  }
}
