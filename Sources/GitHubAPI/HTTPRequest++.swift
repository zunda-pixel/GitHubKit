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
    headers: [String: String]
  ) {
    var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    components.queryItems = queries.map { .init(name: $0.key, value: $0.value) }

    let headerFields: HTTPFields = headers.reduce(into: HTTPFields()) { fields, dic in
      fields[HTTPField.Name(dic.key)!] = dic.value
    }

    self.init(method: method, url: components.url!, headerFields: headerFields)
  }
}
