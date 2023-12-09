//
//  MainView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @State private var isSheetPresented = false
    @State private var selectedTab: Tab = .exercises
    
    var body: some View {
        NavigationStack {
            VStack {
                switch selectedTab {
                    case .dashboard:
                        DashboardView()
                            .frame(maxHeight: .infinity)
                    case .history:
                        HistoryView()
                            .frame(maxHeight: .infinity)
                    case .exercises:
                        ExerciseListView()
                            .frame(maxHeight: .infinity)
                    case .more:
                        MoreView()
                            .frame(maxHeight: .infinity)
                }
                
                Spacer()
                
                TabBarView(selectedTab: $selectedTab, isSheetPresented: $isSheetPresented)
            }
            .sheet(isPresented: $isSheetPresented) {
                ToolbarView()
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ExerciseInfo.self, configurations: config)

    ExerciseInfo.defaults.forEach { container.mainContext.insert($0) }
    
    return MainView()
        .modelContainer(container)
}
