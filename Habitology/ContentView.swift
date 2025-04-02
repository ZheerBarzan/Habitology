//
//  ContentView.swift
//  Habitology
//
//  Created by zheer barzan on 31/3/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        IntroPageView()
    }
}
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
