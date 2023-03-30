//
//  Formatters.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import UIKit

class Formatters {
  static func oneDecimalCaseCurrencyFormattedValue(number: Float) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "fr_FR")
    formatter.currencyCode = "EUR"
    formatter.numberStyle = .currency
    formatter.minimumFractionDigits = (number.truncatingRemainder(dividingBy: 1) == 0) ? 0 : 1

    return formatter.string(for: number) ?? String(format: "%.1f €", number)
  }
}
