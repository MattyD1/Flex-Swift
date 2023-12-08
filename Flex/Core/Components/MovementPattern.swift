//
//  MovementPattern.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-06.
//

import SwiftUI
import SwiftData

@Model
class MovementPattern {
    var movementName: String
    
    init(movementName: String) {
        self.movementName = movementName
    }
}

extension MovementPattern {
    static var defaults: [MovementPattern] {
        [
            .init(movementName: "Squat"),
            .init(movementName: "Hip Hinge"),
            .init(movementName: "Vertical Pull"),
            .init(movementName: "Vertical Push"),
            .init(movementName: "Horizontal Pull"),
            .init(movementName: "Horizontal Push"),
            .init(movementName: "Hip Extension"),
            .init(movementName: "Pull Over"),
            .init(movementName: "Fly"),
            .init(movementName: "Isolation"),
            .init(movementName: "Carrying"),
            .init(movementName: "Jumping"),
            .init(movementName: "Mobility")
        ]
    }
}
