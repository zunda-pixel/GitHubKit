//
//  Codable++.swift
//

import Foundation

extension JSONDecoder {
  static public var github: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return decoder
  }
}

extension JSONEncoder {
  static public var github: JSONEncoder {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    return encoder
  }
}
