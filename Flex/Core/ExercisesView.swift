//
//  ExercisesView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI

struct ExercisesView: View {
    var body: some View {
        VStack {
            Text("Exercises")
                .font(.title)
                .fontWeight(.bold)
            Text("Incomplete")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ExercisesView()
}
