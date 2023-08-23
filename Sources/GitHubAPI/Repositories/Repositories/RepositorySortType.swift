//
//  RepositorySortType.swift
//

import Foundation

public enum RepositorySortType: String, Sendable {
  case created
  case updated
  case pushed
  case fullName = "full_name"
}
