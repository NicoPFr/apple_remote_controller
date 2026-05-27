//
//  MappingExecutionEngine.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import Foundation

@MainActor
final class MappingExecutionEngine {
    private let mappingStore: ControllerMappingStore
    private let dispatcher = SystemEventDispatcher()

    init(mappingStore: ControllerMappingStore) {
        self.mappingStore = mappingStore
    }

    func handleInputPressed(_ input: ControllerInput) {
        guard let action = mappingStore.action(for: input) else { return }
        dispatcher.perform(action)
    }

    func handleInputReleased(_ input: ControllerInput) {
        // réservé pour press/release ou maintien plus tard
    }
}
