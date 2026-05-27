import Foundation
import SwiftUI

@MainActor
final class ControllerMappingStore: ObservableObject {
    @Published var mappings: [ControllerInput: ControllerMappingAction] = [
        .buttonA: .keyboardKey("Space"),
        .buttonB: .mouseButton(.right),
        .buttonX: .keyboardKey("R"),
        .buttonY: .systemAction(.missionControl),
        .leftStick: .mouseScroll(axis: .vertical),
        .rightStick: .mouseMove(axis: .x)
    ]

    func action(for input: ControllerInput) -> ControllerMappingAction? {
        mappings[input]
    }

    func setAction(_ action: ControllerMappingAction, for input: ControllerInput) {
        mappings[input] = action
    }

    func removeAction(for input: ControllerInput) {
        mappings.removeValue(forKey: input)
    }

    func description(for input: ControllerInput) -> String {
        guard let action = mappings[input] else {
            return "Non assigné"
        }

        return description(for: action)
    }

    func description(for action: ControllerMappingAction) -> String {
        switch action {
        case .keyboardKey(let key):
            return "Touche \(key)"
        case .keyboardShortcut(let modifiers, let key):
            let prefix = modifiers.map(\.label).joined(separator: "")
            return "Raccourci \(prefix)\(key)"
        case .mouseMove(let axis):
            return "Mouvement souris \(axis.label.lowercased())"
        case .mouseButton(let button):
            return button.label
        case .mouseScroll(let axis):
            return axis.label
        case .systemAction(let action):
            return action.label
        }
    }
}
