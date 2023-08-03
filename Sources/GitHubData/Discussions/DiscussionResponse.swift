//
//  DiscussionResponse.swift
//

import Foundation

public struct DiscussionResponse: Decodable, Sendable {
  public let discussions: [Discussion]
  
  private enum CodingKeys: String, CodingKey {
    case data
    case repository
    case discussions
    case nodes
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let dataContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
    let repositoryContainer = try dataContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .repository)
    let discussionsContainer = try repositoryContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .discussions)
    let discussions = try discussionsContainer.decode([Discussion].self, forKey: .nodes)
    self.discussions = discussions
  }
}
