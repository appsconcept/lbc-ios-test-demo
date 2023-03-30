//
//  UseCaseProvider.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

protocol UseCaseProvider {
  func provideGetAdsUseCase() -> GetAdsUseCase
  func provideLoadCategoriesUseCase() -> LoadCategoriesUseCase
}
