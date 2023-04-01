//
//  LaunchViewModel.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 01/04/2023.
//

import Foundation

class LaunchViewModel {
  private let bootloader: Bootloader

  init(bootloader: Bootloader) {
    self.bootloader = bootloader
  }

  func bootstrap(completion: @escaping (Bool) -> Void) {
    self.bootloader.start(loadCompletion: completion)
  }
}
