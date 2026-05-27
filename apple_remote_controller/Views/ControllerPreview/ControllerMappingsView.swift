<<<<<<< HEAD
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
=======
import SwiftUI

struct ControllerMappingsView: View {
    let highlightedInputs: Set<ControllerInput>

    private let mappings: [(input: ControllerInput, label: String, action: String)] = [
        (.buttonA, "A", "Jump"),
        (.buttonB, "B", "Back"),
        (.buttonX, "X", "Reload"),
        (.buttonY, "Y", "Inventory"),
        (.leftTrigger, "Left Trigger", "Aim"),
        (.rightTrigger, "Right Trigger", "Shoot"),
        (.leftShoulder, "Left Shoulder", "Previous Tab"),
        (.rightShoulder, "Right Shoulder", "Next Tab"),
        (.leftStick, "Left Stick", "Move"),
        (.rightStick, "Right Stick", "Camera"),
        (.dpadUp, "D-Pad Up", "Navigate Up"),
        (.dpadDown, "D-Pad Down", "Navigate Down"),
        (.dpadLeft, "D-Pad Left", "Navigate Left"),
        (.dpadRight, "D-Pad Right", "Navigate Right")
    ]
>>>>>>> develop

    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 220, maximum: 320), spacing: 12, alignment: .top)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
<<<<<<< HEAD
            Text("Mapping des touches")
                .font(.headline)

            LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                ForEach(ControllerInput.allCases, id: \.self) { input in
                    mappingCard(for: input)
=======
            Text("Mappings")
                .font(.headline)

            LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                ForEach(mappings, id: \.input) { mapping in
                    mappingCard(for: mapping)
>>>>>>> develop
                }
            }
        }
    }

<<<<<<< HEAD
    private func mappingCard(for input: ControllerInput) -> some View {
        let isHighlighted = highlightedInputs.contains(input)
        let isSelected = selectedInput == input
        let actionLabel = mappingStore.description(for: input)

        return HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(input.label)
                    .font(.system(size: 14, weight: isSelected ? .semibold : .medium))

                Text(actionLabel)
=======
    private func mappingCard(
        for mapping: (input: ControllerInput, label: String, action: String)
    ) -> some View {
        let isHighlighted = highlightedInputs.contains(mapping.input)

        return HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(mapping.label)
                    .font(.system(size: 14, weight: isHighlighted ? .semibold : .medium))

                Text(mapping.action)
>>>>>>> develop
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
<<<<<<< HEAD
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
=======
                .fill(
                    isHighlighted
                    ? Color.accentColor.opacity(0.14)
                    : Color(nsColor: .controlBackgroundColor).opacity(0.72)
                )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(
                    isHighlighted
                    ? Color.accentColor.opacity(0.35)
                    : Color.primary.opacity(0.06),
                    lineWidth: 1
                )
        )
    }
>>>>>>> develop
}

#Preview {
    ControllerMappingsView(
<<<<<<< HEAD
        highlightedInputs: [.buttonA],
        selectedInput: .buttonA
    )
    .environmentObject(ControllerMappingStore())
=======
        highlightedInputs: [.buttonA, .buttonX, .rightTrigger, .dpadUp]
    )
>>>>>>> develop
    .padding()
}
