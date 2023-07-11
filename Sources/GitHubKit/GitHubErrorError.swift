//
//  OAuthError.swift
//

import Foundation
import HTTPTypes

public enum GitHubError: Error {
  case request(request: HTTPRequest)
  case decode(data: Data, response: HTTPResponse)
}
