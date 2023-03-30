//
//  ModelCategory.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class ModelCategory: Hashable {
  let id: Int
  let name: String

  init(
    id: Int,
    name: String
  ) {
    self.id = id
    self.name = name
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.id)
    hasher.combine(self.name)
  }

  static func == (lhs: ModelCategory, rhs: ModelCategory) -> Bool {
    return lhs.hashValue == rhs.hashValue
  }
}
