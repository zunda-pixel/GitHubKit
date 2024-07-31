//
//  VerifyResopnseStatus.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  func verifyResponseStatus(response: HTTPResponse) throws {
    try verifyResponseStatus(code: response.status.code)
  }

  private func verifyResponseStatus(code: Int) throws {
    switch code {
    case 200: break
    case 304: throw RequestError.notModified
    case 401: throw RequestError.requireAuthorization
    case 403: throw RequestError.forbidden
    case 404: throw RequestError.notFound
    case 422: throw RequestError.validationFailedOrEndpointHasBeenSpammed
    default: throw RequestError.unknown
    }
  }
}
