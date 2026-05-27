//
//  ControllerMappingsView.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI

struct ControllerMappingsView: View {
    @EnvironmentObject private var mappingStore: ControllerMappingStore

    let highlightedInputs: Set<ControllerInput>
    let selectedInput: ControllerInput?

    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 220, maximum: 320), spacing: 12, alignment: .top)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Mapping des touches")
                .font(.headline)

            LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                ForEach(ControllerInput.allCases, id: \.self) { input in
                    mappingCard(for: input)
                }
            }
        }
    }

    private func mappingCard(for input: ControllerInput) -> some View {
        let isHighlighted = highlightedInputs.contains(input)
        let isSelected = selectedInput == input
        let actionLabel = mappingStore.description(for: input)

        return HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(input.label)
                    .font(.system(size: 14, weight: isSelected ? .semibold : .medium))

                Text(actionLabel)
                    .font(.system(size: 13))
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Spacer(minLength: 8)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity, minHeight: 68, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(backgroundColor(isHighlighted: isHighlighted, isSelected: isSelected))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(borderColor(isHighlighted: isHighlighted, isSelected: isSelected), lineWidth: 1)
        )
    }

    private func backgroundColor(isHighlighted: Bool, isSelected: Bool) -> Color {
        if isSelected {
            return Color.accentColor.opacity(0.16)
        }
        if isHighlighted {
            return Color.accentColor.opacity(0.10)
        }
        return Color(nsColor: .controlBackgroundColor).opacity(0.72)
    }

    private func borderColor(isHighlighted: Bool, isSelected: Bool) -> Color {
        if isSelected {
            return Color.accentColor.opacity(0.45)
        }
        if isHighlighted {
            return Color.accentColor.opacity(0.25)
        }
        return Color.primary.opacity(0.06)
    }
}

#Preview {
    ControllerMappingsView(
        highlightedInputs: [.buttonA],
        selectedInput: .buttonA
    )
    .environmentObject(ControllerMappingStore())
    .padding()
}
