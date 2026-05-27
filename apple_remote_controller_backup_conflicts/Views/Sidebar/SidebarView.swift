//
//  SidebarView.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI

struct SidebarView: View {
    @Binding var highlightedInputs: Set<ControllerInput>
    @Binding var selectedInput: ControllerInput?

    var body: some View {
        List {
            Section {
                ForEach(ControllerInput.allCases, id: \.self) { input in
                    Button(action: {
                        select(input)
                    }) {
                        HStack(spacing: 10) {
                            VStack(alignment: .leading, spacing: 3) {
                                Text(input.label)
                                    .foregroundStyle(Color.primary)

                                if selectedInput == input {
                                    Text("En cours d’édition")
                                        .font(.caption)
                                        .foregroundStyle(Color.secondary)
                                }
                            }

                            Spacer()

                            if selectedInput == input {
                                Image(systemName: "pencil.circle.fill")
                                    .foregroundStyle(Color.accentColor)
                            }
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                }
            } header: {
                Text("Entrées de la manette")
            }
        }
        .listStyle(.sidebar)
    }

    private func select(_ input: ControllerInput) {
        selectedInput = input
        highlightedInputs = [input]
    }
}
