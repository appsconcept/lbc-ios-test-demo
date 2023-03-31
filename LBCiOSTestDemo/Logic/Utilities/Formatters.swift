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

  public static func `default`() -> DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone.init(abbreviation: "GMT")
    dateFormatter.locale = Locale.autoupdatingCurrent
    return dateFormatter
  }

  public static func getYYYYmmDDFromStringDate(stringDate: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .none
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    if let date = from(yyyyMmDdHHmmDate: stringDate) {
      return dateFormatter.string(from: date)
    } else {
      return stringDate
    }
  }

  public static func from(yyyyMmDdHHmmDate: String) -> Date? {
    let dateFormatter = Formatters.default()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    return dateFormatter.date(from: yyyyMmDdHHmmDate)
  }
}
