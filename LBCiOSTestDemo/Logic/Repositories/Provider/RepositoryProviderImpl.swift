//
//  RepositoryProviderImpl.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

class RepositoryProviderImpl: RepositoryProvider {
  var adsRepository: AdsRepository

  init(services: ServiceProvider) {
    self.adsRepository = AdsRepositoryImpl(service: services.adsService)
  }
}
