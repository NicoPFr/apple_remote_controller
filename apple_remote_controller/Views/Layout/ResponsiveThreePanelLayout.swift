//
//  ResponsiveThreePanelLayout.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI

struct ResponsiveThreePanelLayout: View {
    @Binding var highlightedInputs: Set<ControllerInput>
    @Binding var selectedInput: ControllerInput?

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            let horizontalPadding = clamp(size.width * 0.018, min: 12, max: 24)
            let verticalPadding = clamp(size.height * 0.022, min: 12, max: 22)
            let columnSpacing = clamp(size.width * 0.012, min: 10, max: 20)

            let availableWidth = size.width - (horizontalPadding * 2)
            let availableHeight = size.height - (verticalPadding * 2)

            let leftIdeal = availableWidth * 0.18
            let rightIdeal = availableWidth * 0.24

            let leftWidth = clamp(leftIdeal, min: 170, max: 260)
            let rightWidth = clamp(rightIdeal, min: 260, max: 360)

            let minimumCenterWidth: CGFloat = 520

            let layout = computeLayout(
                availableWidth: availableWidth,
                columnSpacing: columnSpacing,
                leftWidth: leftWidth,
                rightWidth: rightWidth,
                minimumCenterWidth: minimumCenterWidth
            )

            HStack(alignment: .top, spacing: columnSpacing) {
                leftPanel(width: layout.leftWidth, height: availableHeight)
                centerPanel(width: layout.centerWidth, height: availableHeight)
                rightPanel(width: layout.rightWidth, height: availableHeight)
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(nsColor: .windowBackgroundColor))
        }
    }

    private func leftPanel(width: CGFloat, height: CGFloat) -> some View {
        SidebarView(
            highlightedInputs: $highlightedInputs,
            selectedInput: $selectedInput
        )
        .frame(width: width, height: height, alignment: .topLeading)
        .background(panelBackground)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func centerPanel(width: CGFloat, height: CGFloat) -> some View {
        MainControllerPanel(
            highlightedInputs: $highlightedInputs,
            selectedInput: $selectedInput
        )
        .frame(width: width, height: height, alignment: .topLeading)
        .background(panelBackground)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .layoutPriority(1)
    }

    private func rightPanel(width: CGFloat, height: CGFloat) -> some View {
        MappingEditorView(selectedInput: selectedInput)
            .frame(width: width, height: height, alignment: .topLeading)
            .background(panelBackground)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var panelBackground: some View {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
            .fill(Color(nsColor: .controlBackgroundColor).opacity(0.58))
    }

    private func computeLayout(
        availableWidth: CGFloat,
        columnSpacing: CGFloat,
        leftWidth: CGFloat,
        rightWidth: CGFloat,
        minimumCenterWidth: CGFloat
    ) -> (leftWidth: CGFloat, centerWidth: CGFloat, rightWidth: CGFloat) {
        let totalNeededWidth = leftWidth + rightWidth + minimumCenterWidth + (columnSpacing * 2)

        if totalNeededWidth <= availableWidth {
            let centerWidth = availableWidth - leftWidth - rightWidth - (columnSpacing * 2)
            return (leftWidth, centerWidth, rightWidth)
        } else {
            let compressibleWidth = max(320, availableWidth - minimumCenterWidth - (columnSpacing * 2))
            let leftRatio: CGFloat = 0.38
            let rightRatio: CGFloat = 0.62

            let adjustedLeftWidth = max(150, compressibleWidth * leftRatio)
            let adjustedRightWidth = max(230, compressibleWidth * rightRatio)

            return (adjustedLeftWidth, minimumCenterWidth, adjustedRightWidth)
        }
    }

    private func clamp(_ value: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat {
        Swift.max(min, Swift.min(max, value))
    }
}
