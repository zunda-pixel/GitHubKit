//
//  UsersResponse.swift
//

import Foundation

public struct UsersResponse: Codable {
  let totalCount: Int
  let incompleteResults: Bool
  var users: [User]
  
  private enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case incompleteResults = "incomplete_results"
    case users = "items"
  }
}

