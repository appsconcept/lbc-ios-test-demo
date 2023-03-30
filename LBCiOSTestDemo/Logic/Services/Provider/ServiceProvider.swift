//
//  ServiceProvider.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

protocol ServiceProvider {
  var remoteDataLoaderService: DataLoaderService { get }
  var adsService: AdsService { get }
}
