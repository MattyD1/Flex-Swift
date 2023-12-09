//
//  ExerciseListView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-08.
//

import SwiftUI
import SwiftData

struct ExerciseListView: View {
    
    @Query private var allMovementPatterns: [MovementPattern]
    @Query(sort: [
            SortDescriptor(\ExerciseInfo.name, order: .forward)
        ], animation: .snappy) private var allExercises: [ExerciseInfo]
    
    @Environment(\.modelContext) private var context
    
    @State private var groupedExercises: [GroupedAlphabeticalExercises] = []
    @State private var searchText: String = ""
    @State private var showSearchBar: Bool = true
    @State private var scrollOffset: CGFloat = 0.00
    
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    }
    
    var body: some View {
        VStack {
            ScrollView {
                NavigationLink {
                    AddNewExerciseInfoStepOneView()
                } label: {
                    Label("New Exercise", systemImage: "plus")
                        .frame(maxWidth: .infinity)
                        .padding(8)
                }
                .buttonStyle(.bordered)
                .padding(.horizontal)
                
                VStack (alignment: .leading, spacing: 4) {
                    ForEach($groupedExercises) { $group in
                        Section {
                            ForEach(group.exercises) { exercise in
                                NavigationLink {
                                    
                                } label : {
                                    ExerciseCardView(exercise: exercise)
                                }
                            }
                        } header: {
                            Text(String(group.firstLetter))
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundStyle(.black)
                                .padding(.bottom, 8)
                                .padding(.top, 32)
                                .textCase(nil)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.leading)
                    }
                }
                .background(
                    GeometryReader {
                        return Color.clear.preference(key: ViewOffsetKey.self,
                                           value: -$0.frame(in: .named("scroll")).origin.y)
                    }
                )
                .onPreferenceChange(ViewOffsetKey.self) { offset in
                    withAnimation(.easeIn(duration: 0.2)) {
                        print(offset)
                        if offset > 10 {
                            showSearchBar = offset < scrollOffset
                        } else  {
                            showSearchBar = true
                        }
                    }
                    scrollOffset = offset
                }
            }
            
            if (showSearchBar) {
                HStack {
                    SearchBarView(searchText: $searchText)
                        .transition(.opacity)
                    
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.system(size: 16))
                        .padding(16)
                        .background(.quinary)
                        .clipShape(Circle())
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color.white)
                .shadow(color: Color.border.opacity(0.4), radius: 20, x: 0, y:-10)
            }
           
        }
        .navigationTitle("Exercises")
        .overlay {
            if allExercises.isEmpty || groupedExercises.isEmpty {
                ContentUnavailableView {
                    Label("No Exercises Found", systemImage: "tray.fill")
                }
            }
        }
        .onChange(of: allExercises, initial: true) { oldValue, newValue in
            if newValue.count > oldValue.count || groupedExercises.isEmpty {
                createGroupedExercises(newValue)
            }
        }

    }
    
    /// Creating Grouped Exercises (Grouped by first Letter)
    func createGroupedExercises(_ exercises: [ExerciseInfo]) {
        Task.detached(priority: .high) {
            let groupedDict = Dictionary(grouping: exercises) { exercise in
                let firstLetter = exercise.name.first
                                
                return firstLetter?.isLetter == true ? firstLetter : "#"
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

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ExerciseInfo.self, configurations: config)

    ExerciseInfo.defaults.forEach { container.mainContext.insert($0) }
    
    return NavigationStack {
        ExerciseListView()
    }
    .modelContainer(container)
}
