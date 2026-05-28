//
//  ControllerMappingStore.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class ControllerMappingStore: ObservableObject {
    @Published var mappings: [ControllerInput: ControllerMappingAction] = [
        .buttonA: .keyboardKey("Space"),
        .buttonB: .mouseButton(.right),
        .buttonX: .keyboardKey("R"),
        .buttonY: .systemAction(.missionControl),
        .leftStickMove: .mouseScroll(axis: .vertical),
        .rightStickMove: .mouseMove
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
        case .mouseMove:
            return "Mouvement souris"
        case .mouseButton(let button):
            return button.label
        case .mouseScroll(let axis):
            return axis.label
        case .systemAction(let action):
            return action.label
        }
    }
}
