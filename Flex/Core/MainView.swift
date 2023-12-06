//
//  MainView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = "One"
    @State private var previousTab = "One"
    @State private var isSheetPresented = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: selectedTab == "One" ? "square.grid.2x2.fill" : "square.grid.2x2")
                        .fontWeight(.bold)
                        .environment(\.symbolVariants, .none)
                }
                .tag("One")
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: selectedTab == "Two" ? "clock.fill" : "clock")
                        .environment(\.symbolVariants, .none)
                }
                .tag("Two")
            
            Text("New Item")
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                        .environment(\.symbolVariants, .none)
                        .font(.caption)
                }
                .tag("Three")
            
            ExercisesView()
                .tabItem {
                    Label("Exercise", systemImage: selectedTab == "Four" ? "dumbbell.fill" : "dumbbell")
                        .environment(\.symbolVariants, .none)
                }
                .tag("Four")
            
            MoreView()
                .tabItem {
                    Label("More", systemImage: selectedTab == "Five" ? "ellipsis.circle.fill" : "ellipsis.circle")
                        .environment(\.symbolVariants, .none)
                }
                .tag("Five")
        }
        .toolbarBackground(.regularMaterial, for: .tabBar)
        .onChange(of: selectedTab) { oldValue, newValue in
            previousTab = oldValue
            if newValue == "Three" {
                selectedTab = oldValue
                isSheetPresented.toggle()
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            ToolbarView()
                .presentationDetents([.medium])
        }
    }
}

struct MiddleTabItem: View {
    var body: some View {
        Button(action: {
            // Handle middle tab item tap action
            print("Middle tab item tapped")
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(.secondary)
        }
        .background(Color.white)
        .clipShape(Circle())
        .shadow(radius: 5)
    }
}


#Preview {
    MainView()
}
