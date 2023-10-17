//
//  LicensesTests.swift
//

import Foundation
import XCTest

@testable import GitHubAPI

final class LicensesTests: XCTestCase {
  func testRepositoryLicenses() async throws {
    let license = try await api.license(
      ownerID: "zunda-pixel",
      repositoryName: "GitHubKit"
    )

    XCTAssertEqual(license.license.key, "apache-2.0")
  }
  
  func testTemplateLicenses() async throws {
    let licenses = try await api.templateLicenses()

    print(licenses.count)
  }
  
  func testTemplateLicense() async throws {
    let license = try await api.templateLicense(key: "apache-2.0")

    print(license)
  }
}
