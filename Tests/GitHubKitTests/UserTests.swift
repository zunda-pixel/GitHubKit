//
//  UserTests.swift
//

import Foundation

import XCTest
@testable import GitHubKit

final class UserTests: XCTestCase {
  func testMe() async throws {
    let user = try await GitHubKit(type: authorizationType).me()
    print(user)
  }
}
