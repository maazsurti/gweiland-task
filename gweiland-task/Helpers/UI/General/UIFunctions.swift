//
//  UIFunctions.swift
//  Nounou
//
//  Created by Maaz on 08/07/23.
//

import Foundation
import UIKit

func returnImage(isSystemImage: Bool = false, assetName: String, color: UIColor = .black) -> UIImage {
    
    var image = UIImage()
    
    if isSystemImage {
        
        image = UIImage(systemName: assetName) ?? UIImage()
        
    } else {
        
        image = UIImage(named: assetName) ?? UIImage()
    }
    
    image.withRenderingMode(.alwaysOriginal).withTintColor(color)
    
    return image
}


func returnPriceText(price: String?) -> String {
    let priceUnwrapped = price ?? ""
    return "\(priceUnwrapped) " + "KWD".localized()
}

func returnPriceText(price: Double?) -> String {
    let priceUnwrapped = price ?? 0.0
    return "\(priceUnwrapped) " + "KWD".localized()
}

func generateRandomNumber() -> Int {
    
    let upperBound = 1_000_000_000_000_000_000
    let lowerBound = 0
    return Int.random(in: lowerBound...upperBound)
}

func createSeparatorLine(color: UIColor) -> UIView {
    let v = UIView()
    v.backgroundColor = color
    return v
}

func getRemainingDaysInCurrentMonth(using currentDate: Date = Date()) -> [(date: Date, dayNumber: String, dayAbbreviation: String)] {
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd"

    let today = currentDate
    let endOfMonth = calendar.dateInterval(of: .month, for: today)?.end ?? today

    var remainingDays: [(date: Date, dayNumber: String, dayAbbreviation: String)] = []

    let currentDate = calendar.startOfDay(for: today)
    var date = currentDate

    while date < endOfMonth {
        let dayNumber = dateFormatter.string(from: date)
        let dayAbbreviation = dateFormatter.shortWeekdaySymbols[calendar.component(.weekday, from: date) - 1].uppercased()
        remainingDays.append((date, dayNumber, dayAbbreviation))
        date = calendar.date(byAdding: .day, value: 1, to: date)!
    }

    return remainingDays
}


func getCurrentMonthAndYear(from date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM yyyy"
    let formattedDate = dateFormatter.string(from: date)
    return formattedDate
}

func getFirstDayOfMonth(for date: Date) -> Date {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year, .month], from: date)
    return calendar.date(from: components)!
}

func getNextMonth(from date: Date) -> (string: String, date: Date) {
    let calendar = Calendar.current
    let nextMonthDate = calendar.date(byAdding: .month, value: 1, to: date)!

    if calendar.component(.month, from: nextMonthDate) == calendar.component(.month, from: Date()) {
        return (string: nextMonthDate.formattedForMonth, date: Date())
    }

    return (string: nextMonthDate.formattedForMonth, date: getFirstDayOfMonth(for: nextMonthDate))
}

func getPreviousMonth(from currentDate: Date) -> (string: String, date: Date) {
    let calendar = Calendar.current
    let currentMonth = calendar.component(.month, from: Date())
    var previousMonth = currentDate

    if calendar.component(.month, from: currentDate) != currentMonth {
        previousMonth = calendar.date(byAdding: .month, value: -1, to: currentDate)!
    }

    if calendar.component(.month, from: previousMonth) == currentMonth {
        return (string: previousMonth.formattedForMonth, date: Date())
    }

    return (string: previousMonth.formattedForMonth, date: getFirstDayOfMonth(for: previousMonth))
}

func getDateStringForAPI(for date: Date) -> String{
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    return dateFormatter.string(from: date)
}

extension Date{
    
    var formattedForMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
 
}

func attributedString(withText text: String) -> NSAttributedString {
    return NSAttributedString(
        string: text,
        attributes: [
            .foregroundColor: UIColor.darkText, // Change the color as needed
            .font: UIFont.CustomFont() // Change the font as needed
        ]
    )
}
