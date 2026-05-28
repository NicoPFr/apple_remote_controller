//
//  ResponsiveThreePanelLayout.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI

struct ResponsiveThreePanelLayout: View {
    @EnvironmentObject private var layoutStore: UILayoutStore

    @Binding var highlightedInputs: Set<ControllerInput>
    @Binding var selectedInput: ControllerInput?

    @State private var leftDragStartWidth: CGFloat?
    @State private var rightDragStartWidth: CGFloat?

    private var shouldShowRightPanel: Bool {
        selectedInput != nil && layoutStore.isRightPanelVisible
    }

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            let horizontalPadding = clamp(size.width * 0.018, min: 12, max: 24)
            let verticalPadding = clamp(size.height * 0.022, min: 12, max: 22)
            let columnSpacing = clamp(size.width * 0.012, min: 10, max: 20)

            let availableWidth = max(0, size.width - (horizontalPadding * 2))
            let availableHeight = max(0, size.height - (verticalPadding * 2))

            let layout = resolvedLayout(
                availableWidth: availableWidth,
                columnSpacing: columnSpacing
            )

            HStack(alignment: .top, spacing: columnSpacing) {
                if layout.showsLeftPanel {
                    leftPanel(width: layout.leftWidth, height: availableHeight)

                    PanelResizeHandle { translation in
                        if leftDragStartWidth == nil {
                            leftDragStartWidth = layoutStore.leftPanelWidth
                        }

                        let startWidth = leftDragStartWidth ?? layoutStore.leftPanelWidth
                        let proposedWidth = startWidth + translation
                        let maxAllowedWidth = layout.maximumResizableLeftWidth

                        layoutStore.leftPanelWidth = max(
                            layoutStore.leftPanelMinimumWidth,
                            min(proposedWidth, maxAllowedWidth)
                        )
                    }
                    .onEnded {
                        leftDragStartWidth = nil
                    }
                }

                centerPanel(width: layout.centerWidth, height: availableHeight)

                if layout.showsRightPanel {
                    PanelResizeHandle { translation in
                        if rightDragStartWidth == nil {
                            rightDragStartWidth = layoutStore.rightPanelWidth
                        }

                        let startWidth = rightDragStartWidth ?? layoutStore.rightPanelWidth
                        let proposedWidth = startWidth - translation
                        let maxAllowedWidth = layout.maximumResizableRightWidth

                        layoutStore.rightPanelWidth = max(
                            layoutStore.rightPanelMinimumWidth,
                            min(proposedWidth, maxAllowedWidth)
                        )
                    }
                    .onEnded {
                        rightDragStartWidth = nil
                    }

                    rightPanel(width: layout.rightWidth, height: availableHeight)
                }
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
        Group {
            if let selectedInput {
                MappingEditorView(selectedInput: selectedInput)
            } else {
                MappingEditorPlaceholderView()
            }
        }
        .frame(width: width, height: height, alignment: .topLeading)
        .background(panelBackground)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private var panelBackground: some View {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
            .fill(Color(nsColor: .controlBackgroundColor).opacity(0.58))
    }

    private func resolvedLayout(
        availableWidth: CGFloat,
        columnSpacing: CGFloat
    ) -> ResolvedLayout {
        let showsLeftPanel = layoutStore.isLeftPanelVisible
        let showsRightPanel = shouldShowRightPanel

        let handleWidth: CGFloat = 10

        let leftHandleWidth = showsLeftPanel ? handleWidth : 0
        let rightHandleWidth = showsRightPanel ? handleWidth : 0

        let visibleItemCount =
            (showsLeftPanel ? 1 : 0) +
            1 +
            (showsRightPanel ? 1 : 0) +
            (showsLeftPanel ? 1 : 0) +
            (showsRightPanel ? 1 : 0)

        let spacingCount = max(0, visibleItemCount - 1)
        let totalSpacingWidth = CGFloat(spacingCount) * columnSpacing

        let minimumCenterWidth = layoutStore.minimumCenterWidth

        let requestedLeftWidth = showsLeftPanel
            ? layoutStore.clampedLeftWidth(layoutStore.leftPanelWidth)
            : 0

        let requestedRightWidth = showsRightPanel
            ? layoutStore.clampedRightWidth(layoutStore.rightPanelWidth)
            : 0

        let fixedChromeWidth = leftHandleWidth + rightHandleWidth + totalSpacingWidth
        let totalRequestedWidth =
            requestedLeftWidth +
            requestedRightWidth +
            minimumCenterWidth +
            fixedChromeWidth

        let availableForPanels = max(0, availableWidth - fixedChromeWidth)

        var leftWidth = requestedLeftWidth
        var rightWidth = requestedRightWidth

        if totalRequestedWidth > availableWidth {
            let overflow = totalRequestedWidth - availableWidth

            if showsLeftPanel && showsRightPanel {
                let leftShrinkCapacity = max(0, requestedLeftWidth - layoutStore.leftPanelMinimumWidth)
                let rightShrinkCapacity = max(0, requestedRightWidth - layoutStore.rightPanelMinimumWidth)
                let totalShrinkCapacity = leftShrinkCapacity + rightShrinkCapacity

                if totalShrinkCapacity > 0 {
                    let leftShare = leftShrinkCapacity / totalShrinkCapacity
                    let rightShare = rightShrinkCapacity / totalShrinkCapacity

                    let leftShrink = min(leftShrinkCapacity, overflow * leftShare)
                    let rightShrink = min(rightShrinkCapacity, overflow * rightShare)

                    leftWidth -= leftShrink
                    rightWidth -= rightShrink

                    let remainingOverflow = max(0, overflow - leftShrink - rightShrink)

                    if remainingOverflow > 0, leftWidth > layoutStore.leftPanelMinimumWidth {
                        let extraLeftShrink = min(
                            leftWidth - layoutStore.leftPanelMinimumWidth,
                            remainingOverflow
                        )
                        leftWidth -= extraLeftShrink
                    }

                    let secondOverflow = max(
                        0,
                        leftWidth + rightWidth + minimumCenterWidth + fixedChromeWidth - availableWidth
                    )

                    if secondOverflow > 0, rightWidth > layoutStore.rightPanelMinimumWidth {
                        let extraRightShrink = min(
                            rightWidth - layoutStore.rightPanelMinimumWidth,
                            secondOverflow
                        )
                        rightWidth -= extraRightShrink
                    }
                }
            } else if showsLeftPanel {
                leftWidth = max(layoutStore.leftPanelMinimumWidth, requestedLeftWidth - overflow)
            } else if showsRightPanel {
                rightWidth = max(layoutStore.rightPanelMinimumWidth, requestedRightWidth - overflow)
            }
        }

        let centerWidth = max(
            minimumCenterWidth,
            availableForPanels - leftWidth - rightWidth
        )

        let maximumResizableLeftWidth = max(
            layoutStore.leftPanelMinimumWidth,
            availableForPanels - rightWidth - minimumCenterWidth
        )

        let maximumResizableRightWidth = max(
            layoutStore.rightPanelMinimumWidth,
            availableForPanels - leftWidth - minimumCenterWidth
        )

        return ResolvedLayout(
            showsLeftPanel: showsLeftPanel,
            showsRightPanel: showsRightPanel,
            leftWidth: leftWidth,
            centerWidth: centerWidth,
            rightWidth: rightWidth,
            leftPanelMinimumWidth: layoutStore.leftPanelMinimumWidth,
            rightPanelMinimumWidth: layoutStore.rightPanelMinimumWidth,
            maximumResizableLeftWidth: min(maximumResizableLeftWidth, layoutStore.leftPanelMaximumWidth),
            maximumResizableRightWidth: min(maximumResizableRightWidth, layoutStore.rightPanelMaximumWidth)
        )
    }

    private func clamp(_ value: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat {
        Swift.max(min, Swift.min(max, value))
    }
}

private struct ResolvedLayout {
    let showsLeftPanel: Bool
    let showsRightPanel: Bool

    let leftWidth: CGFloat
    let centerWidth: CGFloat
    let rightWidth: CGFloat

    let leftPanelMinimumWidth: CGFloat
    let rightPanelMinimumWidth: CGFloat

    let maximumResizableLeftWidth: CGFloat
    let maximumResizableRightWidth: CGFloat
}

private extension View {
    func onEnded(_ action: @escaping () -> Void) -> some View {
        simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onEnded { _ in
                    action()
                }
        )
    }
}
