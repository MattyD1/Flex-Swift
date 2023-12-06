//
//  AddExerciseView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI
import SwiftData

struct AddExerciseView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
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
                    Button("Add Exercise",action: addExercise)
                        .disabled(isAddButtonDisabled)
                }
            }
        }
    }
    
    var isAddButtonDisabled: Bool {
        return name.isEmpty
    }
    
    func addExercise() {
        let exercise = ExerciseInfo(name: name, movementPattern: movementPattern)
        
        context.insert(exercise)
        
        dismiss()
    }
}

#Preview {
    AddExerciseView()
}
