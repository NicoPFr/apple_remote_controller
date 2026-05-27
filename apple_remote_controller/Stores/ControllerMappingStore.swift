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
    @Published var mappings: [ControllerInput: ControllerMappingAction] = [:]

    private let storageKey = "controller.mappings.v1"

    private var cancellables = Set<AnyCancellable>()

    init() {
        loadMappings()

        $mappings
            .dropFirst()
            .sink { [weak self] newMappings in
                self?.saveMappings(newMappings)
            }
            .store(in: &cancellables)
    }

    func action(for input: ControllerInput) -> ControllerMappingAction? {
        mappings[input]
    }

    func setAction(_ action: ControllerMappingAction, for input: ControllerInput) {
        mappings[input] = action
    }

    func removeAction(for input: ControllerInput) {
        mappings.removeValue(forKey: input)
    }

    func resetToDefaults() {
        mappings = Self.defaultMappings
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

// MARK: - Persistence
private extension ControllerMappingStore {
    static let defaultMappings: [ControllerInput: ControllerMappingAction] = [
        .buttonA: .keyboardKey("Space"),
        .buttonB: .mouseButton(.right),
        .buttonX: .keyboardKey("R"),
        .buttonY: .systemAction(.missionControl),
        .leftStickMove: .mouseScroll(axis: .vertical),
        .rightStickMove: .mouseMove(axis: .x)
    ]

    func loadMappings() {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else {
            mappings = Self.defaultMappings
            return
        }

        do {
            let stored = try JSONDecoder().decode([StoredMapping].self, from: data)
            let restored = Dictionary(uniqueKeysWithValues: stored.map { ($0.input, $0.action) })

            mappings = restored.isEmpty ? Self.defaultMappings : restored
        } catch {
            print("Erreur chargement mappings: \(error)")
            mappings = Self.defaultMappings
        }
    }

    func saveMappings(_ mappings: [ControllerInput: ControllerMappingAction]) {
        let stored = mappings.map { StoredMapping(input: $0.key, action: $0.value) }

        do {
            let data = try JSONEncoder().encode(stored)
            UserDefaults.standard.set(data, forKey: storageKey)
        } catch {
            print("Erreur sauvegarde mappings: \(error)")
        }
    }
}
