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
            Section("Entrées de la manette") {
                ForEach(Array(ControllerInput.allCases), id: \.self) { input in
                    sidebarRow(for: input)
                }
            }
        }
        .navigationTitle("Contrôles")
    }

    @ViewBuilder
    private func sidebarRow(for input: ControllerInput) -> some View {
        let isSelected = selectedInput == input

        Button {
            select(input)
        } label: {
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 3) {
                    Text(input.label)
                        .foregroundStyle(Color.primary)

                    if isSelected {
                        Text("En cours d’édition")
                            .font(.caption)
                            .foregroundStyle(Color.secondary)
                    }
                }

                Spacer()

                if isSelected {
                    Image(systemName: "pencil.circle.fill")
                        .foregroundStyle(Color.accentColor)
                }
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }

    private func select(_ input: ControllerInput) {
        selectedInput = input
        highlightedInputs = [input]
    }
}
