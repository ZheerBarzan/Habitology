//
//  HomeView.swift
//  Habitology
//
//  Created by zheer barzan on 27/10/25.
//


import SwiftUI

struct HomeView: View {
    @AppStorage("username") private var username: String = ""

    var body: some View {
        ScrollView(.vertical){
            LazyVStack(spacing: 20) {
                headerView()
            }.padding(20)
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    //Header View
    
    @ViewBuilder
    func headerView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Welcome back, \(username)")
                .font(.title.bold().monospaced())
                .lineLimit(1)
                .foregroundColor(.primary)
        }
        .hSpacing(.leading)
    }
}

#Preview {
    HomeView()
}
