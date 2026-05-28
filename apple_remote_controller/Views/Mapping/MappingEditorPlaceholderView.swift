//
//  MappingEditorPlaceholderView.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 27/05/2026.
//


import SwiftUI

struct MappingEditorPlaceholderView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "slider.horizontal.3")
                .font(.system(size: 28))
                .foregroundStyle(.secondary)

            VStack(spacing: 6) {
                Text("Aucune entrée sélectionnée")
                    .font(.headline)

                Text("Sélectionnez un bouton ou un joystick pour modifier son comportement.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(24)
    }
}

#Preview {
    MappingEditorPlaceholderView()
        .frame(width: 320, height: 600)
}
