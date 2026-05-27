import SwiftUI

struct MainControllerPanel: View {
    @Binding var highlightedInputs: Set<ControllerInput>

    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height

            let horizontalPadding = clamp(width * 0.035, min: 16, max: 32)
            let verticalPadding = clamp(height * 0.035, min: 16, max: 28)
            let spacing = clamp(height * 0.025, min: 16, max: 28)

            VStack(alignment: .leading, spacing: spacing) {
                header(width: width)

                ControllerPreviewView(highlightedInputs: highlightedInputs)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .layoutPriority(1)
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    private func header(width: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Apple Remote Controller")
                .font(.system(size: clamp(width * 0.042, min: 24, max: 38), weight: .semibold))

            Text("Prévisualisation de la manette")
                .font(.system(size: clamp(width * 0.018, min: 13, max: 17)))
                .foregroundStyle(.secondary)
        }
    }

    private func clamp(_ value: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat {
        Swift.max(min, Swift.min(max, value))
    }
}
