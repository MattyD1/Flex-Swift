//
//  ExercisesView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI
import SwiftData

struct ExercisesView: View {
    
    @Query private var allMovementPatterns: [MovementPattern]
    
    @State private var searchText: String = ""
    @State private var showSearchBar: Bool = false
    @State private var scrollOffset: CGFloat = 0.00
        
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
////                                ForEach(allMovementPatterns) { movement in
////                                    Text(movement.movementName)
////                                }
//                        ForEach(0..<10) { movement in
//                            Text("Movement")
//                                .padding(.vertical, 5)
//                                .fontWeight(.medium)
//                                .foregroundStyle(.secondary)
//                        }
//                    }
//                    .padding(.vertical, 8)
//                    .padding(.horizontal)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(.quinary.opacity(0.75))
//                    )
//                    .padding(.horizontal)
//                }
//                
//                
//                
//                ScrollView {
//                    VStack (alignment: .leading, spacing: 4) {
//                        ForEach(0..<100) { movement in
//                            ExerciseCardView()
//                        }
//                    }
//                    .background(
//                        GeometryReader {
//                            return Color.clear.preference(key: ViewOffsetKey.self,
//                                               value: -$0.frame(in: .named("scroll")).origin.y)
//                        }
//                    )
//                    .onPreferenceChange(ViewOffsetKey.self) { offset in
//                        withAnimation(.easeIn(duration: 0.2)) {
//                            print(offset)
//                            if offset > 10 {
//                                showSearchBar = offset < scrollOffset
//                            } else  {
//                                showSearchBar = true
//                            }
//                        }
//                        scrollOffset = offset
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.top)
//                .background(.quinary)
//                
//                if (showSearchBar) {
//                    SearchBarView(searchText: $searchText)
//                        .transition(.opacity)
//                }
                
            }
            .navigationTitle("Exercises")
            .navigationBarTitleDisplayMode(.inline)
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
    ExercisesView()
}
