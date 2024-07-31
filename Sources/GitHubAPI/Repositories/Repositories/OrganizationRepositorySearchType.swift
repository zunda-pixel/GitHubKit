//
//  OrganizationRepositorySearchType.swift
//

import Foundation

public enum OrganizationRepositorySearchType: String, Sendable {
  case all
  case `public`
  case `private`
  case forks
  case sources
  case member
}
