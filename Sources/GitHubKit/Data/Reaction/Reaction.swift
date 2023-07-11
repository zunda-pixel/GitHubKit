//
//  Reaction.swift
//

import Foundation

public struct Reaction: Codable, Sendable, Hashable {
  public let url: URL
  public let totalCount: Int
  public let plusOne: Int
  public let minusOne: Int
  public let laughCount: Int
  public let hoorayCount: Int
  public let confusedCount: Int
  public let heartCount: Int
  public let rockerCount: Int
  public let eyesCount: Int

  private enum CodingKeys: String, CodingKey {
    case url
    case totalCount = "total_count"
    case plusOne = "+1"
    case minusOne = "-1"
    case laughCount = "laugh"
    case hoorayCount = "hooray"
    case confusedCount = "confused"
    case heartCount = "heart"
    case rockerCount = "rocket"
    case eyesCount = "eyes"
  }
}
