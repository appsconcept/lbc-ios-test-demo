//
//  ModelClassifiedAd.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class ModelClassifiedAd {
  let id: Int
  let categoryId: Int
  let title: String
  let description: String
  let price: Float
  let imagesUrl: ModelImagesUrl
  let creationDate: String
  let isUrgent: Bool

  init(
    id: Int,
    categoryId: Int,
    title: String,
    description: String,
    price: Float,
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
}
