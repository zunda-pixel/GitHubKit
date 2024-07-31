//
//  NotificationReason.swift
//

import Foundation

extension Notification {
  public enum Reason: String, Codable, Sendable {
    case subscribed
    case stateChange = "state_change"
    case author
    case mention
  }
}
