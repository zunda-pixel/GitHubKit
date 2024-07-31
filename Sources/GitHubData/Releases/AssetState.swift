//
//  AssetState.swift
//

import Foundation

extension Asset {
  public enum State: String, Codable, Sendable {
    case uploaded
    case open
  }
}
