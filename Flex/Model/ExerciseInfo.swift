//
//  ExerciseInfo.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI
import SwiftData

@Model
class ExerciseInfo {
    /// Exercise Information
    var name: String
    
    /// Exercise MovementPattern
    var movementPattern: MovementPattern?
    
    init(name: String, movementPattern: MovementPattern? = nil) {
        self.name = name
        self.movementPattern = movementPattern
    }
}
