//
//  AccessibilityPermissionBanner.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 27/05/2026.
//


import SwiftUI

struct AccessibilityPermissionBanner: View {
    let onRequestPermission: () -> Void
    let onOpenSettings: () -> Void
    let onRefresh: () -> Void

    var body: some View {
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
                onRequestPermission()
            }

            Button("Ouvrir les réglages") {
                onOpenSettings()
            }

            Button("Actualiser") {
                onRefresh()
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
    AccessibilityPermissionBanner(
        onRequestPermission: {},
        onOpenSettings: {},
        onRefresh: {}
    )
    .frame(width: 1200)
}
