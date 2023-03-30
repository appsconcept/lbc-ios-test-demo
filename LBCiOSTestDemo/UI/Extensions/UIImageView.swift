//
//  UIImageView.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation
import UIKit

extension UIImageView {
  public func imageFromUrl(urlString: String?) {
    if let urlString = urlString,
       let url = URL(string: urlString) {
      ImageCache.shared.image(from: url) { image in
        if let image = image {
          self.image = image
        } else {
          self.image = UIImage(named: "NoImage")
        }
      }
    } else {
      self.image = UIImage(named: "NoImage")
    }
  }
}
