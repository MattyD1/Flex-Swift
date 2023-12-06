//
//  GroupedExercises.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI

/// Alphabetical Ordering
struct GroupedAlphabeticalExercises: Identifiable {
    var id: UUID = .init()
    var firstLetter: String.Element
    var exercises: [ExerciseInfo]
}
