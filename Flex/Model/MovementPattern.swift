//
//  MovementPattern.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI
import SwiftData

@Model
class MovementPattern {
    var movementName: String
    
    /// Movement Pattern Exercises
    @Relationship
    var Exercises: [ExerciseInfo]?
    
    init(movementName: String) {
        self.movementName = movementName
    }
    
}

