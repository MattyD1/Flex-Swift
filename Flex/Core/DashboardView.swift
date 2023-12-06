//
//  DashboardView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {            
            VStack {
                Text("Dashboard")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Incomplete")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    DashboardView()
}
