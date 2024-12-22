//
//  Item.swift
//  lazy-photo-ios
//
//  Created by Yannian Liu on 22/12/2024.
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
