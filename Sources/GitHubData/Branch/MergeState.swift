//
//  MergeState.swift
//

import Foundation

extension AutoMerge {
  public enum Method: String, Codable, Sendable {
    case merge
    case squash
    case rebase
  }
}
