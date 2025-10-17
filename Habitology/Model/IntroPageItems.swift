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
    var description: String
    
}

let staticIntroItems: [IntroPageItems] = [
    .init(
        image: "calendar.circle.fill",
        title: "Track your daily habits",
        description: ""),
    .init(
        image: "checkmark.circle.fill",
        title: "Stay on track and maintain consistency",
        scale: 0.6,
        anchor: .topLeading,
        offset: -75,
        rotation: 30,
        description: "Habitology lets you form new habits and maintain consistency by tracking your daily progress\n and reminding you to stay on track."),
    .init(
        image: "star.circle.fill",
        title: "Achieve your goals",
        scale: 0.6,
        anchor: .bottomLeading,
        offset: -65,
        rotation: -35,
        description: "Celebrate milestones and stay motivated to achieve your goals."),
    .init(
        image: "flame.circle.fill",
        title: "Stay motivated and inspired",
        scale: 0.4,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 160,
        extraOffset: -120,
        description: "track streaks and see your imporvement over time."),
    .init(
        image: "clock.circle.fill",
        title: "Save time and stay organized",
        scale: 0.35,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 250,
        extraOffset: -100,
        description: "measure your progress overtime and adujst your habits to achieve your goals."),
]
