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
    
    @AppStorage("isFirstTimeLaunch") private var isFirstTimeLaunch: Bool = true
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(MovementPatternContainer.create(shouldCreateDefaults: &isFirstTimeLaunch))
    }
}
