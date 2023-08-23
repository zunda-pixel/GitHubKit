//
//  GitHubError.swift
//

import Foundation
import HTTPTypes

public enum GitHubError: Error, Sendable {
  case request(request: HTTPRequest)
  case decode(data: Data, response: HTTPResponse)
}
