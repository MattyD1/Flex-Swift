//
//  SearchBarView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-06.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.accentColor)
            
            TextField("Search", text: $searchText)
                .foregroundStyle(Color.accentColor)
                .font(.subheadline)
        }
        .padding(.all, 12)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.quinary)
        )
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
