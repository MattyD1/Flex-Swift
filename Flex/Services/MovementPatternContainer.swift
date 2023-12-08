//
//  MovementPatternContainer.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-07.
//

import SwiftData
import Foundation

actor MovementPatternContainer {
    @MainActor
    static func create(shouldCreateDefaults: inout Bool) -> ModelContainer {
        let schema = Schema([MovementPattern.self])
        let config = ModelConfiguration()
        
        let container = try! ModelContainer(for: schema, configurations: config)
        
        if shouldCreateDefaults {
            MovementPattern.defaults.forEach { container.mainContext.insert($0) }
            shouldCreateDefaults = false
        }
        
        return container
    }
}
