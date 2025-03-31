//
//  Item.swift
//  Habitology
//
//  Created by zheer barzan on 31/3/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
