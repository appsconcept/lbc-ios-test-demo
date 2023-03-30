//
//  AdDTO.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

class ClassifiedAdDTO: Decodable {
  let id: Int
  let categoryId: Int
  let title: String
  let description: String
  let price: Float
  let imagesUrl: ImagesUrlDTO
  let creationDate: String
  let isUrgent: Bool

  init(
    id: Int,
    categoryId: Int,
    title: String,
    description: String,
    price: Float,
    imagesUrl: ImagesUrlDTO,
    creationDate: String,
    isUrgent: Bool
  ) {
    self.id = id
    self.categoryId = categoryId
    self.title = title
    self.description = description
    self.price = price
    self.imagesUrl = imagesUrl
    self.creationDate = creationDate
    self.isUrgent = isUrgent
  }

  enum CodingKeys: String, CodingKey {
    case id = "id"
    case categoryId = "category_id"
    case title = "title"
    case description = "description"
    case price = "price"
    case imagesUrl = "images_url"
    case creationDate = "creation_date"
    case isUrgent = "is_urgent"
  }
}
