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
        NavigationStack {
            VStack {
                ScrollView {
                    
                    Button(action: {}) {
                        Label("New Exercise", systemImage: "plus")
                            .frame(maxWidth: .infinity)
                            .padding(8)
                    }
                    .buttonStyle(.bordered)
                    .padding(.horizontal)
                    
                    VStack (alignment: .leading, spacing: 4) {
                        ForEach(1..<5) { section in
                            Section {
                                ForEach(1..<10) { text in
                                    ExerciseCardView()
                                }
                            } header: {
                                Text("Test Header")
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
        }
    }
}

#Preview {
    ExerciseListView()
}
