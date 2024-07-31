//
//  SocialAccount.swift
//

import Foundation

public struct SocialAccount: Codable {
  public let provider: String
  public let url: URL

  public init(
    provider: String,
    url: URL
  ) {
    self.provider = provider
    self.url = url
  }
}
