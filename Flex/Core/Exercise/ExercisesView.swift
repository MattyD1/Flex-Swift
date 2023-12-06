//
//  ExercisesView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI

struct ExercisesView: View {
    
    @State private var searchText: String = ""
    @State private var showSearchBar: Bool = false
    @State private var scrollOffset: CGFloat = 0.00
    
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    VStack (alignment: .leading) {
                        ForEach(0..<30) { i in
                            HStack {
                                Text("Item \(i)").padding()
                                Spacer()
                            }
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
                    SearchBarView(searchText: $searchText)
                        .transition(.opacity)
                }
                
            }
            .navigationTitle("Exercises")
//            .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: Text("Search"))
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
