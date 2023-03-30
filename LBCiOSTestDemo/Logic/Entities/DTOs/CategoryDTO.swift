//
//  CategoryDTO.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class CategoryDTO: Decodable {
  let id: Int
  let name: String

  init(
    id: Int,
    name: String
  ) {
    self.id = id
    self.name = name
  }

  func toModel() -> ModelCategory {
    return ModelCategory(
      id: self.id,
      name: self.name
    )
  }

  enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
  }
}

