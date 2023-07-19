//
//  MergeState.swift
//

import Foundation

extension Merge {
  public enum Method: String, Codable, Sendable {
    case merge
    case squash
    case rebase
  }
}
