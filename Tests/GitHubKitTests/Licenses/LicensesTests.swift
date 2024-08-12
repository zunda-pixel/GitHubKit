//
//  LicensesTests.swift
//

import Foundation
import GitHubAPI
import Testing

@Test(arguments: [
  ("zunda-pixel", "GitHubKit"),
  ("swiftlang", "swift")
])
func repositoryLicenses(ownerID: String, repositoryName: String) async throws {
  let license = try await api.license(
    ownerID: ownerID,
    repositoryName: repositoryName
  )

  #expect(license.license.key == "apache-2.0")
}

@Test
func templateLicenses() async throws {
  _ = try await api.templateLicenses()
}

@Test(arguments: ["apache-2.0"])
func templateLicense(licenseKey: String) async throws {
  _ = try await api.templateLicense(key: licenseKey)
}
