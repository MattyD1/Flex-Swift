//
//  ToolbarView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI

struct ToolbarView: View {
    var body: some View {
        VStack {
            Text("Toolbar")
                .font(.title)
                .fontWeight(.bold)
            Text("Incomplete")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ToolbarView()
}
