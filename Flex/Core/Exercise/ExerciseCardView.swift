//
//  ExerciseCardView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-07.
//

import SwiftUI

struct ExerciseCardView: View {
    
    @Bindable var exercise: ExerciseInfo
    
    var body: some View {
        HStack {
            Image(systemName: "dumbbell")
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(exercise.name)
                            .fontWeight(.medium)
                        
                        HStack(spacing: 16) {
                            Text("Vertical Push")
                            
                            Text("20kg")
                            
                            Text("Delts • Triceps")
                        }
                        .lineLimit(1)
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                    }
                    .padding(.trailing)
                    
                    Spacer()
                    
                    Image(systemName: "info.circle")
                        .padding(.trailing)
                }
                .padding(.top, 12)
                .padding(.bottom, 4)
                
                Divider()
            }
            
        }
        
    }
}

#Preview {
    ExerciseCardView(exercise: ExerciseInfo(name: "Test Exercise", details: "Test Details"))
}
