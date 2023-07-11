//
//  IssueAuthorAssociation.swift
//

import Foundation


extension Issue {
  public enum AuthorAssociation: String, Codable, Sendable {
    case collaborator = "COLLABORATOR"
    case contributor = "CONTRIBUTOR"
    case firstTimer = "FIRST_TIMER"
    case firstTimeContributor = "FIRST_TIME_CONTRIBUTOR"
    case mannequin = "MANNEQUIN"
    case member = "MEMBER"
    case none = "NONE"
    case owner = "OWNER"
    
    public init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      let rawValue = try container.decode(String.self)
      self.init(rawValue: rawValue)!
    }
    
    public func encode(to encoder: Encoder) throws {
      var container = encoder.singleValueContainer()
      try container.encode(rawValue)
    }
  }
}
