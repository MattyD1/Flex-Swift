//
//  Item.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
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
