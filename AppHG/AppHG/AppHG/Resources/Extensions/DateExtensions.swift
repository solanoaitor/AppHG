//
//  DateExtensions.swift
//  AppHG
//
//  Created by Aitor Solano on 21/5/24.
//

import Foundation

extension Date {
    func formatted(as format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    func addingYears(_ years: Int) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.year = years
        return Calendar.current.date(byAdding: dateComponents, to: self)
    }
}
