//
//  PermissionType.swift
//

import Foundation

public enum PermissionType: String, Codable, Sendable {
  case pull
  case triage
  case push
  case maintain
  case admin
}
