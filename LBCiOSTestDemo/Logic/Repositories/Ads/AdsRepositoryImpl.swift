//
//  AdsRepositoryImpl.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class AdsRepositoryImpl: AdsRepository {
  let service: AdsService

  init(service: AdsService) {
    self.service = service
  }

  func getAds(completion: @escaping (Result<[ModelClassifiedAd], Error>) -> Void) {
    self.service.getAds { result in
      switch result {
      case .success(let ads):
        completion(Result.success(ads.map({ $0.toModel() })))
      case .failure(let error):
        completion(Result.failure(error))
      }
    }
  }
}
