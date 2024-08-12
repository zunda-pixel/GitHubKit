//
//  TemplateLicenses.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  /// Get all commonly used licenses
  /// https://docs.github.com/en/rest/licenses/licenses?apiVersion=2022-11-28#get-all-commonly-used-licenses
  /// - Returns: TemplateLicense
  public func templateLicenses() async throws -> [TemplateLicense] {
    let path = "/licenses"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let licenses = try decode([TemplateLicense].self, from: data)

    return licenses
  }

  /// Get a license
  /// https://docs.github.com/en/rest/licenses/licenses?apiVersion=2022-11-28#get-a-license
  /// - Parameter licenseKey: License Key(Name)
  /// - Returns: TemplateLicense
  public func templateLicense(key licenseKey: String) async throws -> TemplateLicense {
    let path = "/licenses/\(licenseKey)"
    let endpoint = baseURL.appending(path: path)
    let method: HTTPRequest.Method = .get

    let request = HTTPRequest(
      method: method,
      url: endpoint,
      headerFields: headers
    )

    let (data, _) = try await httpClient.execute(for: request, from: nil)

    let license = try decode(TemplateLicense.self, from: data)

    return license
  }
}
