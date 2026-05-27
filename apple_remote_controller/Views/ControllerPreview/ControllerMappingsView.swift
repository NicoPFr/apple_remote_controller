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

    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 220, maximum: 320), spacing: 12, alignment: .top)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Mappings")
                .font(.headline)

            LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                ForEach(mappings, id: \.input) { mapping in
                    mappingCard(for: mapping)
                }
            }
        }
    }

    private func mappingCard(
        for mapping: (input: ControllerInput, label: String, action: String)
    ) -> some View {
        let isHighlighted = highlightedInputs.contains(mapping.input)

        return HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(mapping.label)
                    .font(.system(size: 14, weight: isHighlighted ? .semibold : .medium))

                Text(mapping.action)
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
}

#Preview {
    ControllerMappingsView(
        highlightedInputs: [.buttonA, .buttonX, .rightTrigger, .dpadUp]
    )
    .padding()
}
