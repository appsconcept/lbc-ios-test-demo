//
//  AdsService.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

protocol AdsService {
  func getAds(completion: @escaping (Result<[ClassifiedAdDTO], Error>) -> Void)
}
