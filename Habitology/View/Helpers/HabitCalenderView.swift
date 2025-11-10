//
//  HabitCalenderView.swift
//  Habitology
//
//  Created by zheer barzan on 10/11/25.
//


import SwiftUI

struct HabitCalenderView: View {
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 12) {
            
            ForEach(Frequency.allCases, id: \.rawValue){ frequency in
                Text(frequency.rawValue.prefix(3))
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            //this months date
            ForEach(Date.datesInThisMonth, id: \.self) { date in
                let day = date.format( "d")
                Text(day)
                    .font(.caption)
                    .frame(height: 40)
                    .hSpacing(.center)
                    .background(
                        Circle()
                            .fill(.fill)
                    
                    )
                
            }
            
        }
    }
}

#Preview {
    HabitCalenderView()
}
