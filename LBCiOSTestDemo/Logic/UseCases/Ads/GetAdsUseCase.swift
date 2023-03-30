//
//  GetAdsUseCase.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class GetAdsUseCase {
  let repository: AdsRepository

  init(repository: AdsRepository) {
    self.repository = repository
  }

  func execute(completion: @escaping (Result<[ModelClassifiedAd], Error>) -> Void) {
    self.repository.getAds(completion: completion)
  }
}
