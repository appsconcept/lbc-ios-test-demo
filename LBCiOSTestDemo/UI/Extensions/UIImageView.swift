//
//  UIImageView.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation
import UIKit

extension UIImageView {
  public func imageFromUrl(urlString: String?, with id: Int) {
    if let urlString = urlString,
       let url = URL(string: urlString) {
      ImageCache.shared.image(from: url) { image in
        if let image = image {
          // If tag does not match the given id then the cell is now being used for a new item and thus ignore this image
          if self.tag == id {
            self.image = image
          }
        } else {
          self.image = UIImage(named: "NoImage")
        }
      }
    } else {
      self.image = UIImage(named: "NoImage")
    }
  }
}
