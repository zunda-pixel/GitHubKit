//
//  UnknownError.swift
//

import Foundation

public struct UnknownError: Error {
  public let decodeError: any Error
  public let data: Data
}
