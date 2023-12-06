//
//  FlexApp.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI
import SwiftData

@main
struct FlexApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [ExerciseInfo.self, MovementPattern.self])
    }
}
