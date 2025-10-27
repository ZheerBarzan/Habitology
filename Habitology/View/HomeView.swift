//
//  HomeView.swift
//  Habitology
//
//  Created by zheer barzan on 27/10/25.
//


import SwiftUI

struct HomeView: View {
    @AppStorage("isIntroComplete") private var isIntroCompleted: Bool = false

    var body: some View {
        
        Text("hello world")
    }
}

#Preview {
    HomeView()
}
