//
//  ContentView.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI

struct ContentView: View {
    @State private var highlightedInputs: Set<ControllerInput> = [.buttonA]
    @State private var selectedInput: ControllerInput? = .buttonA
    @StateObject private var coordinator = AppCoordinator()

    var body: some View {
        VStack(spacing: 0) {
            if !coordinator.hasAccessibilityPermission {
                accessibilityBanner
            }

            ResponsiveThreePanelLayout(
                highlightedInputs: $highlightedInputs,
                selectedInput: $selectedInput
            )
        }
        .environmentObject(coordinator.mappingStore)
        .environmentObject(coordinator.controllerManager)
    }

    private var accessibilityBanner: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Autorisation Accessibilité requise")
                    .font(.headline)

                Text("L’application a besoin de l’accès Accessibilité pour envoyer des actions clavier et souris.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button("Autoriser") {
                coordinator.requestAccessibilityPermission()
            }

            Button("Ouvrir les réglages") {
                coordinator.openAccessibilitySettings()
            }

            Button("Actualiser") {
                coordinator.refreshAccessibilityPermission()
            }
        }
        .padding(16)
        .background(Color.orange.opacity(0.12))
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.orange.opacity(0.25)),
            alignment: .bottom
        )
    }
}

#Preview {
    ContentView()
        .frame(width: 1280, height: 760)
}
