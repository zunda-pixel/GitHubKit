//
//  EventPage.swift
//

import Foundation

extension Event {
  public struct Page: Codable, Sendable, Hashable {
    public let name: String
    public let title: String
    public let summary: String?
    public let action: String
    public let sha: String
    public let htmlURL: URL

    private enum CodingKeys: String, CodingKey {
      case name = "page_name"
      case title
      case summary
      case action
      case sha
      case htmlURL = "html_url"
    }

    public init(
      name: String,
      title: String,
      summary: String?,
      action: String,
      sha: String,
      htmlURL: URL
    ) {
      self.name = name
      self.title = title
      self.summary = summary
      self.action = action
      self.sha = sha
      self.htmlURL = htmlURL
    }
  }
}
