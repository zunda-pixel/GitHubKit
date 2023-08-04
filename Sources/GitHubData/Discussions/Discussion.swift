//
//  Discussion.swift
//

import Foundation

public struct Discussion: Codable, Hashable, Sendable, Identifiable {
  public let id: String
  public let author: User
  public let createdAt: Date
  public let activeLockReason: ActiveLockReason?
  public let authorAssociation: AuthorAssociation
  public let body: String
  public let bodyHTML: String
  public let bodyText: String
  public let createdViaEmail: Bool
  public let databaseId: Int
  public let editor: User?
  public let includesCreatedEdit: Bool
  public let lastEditedAt: Date?
  public let locked: Bool
  public let comments: [Comment]
  public let category: Category
  
  public init(
    id: String,
    author: User,
    createdAt: Date,
    activeLockReason: ActiveLockReason?,
    authorAssociation: AuthorAssociation,
    body: String,
    bodyHTML: String,
    bodyText: String,
    createdViaEmail: Bool,
    databaseId: Int,
    editor: User?,
    includesCreatedEdit: Bool,
    lastEditedAt: Date?,
    locked: Bool,
    comments: [Comment]
    category: Category
  ) {
    self.id = id
    self.author = author
    self.createdAt  = createdAt
    self.activeLockReason = activeLockReason
    self.authorAssociation = authorAssociation
    self.body = body
    self.bodyHTML = bodyHTML
    self.bodyText = bodyText
    self.createdViaEmail = createdViaEmail
    self.databaseId = databaseId
    self.editor = editor
    self.includesCreatedEdit = includesCreatedEdit
    self.lastEditedAt = lastEditedAt
    self.locked = locked
    self.comments = comments
    self.category = category
  }
  
    
  private enum CodingKeys: String, CodingKey {
    case id
    case author
    case createdAt
    case activeLockReason
    case authorAssociation
    case body
    case bodyHTML
    case bodyText
    case createdViaEmail
    case databaseId
    case editor
    case includesCreatedEdit
    case lastEditedAt
    case locked
    case comments
    case category
  }
  
  private enum NodesCodingKeys: String, CodingKey {
    case nodes
  }
    
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(String.self, forKey: .id)
    self.author = try container.decode(Discussion.User.self, forKey: .author)
    self.createdAt = try container.decode(Date.self, forKey: .createdAt)
    self.activeLockReason = try container.decodeIfPresent(ActiveLockReason.self, forKey: .activeLockReason)
    self.authorAssociation = try container.decode(AuthorAssociation.self, forKey: .authorAssociation)
    self.body = try container.decode(String.self, forKey: .body)
    self.bodyHTML = try container.decode(String.self, forKey: .bodyHTML)
    self.bodyText = try container.decode(String.self, forKey: .bodyText)
    self.createdViaEmail = try container.decode(Bool.self, forKey: .createdViaEmail)
    self.databaseId = try container.decode(Int.self, forKey: .databaseId)
    self.editor = try container.decodeIfPresent(Discussion.User.self, forKey: .editor)
    self.includesCreatedEdit = try container.decode(Bool.self, forKey: .includesCreatedEdit)
    self.lastEditedAt = try container.decodeIfPresent(Date.self, forKey: .lastEditedAt)
    self.locked = try container.decode(Bool.self, forKey: .locked)
    let commentsContainer = try container.nestedContainer(keyedBy: NodesCodingKeys.self, forKey: .comments)
    self.comments = try commentsContainer.decode([Comment].self, forKey: .nodes)
    self.category = try container.decode(Category.self, forKey: .category)
  }
}
