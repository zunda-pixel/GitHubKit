//
//  UnknownError.swift
//

import Foundation

public struct UnknownError: Error {
  let decodeError: any Error
  let data: Data
}
