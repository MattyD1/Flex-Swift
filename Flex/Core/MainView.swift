//
//  MainView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = "Four"
    @State private var isSheetPresented = false
    
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
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
                .tag("Three")
            
            ExerciseListView()
                .tabItem {
                    Label("Exercises", systemImage: selectedTab == "Four" ? "dumbbell.fill" : "dumbbell")
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
        .overlay(middleTabButton, alignment: .bottom)
        .sheet(isPresented: $isSheetPresented) {
            ToolbarView()
                .presentationDetents([.medium])
        }
    }
    
    var middleTabButton: some View {
        Button(action: {
            isSheetPresented.toggle()
        }) {
            Image(systemName: "plus")
                .font(.system(size: 20))
                .padding(10)
                .foregroundStyle(.background)
                .background(Color.accentColor)
                .clipShape(Circle())
            
        }
        .offset(y: -2)
    }
}

#Preview {
    MainView()
}
