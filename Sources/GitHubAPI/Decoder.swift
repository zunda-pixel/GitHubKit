//
//  Decoder.swift
//

import Foundation

extension GitHubAPI {
  func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
    let decoder = JSONDecoder.github
    do {
      return try decoder.decode(type.self, from: data)
    } catch let decodeError {
      let errorResponse = try decoder.decode(ErrorResponse.self, from: data)
      if let error = errorResponse.error {
        throw error
      } else {
        throw UnknownError(error: errorResponse, decodeError: decodeError, data: data)
      }
    }
  }
}
