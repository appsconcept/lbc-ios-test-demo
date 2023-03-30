//
//  AdsListingViewModel.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

// All of the ViewController's logic is made in this class.
// An example can be to have reactive streams to propagate asynchronously data to the UI.
// All calls to the logic components from the UI is made here.
class AdsListingViewModel {
  private let getAdsUseCase: GetAdsUseCase

  init(getAdsUseCase: GetAdsUseCase) {
    self.getAdsUseCase = getAdsUseCase
  }

  func load(completion: @escaping (Result<[ModelClassifiedAd], Error>) -> Void) {
    self.getAdsUseCase.execute(completion: completion)
  }
}
