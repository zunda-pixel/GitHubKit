//
//  HTTPRequest++.swift
//

import Foundation
import HTTPTypes
import HTTPTypesFoundation

extension HTTPRequest {
  public init(
    method: HTTPRequest.Method,
    url: URL,
    queries: [String: String],
    headers: HTTPFields
  ) {
    var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
    components.queryItems = queries.map { .init(name: $0.key, value: $0.value) }

    self.init(method: method, url: components.url!, headerFields: headers)
  }
}
