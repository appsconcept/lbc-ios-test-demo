//
//  Completion.swift
//  LBCiOSTestDemoTests
//
//  Created by Marco Appsconcept on 31/03/2023.
//

import Foundation

func awaitCompletion<T>(handler: @escaping (@escaping (T) -> Void) -> Void) -> T {
  var result: T? = nil
  let semaphore = DispatchSemaphore(value: 0)

  handler { handlerResult in
    result = handlerResult
    semaphore.signal()
  }

  semaphore.wait()

  return result!
}
