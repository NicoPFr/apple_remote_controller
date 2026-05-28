//
//  SelectionSummaryCard.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 27/05/2026.
//

import SwiftUI

struct SelectionSummaryCard: View {
    @EnvironmentObject private var mappingStore: ControllerMappingStore

    let selectedInput: ControllerInput?

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            if let selectedInput {
                Text("Sélection actuelle")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 8) {
                    Text(selectedInput.label)
                        .font(.title3.weight(.semibold))

                    Text(categoryText(for: selectedInput))
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Divider()

                    if let action = mappingStore.action(for: selectedInput) {
                        Text("Action assignée")
                            .font(.subheadline.weight(.medium))

                        Text(mappingStore.description(for: action))
                            .foregroundStyle(.secondary)
                    } else {
                        Text("Aucune action assignée")
                            .foregroundStyle(.secondary)
                    }

                    Text("Utilisez le panneau de droite pour modifier cette entrée.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .padding(.top, 4)
                }
            } else {
                Text("Aucune entrée sélectionnée")
                    .font(.headline)

                Text("Sélectionnez un bouton ou un joystick depuis la liste de gauche ou directement via la prévisualisation.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.primary.opacity(0.03))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color.primary.opacity(0.06), lineWidth: 1)
        )
    }

    private func categoryText(for input: ControllerInput) -> String {
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
}

#Preview {
    SelectionSummaryCard(selectedInput: .buttonA)
        .environmentObject(ControllerMappingStore())
        .frame(width: 500, height: 220)
}
