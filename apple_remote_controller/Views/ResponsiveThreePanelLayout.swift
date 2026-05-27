import SwiftUI

struct ResponsiveThreePanelLayout: View {
    @Binding var highlightedInputs: Set<ControllerInput>

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            let horizontalPadding = clamp(size.width * 0.02, min: 12, max: 28)
            let verticalPadding = clamp(size.height * 0.025, min: 12, max: 24)
            let columnSpacing = clamp(size.width * 0.015, min: 10, max: 24)

            let totalWidth = size.width - (horizontalPadding * 2)
            let totalHeight = size.height - (verticalPadding * 2)

            let leftWidth = clamp(totalWidth * 0.18, min: 160, max: 260)
            let rightWidth = clamp(totalWidth * 0.22, min: 190, max: 320)
            let centerWidth = max(320, totalWidth - leftWidth - rightWidth - (columnSpacing * 2))

            HStack(alignment: .top, spacing: columnSpacing) {
                leftPanel(width: leftWidth, height: totalHeight)

                centerPanel(width: centerWidth, height: totalHeight)

                rightPanel(width: rightWidth, height: totalHeight)
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(nsColor: .windowBackgroundColor))
        }
    }

    // MARK: - Panels

    private func leftPanel(width: CGFloat, height: CGFloat) -> some View {
        SidebarView(highlightedInputs: $highlightedInputs)
            .frame(width: width, height: height, alignment: .topLeading)
            .background(panelBackground)
    }

    private func centerPanel(width: CGFloat, height: CGFloat) -> some View {
        MainControllerPanel(highlightedInputs: $highlightedInputs)
            .frame(width: width, height: height, alignment: .topLeading)
            .background(panelBackground)
            .layoutPriority(1)
    }

    private func rightPanel(width: CGFloat, height: CGFloat) -> some View {
        MappingPlaceholderView()
            .frame(width: width, height: height, alignment: .topLeading)
            .background(panelBackground)
    }

    private var panelBackground: some View {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
            .fill(Color(nsColor: .controlBackgroundColor).opacity(0.55))
    }

    private func clamp(_ value: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat {
        Swift.max(min, Swift.min(max, value))
    }
}
