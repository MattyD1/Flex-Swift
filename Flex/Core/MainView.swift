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
        .overlay(middleTabButton, alignment: .bottom)
        .overlay(TopBorder, alignment: .bottom)
        .sheet(isPresented: $isSheetPresented) {
            ToolbarView()
                .presentationDetents([.medium])
        }
    }
    
    var middleTabButton: some View {
        Button(action: {
            isSheetPresented.toggle()
        }) {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 42, height: 42)
                .foregroundColor(.accentColor) // Customize the color as needed
            
        }
        .offset(y: -2)
    }
    
    var TopBorder: some View {
        Rectangle()
            .frame(height: 1)
            .offset(y: -48)
            .foregroundColor(.border)
    }
}

#Preview {
    MainView()
}
