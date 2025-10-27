//
//  ContentView.swift
//  Habitology
//
//  Created by zheer barzan on 31/3/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("isIntroComplete") private var isIntroCompleted: Bool = false

    var body: some View {
        ZStack{
            if isIntroCompleted{
                HomeView().transition(.move(edge: .trailing))
            }else{
                IntroPageView().transition(.move(edge: .leading))
            }
        }
        .animation(.snappy(duration: 0.3, extraBounce: 0), value: isIntroCompleted)
    }
}
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
