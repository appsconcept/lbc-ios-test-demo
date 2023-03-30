//
//  ModelClassifiedAd.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class ModelClassifiedAd: Hashable {
  let id: Int
  let categoryId: Int
  let title: String
  let description: String
  let price: String
  let imagesUrl: ModelImagesUrl
  let creationDate: String
  let isUrgent: Bool

  init(
    id: Int,
    categoryId: Int,
    title: String,
    description: String,
    price: String,
    imagesUrl: ModelImagesUrl,
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

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.id)
    hasher.combine(self.categoryId)
    hasher.combine(self.title)
    hasher.combine(self.description)
    hasher.combine(self.price)
    hasher.combine(self.imagesUrl)
    hasher.combine(self.creationDate)
    hasher.combine(self.isUrgent)
  }

  static func == (lhs: ModelClassifiedAd, rhs: ModelClassifiedAd) -> Bool {
    return lhs.hashValue == rhs.hashValue
  }
}
