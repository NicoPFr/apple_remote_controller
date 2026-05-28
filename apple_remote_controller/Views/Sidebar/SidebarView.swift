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
        VStack(alignment: .leading, spacing: 0) {
            header

            Divider()
                .padding(.horizontal, 16)

            List {
                Section {
                    ForEach(Array(ControllerInput.allCases), id: \.self) { input in
                        sidebarRow(for: input)
                            .listRowInsets(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                } header: {
                    Text("Toutes les entrées")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                        .textCase(nil)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Entrées")
                .font(.title3.weight(.semibold))

            Text("Sélectionnez un bouton, une gâchette ou un joystick à configurer.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 16)
        .padding(.top, 18)
        .padding(.bottom, 14)
    }

    @ViewBuilder
    private func sidebarRow(for input: ControllerInput) -> some View {
        let isSelected = selectedInput == input

        Button {
            select(input)
        } label: {
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(input.label)
                        .font(.body.weight(isSelected ? .semibold : .regular))
                        .foregroundStyle(.primary)

                    Text(subtitle(for: input, isSelected: isSelected))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                if isSelected {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundStyle(Color.accentColor)
                        .font(.system(size: 14, weight: .semibold))
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(isSelected ? Color.accentColor.opacity(0.10) : Color.clear)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(
                        isSelected ? Color.accentColor.opacity(0.25) : Color.primary.opacity(0.05),
                        lineWidth: 1
                    )
            )
            .contentShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
        .buttonStyle(.plain)
    }

    private func subtitle(for input: ControllerInput, isSelected: Bool) -> String {
        if isSelected {
            return "En cours de configuration"
        }

        switch input {
        case .leftStickMove, .rightStickMove:
            return "Joystick"

        case .leftTrigger, .rightTrigger:
            return "Gâchette"

        case .dpadUp, .dpadDown, .dpadLeft, .dpadRight:
            return "Croix directionnelle"

        case .leftStick, .rightStick:
            return "Clic joystick"

        case .leftShoulder, .rightShoulder:
            return "Bouton d’épaule"

        default:
            return "Bouton"
        }
    }

    private func select(_ input: ControllerInput) {
        selectedInput = input
        highlightedInputs = [input]
    }
}
