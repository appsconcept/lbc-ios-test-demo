//
//  ModelImagesUrl.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class ModelImagesUrl: Hashable {
  let small: String?
  let thumb: String?

  init(
    small: String?,
    thumb: String?
  ) {
    self.small = small
    self.thumb = thumb
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.small)
    hasher.combine(self.thumb)
  }

  static func == (lhs: ModelImagesUrl, rhs: ModelImagesUrl) -> Bool {
    return lhs.hashValue == rhs.hashValue
  }
}
