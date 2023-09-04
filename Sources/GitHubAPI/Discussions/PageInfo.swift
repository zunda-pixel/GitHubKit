//
//  PageInfo.swift
//

import Foundation

public struct PageInfo: Sendable, Decodable {
  public let endCursor: String
  public let hasNextPage: Bool
  public let hasPreviousPage: Bool
  public let startCursor: String
}
