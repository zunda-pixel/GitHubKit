//
//  PageInfo.swift
//

import Foundation

public struct PageInfo: Sendable, Decodable {
  public let startCursor: String?
  public let endCursor: String?
  public let hasNextPage: Bool
  public let hasPreviousPage: Bool
}
