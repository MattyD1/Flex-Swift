//
//  UpdateExerciseView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-06.
//

import SwiftUI
import SwiftData

struct UpdateExerciseView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var exercise: ExerciseInfo
    
    @State private var name: String = ""
    @State private var movementPattern: MovementPattern?
    
    @Query(animation: .snappy) private var allMovementPatterns: [MovementPattern]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Name") {
                    TextField("Exercise Name", text: $name)
                }
                
                if !allMovementPatterns.isEmpty {
                    HStack {
                        Text("Movement Pattern")
                        
                        Spacer()
                        
                        Picker("", selection: $movementPattern) {
                            ForEach(allMovementPatterns) {
                                Text($0.movementName)
                                    .tag($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                    }
                }
            }
            .navigationTitle("Add Exercise")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                    .tint(.red)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Update Exercise", action: updateExercise)
                        .disabled(isAddButtonDisabled)
                }
            }
            .onAppear {
                name = exercise.name
                movementPattern = exercise.movementPattern
            }
        }
    }
    
    var isAddButtonDisabled: Bool {
        return name == exercise.name
    }
    
    func updateExercise() {
        exercise.name = name
        exercise.movementPattern = movementPattern
        
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ExerciseInfo.self, configurations: config)

        let example = ExerciseInfo(name: "Test Exercise")
        return  UpdateExerciseView(exercise: example)
            .modelContainer(container)
   } catch {
        fatalError("Failed to create model container.")
   }
   
}
