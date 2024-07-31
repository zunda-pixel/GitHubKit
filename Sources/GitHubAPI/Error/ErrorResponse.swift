//
//  ErrorResponse.swift
//

import Foundation

public struct ErrorResponse: Codable, Sendable {
  public let message: String
  public let documentationURL: URL

  private enum CodingKeys: String, CodingKey {
    case message
    case documentationURL = "documentation_url"
  }

  var error: RequestError? {
    switch message {
    case "Not Found": return .notFound
    case "Bad credentials": return .notAuthorized
    case "Requires authentication": return .requireAuthorization
    case "This endpoint requires you to be authenticated.": return .requireAuthorization
    default: return nil
    }
  }
}
