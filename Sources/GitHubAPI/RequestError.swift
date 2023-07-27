//
//  RequestError.swift
//

import Foundation

public enum RequestError: Error {
  case deleteRepository(data: Data)
}
