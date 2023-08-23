//
//  RepositorySearchSortType.swift
//

import Foundation

public enum RepositorySearchSortType: String, Sendable {
  case stars
  case forks
  case helpWantedIssues = "help-wanted-issues"
  case updated
}
