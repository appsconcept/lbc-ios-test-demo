//
//  AdsRepository.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

protocol AdsRepository {
  func getAds(completion: @escaping (Result<[ModelClassifiedAd], Error>) -> Void)
}
