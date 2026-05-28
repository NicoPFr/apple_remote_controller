//
//  MainControllerPanel.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI

struct MainControllerPanel: View {
    @Binding var highlightedInputs: Set<ControllerInput>
    @Binding var selectedInput: ControllerInput?

    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height

            let horizontalPadding = clamp(width * 0.035, min: 16, max: 30)
            let topPadding = clamp(height * 0.035, min: 16, max: 26)
            let bottomPadding = clamp(height * 0.025, min: 12, max: 20)
            let spacing = clamp(height * 0.02, min: 14, max: 24)
            let previewHeight = clamp(height * 0.48, min: 280, max: 420)

            ScrollView {
                VStack(alignment: .leading, spacing: spacing) {
                    header(width: width)

                    LayoutToolbarView(hasSelection: selectedInput != nil)

                    ControllerPreviewView(
                        highlightedInputs: highlightedInputs,
                        selectedInput: selectedInput,
                        onSelectInput: { input in
                            selectedInput = input
                            highlightedInputs = [input]
                        }
                    )
                    .frame(maxWidth: .infinity)
                    .frame(height: previewHeight)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(Color.primary.opacity(0.03))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .stroke(Color.primary.opacity(0.06), lineWidth: 1)
                    )

                    SelectionSummaryCard(selectedInput: selectedInput)
                }
                .padding(.leading, horizontalPadding)
                .padding(.trailing, horizontalPadding)
                .padding(.top, topPadding)
                .padding(.bottom, bottomPadding)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .scrollIndicators(.hidden)
        }
    }

    private func header(width: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Apple Remote Controller")
                .font(.system(size: clamp(width * 0.04, min: 24, max: 36), weight: .semibold))

            Text("Sélectionnez une entrée, visualisez-la sur la manette et configurez son comportement.")
                .font(.system(size: clamp(width * 0.017, min: 13, max: 16)))
                .foregroundStyle(.secondary)
        }
    }

    private func clamp(_ value: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat {
        Swift.max(min, Swift.min(max, value))
    }
}
