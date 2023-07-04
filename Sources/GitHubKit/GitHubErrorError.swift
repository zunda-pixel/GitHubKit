//
//  OAuthError.swift
//

import Foundation

public enum GitHubError: Error {
  case request(request: URLRequest)
  case decode(data: Data, response: URLResponse)
}
