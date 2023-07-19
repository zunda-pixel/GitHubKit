//
//  Subject.swift
//

import Foundation

public struct Subject: Codable, Hashable, Sendable {
  public let title: String
  public let url: URL
  public let latestCommitURL: URL?
  public let type: String
  
  public init(
    title: String,
    url: URL,
    latestCommitURL: URL?,
    type: String
  ) {
    self.title = title
    self.url = url
    self.latestCommitURL = latestCommitURL
    self.type = type
  }
  
  private enum CodingKeys: String, CodingKey {
    case title
    case url
    case latestCommitURL = "latest_comment_url"
    case type
  }
}
