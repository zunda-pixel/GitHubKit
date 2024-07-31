//
//  RequestError.swift
//

import Foundation

public enum RequestError: Error, Sendable {
  case deleteRepository(data: Data)
  case deleteProtectionTag(data: Data)
  case notFound
  case notAuthorized
  case requireAuthorization
  case notModified
  case forbidden
  case validationFailedOrEndpointHasBeenSpammed
  case unknown
}
