//
//  GroupedExercises.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-08.
//

import Foundation

struct GroupedAlphabeticalExercises: Identifiable {
    var id: UUID = .init()
    var firstLetter: String.Element
    var exercises: [ExerciseInfo]
}
