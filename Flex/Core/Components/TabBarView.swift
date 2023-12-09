//
//  TabBarView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-08.
//

import SwiftUI

enum Tab {
    case dashboard
    case history
    case exercises
    case more
}

struct TabBarView: View {
    @Binding var selectedTab: Tab
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                // Dashboard Icon
                TabBarButton(selectedTab: $selectedTab, currentTab: .dashboard, iconName: "square.grid.2x2", label: "Dashboard", width: 23)

                Spacer()

                // History Icon
                TabBarButton(selectedTab: $selectedTab, currentTab: .history, iconName: "clock", label: "History", width: 23)
                
                Spacer()
                
                Button(action: { isSheetPresented.toggle() }) {
                    Image(systemName: "plus")
                        .font(.system(size: 20))
                        .padding(12)
                        .foregroundStyle(.background)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                }
                .frame(maxWidth: .infinity)
                .offset(y: -2)

                Spacer()

                // Exercises Icon
                TabBarButton(selectedTab: $selectedTab, currentTab: .exercises, iconName: "dumbbell", label: "Exercises", width: 23)

                Spacer()

                // More Icon
                TabBarButton(selectedTab: $selectedTab, currentTab: .more, iconName: "ellipsis.circle", label: "More", width: 23)
            }
            .padding(.horizontal, 4)
        }
    }
}

struct TabBarButton: View {
    @Binding var selectedTab: Tab
    var currentTab: Tab
    var iconName: String
    var label: String
    var width: CGFloat
    
    var body: some View {
        Button(action: { selectedTab = currentTab }) {
            VStack {
                Image(systemName: selectedTab == currentTab ? "\(iconName).fill" : iconName)
                    .font(.system(size: width)) // Adjust size as needed
                    .frame(minHeight: 28)
                    .foregroundColor(selectedTab == currentTab ? .primary : .secondary)

                Text(label)
                    .font(.system(size: 10))
                    .foregroundColor(selectedTab == currentTab ? .primary : .secondary)
            }
            .frame(maxWidth: .infinity) // Ensures that each button takes up equal space
        }
        .padding(.bottom, 8) // Adjust padding as needed
        .buttonStyle(PlainButtonStyle())

    }
}

#Preview {
    TabBarView(selectedTab: .constant(.dashboard), isSheetPresented: .constant(false))
}
