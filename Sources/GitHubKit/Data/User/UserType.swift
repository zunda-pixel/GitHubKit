//
//  UserType.swift
//

import Foundation

public enum UserType: String, Codable, Sendable {
  case user = "User"
  case organization = "Organization"
  case mannequin = "Mannequin"
  case bot = "Bot"
}
