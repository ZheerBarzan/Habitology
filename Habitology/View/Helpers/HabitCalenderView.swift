//
//  HabitCalenderView.swift
//  Habitology
//
//  Created by zheer barzan on 10/11/25.
//

import SwiftUI

struct HabitCalenderView: View {
    var createdAt: Date
    var frequency: [Frequency]
    var completedDays: [TimeInterval]
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 12)
        {

            ForEach(Frequency.allCases, id: \.rawValue) { frequency in
                Text(frequency.rawValue.prefix(3))
                    .font(.caption)
                    .foregroundStyle(.gray)
            }

            ForEach(0..<Date.startOffsetOfThisMonth, id: \.self) { _ in
                Circle()
                    .fill(.clear)
                    .frame(height: 40)
                    .hSpacing(.center)
            }

            //this months date
            ForEach(Date.datesInThisMonth, id: \.self) { date in
                let day = date.format("d")
                Text(day)
                    .font(.caption)
                    .frame(height: 40)
                    .hSpacing(.center)
                    .background {
                        let isHabitCompleted = completedDays.contains {
                            $0 == date.timeIntervalSince1970
                        }
                        let isHabitDay = frequency.contains {
                            $0.rawValue == date.weekday
                        }

                        let isFutureHabit = date.StartOfDay > Date()

                        if isHabitCompleted && isHabitDay {
                            Circle()
                                .fill(.green.tertiary)
                        } else if isHabitDay && !isFutureHabit {
                            Circle()
                                .fill(.red.tertiary)

                        } else {
                            if isHabitDay {
                                Circle()
                                    .fill(.fill)
                            }
                        }

                    }

            }

        }
    }
}

#Preview {
    HabitCalenderView(
        createdAt: .now,
        frequency: Frequency.allCases,  // or a subset you expect
        completedDays: []  // or [Date.now.timeIntervalSince1970] etc.
    )
}
