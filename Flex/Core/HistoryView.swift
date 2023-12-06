//
//  HistoryView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .fontWeight(.bold)
            Text("Incomplete")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    HistoryView()
}
