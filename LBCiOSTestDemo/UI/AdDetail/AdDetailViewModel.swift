//
//  AdDetailViewModel.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 31/03/2023.
//

import Foundation

class AdDetailViewModel {
  private let classifiedAd: ModelClassifiedAd

  init(classifiedAd: ModelClassifiedAd) {
    self.classifiedAd = classifiedAd
  }

  func load() -> ModelClassifiedAd {
    return classifiedAd
  }
}
