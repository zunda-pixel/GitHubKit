//
//  VerifyResopnseStatus.swift
//

import Foundation
import HTTPTypes

extension GitHubAPI {
  func verifyResopnseStatus(httpResponse: HTTPResponse) throws {
    try verifyResponseStatus(code: httpResponse.status.code)
  }
  
  func verifyResopnseStatus(urlResopnse: URLResponse) throws {
    guard let response = (urlResopnse as? HTTPURLResponse)?.httpResponse else {
      throw HTTPTypeConversionError.failedToConvertURLResponseToHTTPResponse
    }
    
    try verifyResponseStatus(code: response.status.code)
  }
  
  func verifyResponseStatus(code: Int) throws {
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

private enum HTTPTypeConversionError: Error {
  case failedToConvertHTTPRequestToURLRequest
  case failedToConvertURLResponseToHTTPResponse
}
