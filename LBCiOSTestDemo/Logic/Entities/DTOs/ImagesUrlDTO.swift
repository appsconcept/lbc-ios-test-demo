//
//  ImageDTO.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

class ImagesUrlDTO: Decodable {
  let small: String?
  let thumb: String?

  init(
    small: String?,
    thumb: String?
  ) {
    self.small = small
    self.thumb = thumb
  }

  enum CodingKeys: String, CodingKey {
    case small = "small"
    case thumb = "thumb"
  }
}
