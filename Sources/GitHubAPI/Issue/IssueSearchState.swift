//
//  IssueSearchState.swift
//

import Foundation

public enum IssueSearchState: String, CaseIterable, Identifiable, Sendable {
  case open
  case closed
  case all

  public var id: Self { self }
}
