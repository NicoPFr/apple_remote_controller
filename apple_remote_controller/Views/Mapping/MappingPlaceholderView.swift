//
//  MappingPlaceholderView.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI

struct MappingPlaceholderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Mappings")
                .font(.title2)
                .fontWeight(.semibold)

            GroupBox {
                VStack(alignment: .leading, spacing: 12) {
                    mappingRow(action: "Déplacer la souris", input: "Stick droit")
                    mappingRow(action: "Clic gauche", input: "Bouton A")
                    mappingRow(action: "Clic droit", input: "Bouton B")
                    mappingRow(action: "Scroll", input: "Stick gauche")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            GroupBox {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Prochaine étape")
                        .fontWeight(.semibold)

                    Text("On branchera ici l’éditeur de mapping interactif.")
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            Spacer()
        }
    }

    private func mappingRow(action: String, input: String) -> some View {
        HStack {
            Text(action)
            Spacer()
            Text(input)
                .foregroundStyle(.secondary)
        }
        .font(.subheadline)
    }
}
