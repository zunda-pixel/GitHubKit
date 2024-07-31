//
//  UnknownError.swift
//

import Foundation

public struct UnknownError: Error, Sendable {
  public let error: ErrorResponse
  public let decodeError: any Error
  public let data: Data
}
