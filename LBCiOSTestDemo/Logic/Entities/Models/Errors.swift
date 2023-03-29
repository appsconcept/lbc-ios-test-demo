//
//  Errors.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

enum Errors: Error {
  case unknownError
  case generic(String)
}

extension Errors: LocalizedError {
  public var errorDescription: String? {
    switch self {
    case .unknownError:
      return "Unknown error"
    case .generic(let message):
      return message
    }
  }
}

