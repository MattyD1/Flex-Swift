//
//  ExercisesView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI
import SwiftData

struct ExercisesView: View {
    /// Grouped Exercises Properties
    @Query(sort: [
        SortDescriptor(\ExerciseInfo.name, order: .forward)
    ], animation: .snappy) private var allExercises: [ExerciseInfo]
    
    @Environment(\.modelContext) private var context
    
    /// Grouped Exercises
    @State private var groupedExercises: [GroupedAlphabeticalExercises] = []
    @State private var addExercise: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($groupedExercises) { $group in
                    Section(String(group.firstLetter)) {
                        ForEach(group.exercises) { exercise in
                            ExerciseCardView(exercise: exercise)
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button {
                                        context.delete(exercise)
                                        withAnimation {
                                            group.exercises.removeAll(where: { $0.id == exercise.id })
                                            
                                            if group.exercises.isEmpty {
                                                groupedExercises.removeAll(where: { $0.id == group.id })
                                            }
                                        }
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                    .tint(.red)
                                }
                        }
                    }
                }
            }
            .navigationTitle("Exercises")
            .overlay {
                if allExercises.isEmpty || groupedExercises.isEmpty {
                    ContentUnavailableView {
                        Label("No Exercises", systemImage: "tray.fill")
                    }
                }
            }
            /// New Exercise Add Button
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addExercise.toggle()
                    } label : {
                        Label("Add Exercise", systemImage: "plus")
                            .font(.title3)
                    }
                }
            }
        }
        .onChange(of: allExercises, initial: true) { oldValue, newValue in
            if newValue.count > oldValue.count || groupedExercises.isEmpty {
                createGroupedExercises(newValue)
            }
        }
        .sheet(isPresented: $addExercise) {
            AddExerciseView()
        }
    }
    
    
    /// Creating Grouped Exercises (Grouped by first Letter)
    func createGroupedExercises(_ exercises: [ExerciseInfo]) {
        Task.detached(priority: .high) {
            let groupedDict = Dictionary(grouping: exercises) { exercise in
                let firstLetter = exercise.name.first
                
                return firstLetter
            }
            
            let sortedDictionary = groupedDict.sorted { (entry1, entry2) -> Bool in
                // Assuming you want to sort alphabetically based on the string element
                if let key1 = entry1.key, let key2 = entry2.key {
                    return key1 < key2
                }
                return false
            }
            
            await MainActor.run {
                groupedExercises = sortedDictionary.compactMap({ dict in
                    let firstLetter = dict.key
                    return .init(firstLetter: firstLetter ?? "#", exercises: dict.value)
                })
            }

            
        }
    }
    
    
}

#Preview {
    ExercisesView()
}
