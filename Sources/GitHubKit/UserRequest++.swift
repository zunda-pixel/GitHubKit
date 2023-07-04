//
//  UserRequest++.swift
//

import Foundation
import HTTPMethod

extension URLRequest {
  init(
    url: URL,
    method: HTTPMethod,
    queries: [String: String],
    headers: [String: String]
  ) {
    var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    components.queryItems = queries.map { .init(name: $0.key, value: $0.value) }
    
    var request = URLRequest(url: components.url!)
    request.allHTTPHeaderFields = headers
    request.httpMethod = method.rawValue
    
    self = request
  }
}
