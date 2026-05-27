import Foundation

@MainActor
final class MappingExecutionEngine: ObservableObject {
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
        // utile plus tard pour les actions continues
    }
}
