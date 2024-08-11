//
//  AuthorizationType.swift
//

import Foundation

public enum AuthorizationType: Sendable, Hashable {
  case bearerToken(accessToken: String)
  case withoutToken
}
