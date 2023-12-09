//
//  TextFieldView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-09.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    
    public var label: String
    public var placeholderText: String
    public var required: Bool
    public var isTextArea: Bool
    
    
    var body: some View {
        VStack(spacing: 6) {
            HStack(alignment: .center) {
                Text(label)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                
                Spacer()
                
                if required {
                    Text("Required")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
            
            TextField(placeholderText, text: $text, axis: isTextArea ? .vertical : .horizontal)
                .lineLimit(isTextArea ? (6...10) : 1...1)
                .padding(12)
                .cornerRadius(5) /// make the background rounded
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.border, lineWidth: 1)
                )
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    TextFieldView(text: .constant(""), label: "Label", placeholderText: "Placeholder", required: true, isTextArea: false)
}
