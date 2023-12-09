//
//  AddNewExerciseInfoView.swift
//  Flex
//
//  Created by Matt Dunn on 2023-12-08.
//

import SwiftUI

struct AddNewExerciseInfoStepOneView: View {
    @State private var exerciseName: String = ""
    @State private var description: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            /// Steps
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.subheadline)
                    .fontWeight(.medium)
                
                HStack {
                    Rectangle()
                        .frame(maxHeight: 5)
                    
                    Rectangle()
                        .frame(maxHeight: 5)
                        .foregroundStyle(.quaternary)
                }
            }
            .padding(.horizontal)
            .padding(.top, 8)
            .padding(.bottom, 12)
            
            ScrollView {
                TextFieldView(text: $exerciseName, label: "Exercise Name", placeholderText: "Exercise Name", required: true, isTextArea: false)
                    .padding([.top, .bottom], 12)
                
                TextFieldView(text: $description, label: "Description", placeholderText: "Describe the exercise and its characteristics (Dumbbells, Bands, etc..)", required: false, isTextArea: true)
                    .padding(.bottom, 12)
                
                TextFieldView(text: $description, label: "Coaching Cues", placeholderText: "Describe the a cue you follow", required: false, isTextArea: true)
                    .overlay(alignment: .bottom) {
                        HStack {
                            Button {} label: {
                                Label("Remove", systemImage: "minus.circle")
                                    .font(.system(size: 12))
                            }
                            .buttonStyle(.bordered)
                            
                            
                            Spacer()
                            
                            Button {} label: {
                                Label("Add Before", systemImage: "plus")
                                    .font(.system(size: 12))
                            }
                            .buttonStyle(.bordered)
                            
                            Spacer()
                            
                            Button {} label: {
                                Label("Add After", systemImage: "plus")
                                    .font(.system(size: 12))
                            }
                            .buttonStyle(.bordered)
                        }
                        .padding(.horizontal, 36)
                        .padding(.vertical, 8)
                    }
                
            }
            

        }
        .overlay(alignment: .bottom) {
            HStack {
                Spacer()
                
                Button {} label: {
                    HStack {
                        Text("Next")
                        
                        Image(systemName: "chevron.right")
                            .font(.subheadline)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 24)
                    .foregroundStyle(.background)
                    .fontWeight(.semibold)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                        
                    )
                }
            }
            .padding(.horizontal)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label : {
                    Label("Add Exercise", systemImage: "xmark")
                        .font(.title3)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button { } label : {
                    Label("Add Exercise", systemImage: "checkmark")
                        .font(.title3)
                }
                .foregroundStyle(.quaternary)
                .disabled(true)
            }
        }
        .navigationTitle("Create Exercise")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct AddNewExerciseInfoStepTwoView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NavigationStack {
        AddNewExerciseInfoStepOneView()
    }
}
