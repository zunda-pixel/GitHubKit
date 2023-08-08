//
//  SubscriptionState.swift
//

import Foundation

public enum SubscriptionState: String, Codable, Sendable {
  case ignored = "IGNORED"
  case subscribed = "SUBSCRIBED"
  case unSubscribed = "UNSUBSCRIBED"
}
