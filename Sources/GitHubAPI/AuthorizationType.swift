//
//  AuthorizationType.swift
//

import Foundation

public enum AuthorizationType: Sendable {
  case bearerToken(accessToken: String)
  case withoutToken
}
