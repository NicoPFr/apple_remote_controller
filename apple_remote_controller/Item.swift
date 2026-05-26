//
//  Item.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
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
