//
//  Date+Exetensions.swift
//  Habitology
//
//  Created by zheer barzan on 28/10/25.
//

import SwiftUI

extension Date{
    var weekday: String {
        let calendar = Calendar.current
        let weekday = calendar.weekdaySymbols[calendar.component(.weekday, from: self) - 1]
        return weekday
        
    }
    
    var StartOfDay: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: self)
    }
    
    var isToday: Bool {
        let calendar = Calendar.current
        return calendar.isDateInToday(self)
    }
    
    static var startDayOfThisMonth: Date {
        let calender = Calendar.current
        guard let date = calender.date(from: calender.dateComponents([.year, .month], from: .now)) else{
            fatalError("cannot retireve the date of this month")
        }
        return date
    }
    
    // Todo dates of this month
}
