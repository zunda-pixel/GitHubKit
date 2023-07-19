//
//  AuthorizationType.swift
//

import Foundation

public enum AuthorizationType {
  case bearerToken(accessToken: String)
  case withoutToken
}
