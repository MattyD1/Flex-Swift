//
//  MoreView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-05.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        VStack {
            Text("More")
                .font(.title)
                .fontWeight(.bold)
            Text("Incomplete")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    MoreView()
}
