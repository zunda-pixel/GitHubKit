//
//  MergeCommit.swift
//

import Foundation

public enum MergeCommitMessage: String, Codable, Sendable {
  case prTitle = "PR_TITLE"
  case prBody = "PR_BODY"
  case blank = "BLANK"
}

public enum MergeCommitTitle: String, Codable, Sendable {
  case prTitle = "PR_TITLE"
  case mergeMessage = "MERGE_MESSAGE"
}
