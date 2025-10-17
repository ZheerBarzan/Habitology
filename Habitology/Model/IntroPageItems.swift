//
//  IntroPageItems.swift
//  Habitology
//
//  Created by zheer barzan on 31/3/25.
//

import SwiftUI

struct IntroPageItems: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
    
    var scale: CGFloat = 1.0
    var anchor: UnitPoint = .center
    var offset: CGFloat = 0
    var rotation: CGFloat = 0
    var zIndex: CGFloat = 0
    
    var extraOffset: CGFloat = -350
    
    
}

let staticIntroItems: [IntroPageItems] = [
    .init(
        image: "calendar.circle.fill",
        title: "Track your daily habits",
       ),
    .init(
        image: "checkmark.circle.fill",
        title: "Stay on track and maintain consistency",
        scale: 0.6,
        anchor: .topLeading,
        offset: -75,
        rotation: 30,
        ),
    .init(
        image: "star.circle.fill",
        title: "Achieve your goals",
        scale: 0.6,
        anchor: .bottomLeading,
        offset: -65,
        rotation: -35,
        ),
    .init(
        image: "flame.circle.fill",
        title: "Stay motivated and inspired",
        scale: 0.4,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 160,
        extraOffset: -120,
        ),
    .init(
        image: "clock.circle.fill",
        title: "Save time and stay organized",
        scale: 0.35,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 250,
        extraOffset: -100,
       ),
]
