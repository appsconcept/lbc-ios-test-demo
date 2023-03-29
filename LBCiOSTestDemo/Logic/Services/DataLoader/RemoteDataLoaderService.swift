//
//  RemoteDataLoaderService.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

enum RemoteDataLoaderServiceErrors: Error, LocalizedError {
  case invalidStatusCode(Int, String?)

  public var errorDescription: String? {
    switch self {
    case .invalidStatusCode(let code, let message):
      if let message = message {
        return message
      }
      return "Invalid status code: \(code)"
    }
  }
}

class RemoteDataLoaderService: DataLoaderService {
  private var session: URLSession

  init() {
    self.session = URLSession.shared
  }

  func load(request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
    session.dataTask(with: request) { data, response, error in
      completion(data, self.parseError(error: error))
    }
  }

  private func parseError(error: Error?) -> Error? {
    if let error = error as? URLError,
       error.errorCode < 200 && error.errorCode >= 300 {
      return RemoteDataLoaderServiceErrors.invalidStatusCode(error.errorCode, error.localizedDescription)
    }

    return error
  }
}
