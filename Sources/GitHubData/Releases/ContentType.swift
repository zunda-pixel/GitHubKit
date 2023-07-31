//
//  ContentType.swift
//

import Foundation

extension Asset {
  public enum ContentType: String, Codable, Sendable {
    case zip = "application/zip"
    case octetStream = "application/octet-stream"
    case xTar = "application/x-tar"
    case pgpSignature = "application/pgp-signature"
    case xDebianPackage = "application/x-debian-package"
    case xGzip = "application/x-gzip"
  }
}
