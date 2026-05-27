import SwiftUI

struct SidebarView: View {
    @Binding var highlightedInputs: Set<ControllerInput>

    var body: some View {
        List {
            Section("Tests visuels") {
                ForEach(ControllerInput.allCases, id: \.self) { input in
                    Button {
                        toggle(input)
                    } label: {
                        HStack {
                            Text(input.label)
                            Spacer()
                            Image(systemName: highlightedInputs.contains(input) ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(highlightedInputs.contains(input) ? .green : .secondary)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .navigationTitle("Contrôles")
    }

    private func toggle(_ input: ControllerInput) {
        if highlightedInputs.contains(input) {
            highlightedInputs.remove(input)
        } else {
            highlightedInputs.insert(input)
        }
    }
}
