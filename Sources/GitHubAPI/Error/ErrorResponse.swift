//
//  ErrorResponse.swift
//

import Foundation

struct ErrorResponse: Codable {
  let message: String
  let documentationURL: URL
  
  private enum CodingKeys: String, CodingKey {
    case message
    case documentationURL = "documentation_url"
  }
  
  var error: RequestError? {
    switch message {
    case "Not Found": return .notFound
    case "Bad credentials": return .notAuthorized
    case "Requires authentication": return .requireAuthorization
    default: return nil
    }
  }
}
