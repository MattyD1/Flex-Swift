//
//  ExerciseCardView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI

struct ExerciseCardView: View {
    @Bindable var exercise: ExerciseInfo
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(exercise.name)
            }
        }
    }
}
