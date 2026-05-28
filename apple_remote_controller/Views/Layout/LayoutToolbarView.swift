//
//  LayoutToolbarView.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 27/05/2026.
//


import SwiftUI

struct LayoutToolbarView: View {
    @EnvironmentObject private var layoutStore: UILayoutStore

    let hasSelection: Bool

    var body: some View {
        HStack(spacing: 10) {
            Button {
                layoutStore.toggleLeftPanel()
            } label: {
                Label(
                    layoutStore.isLeftPanelVisible ? "Masquer la liste" : "Afficher la liste",
                    systemImage: "sidebar.left"
                )
            }

            Button {
                layoutStore.toggleRightPanel()
            } label: {
                Label(
                    layoutStore.isRightPanelVisible ? "Masquer les paramètres" : "Afficher les paramètres",
                    systemImage: "sidebar.right"
                )
            }
            .disabled(!hasSelection)

            Button {
                layoutStore.resetLayout()
            } label: {
                Label("Réinitialiser la disposition", systemImage: "rectangle.3.group")
            }

            Spacer()
        }
        .labelStyle(.iconOnly)
        .buttonStyle(.bordered)
    }
}
