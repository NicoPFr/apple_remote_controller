import Foundation
import GameController
import Combine

@MainActor
final class GameControllerManager: ObservableObject {
    @Published private(set) var connectedControllerName: String?
    @Published private(set) var activeInputs: Set<ControllerInput> = []

    var onInputPressed: ((ControllerInput) -> Void)?
    var onInputReleased: ((ControllerInput) -> Void)?

    private var controller: GCController?

    init() {
        startMonitoring()
    }

    func startMonitoring() {
        NotificationCenter.default.addObserver(
            forName: .GCControllerDidConnect,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            guard let controller = notification.object as? GCController else { return }
            self?.handleControllerConnected(controller)
        }

        NotificationCenter.default.addObserver(
            forName: .GCControllerDidDisconnect,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.handleControllerDisconnected()
        }

        if let first = GCController.controllers().first {
            handleControllerConnected(first)
        }
    }

    private func handleControllerConnected(_ controller: GCController) {
        self.controller = controller
        connectedControllerName = controller.vendorName ?? "Manette connectée"
        configureHandlers(for: controller)
    }

    private func handleControllerDisconnected() {
        controller = nil
        connectedControllerName = nil
        activeInputs.removeAll()
    }

    private func configureHandlers(for controller: GCController) {
        guard let gamepad = controller.extendedGamepad else { return }

        gamepad.buttonA.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.buttonA, pressed: pressed)
        }

        gamepad.buttonB.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.buttonB, pressed: pressed)
        }

        gamepad.buttonX.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.buttonX, pressed: pressed)
        }

        gamepad.buttonY.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.buttonY, pressed: pressed)
        }

        gamepad.leftShoulder.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.leftShoulder, pressed: pressed)
        }

        gamepad.rightShoulder.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.rightShoulder, pressed: pressed)
        }

        gamepad.leftTrigger.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.leftTrigger, pressed: pressed)
        }

        gamepad.rightTrigger.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.rightTrigger, pressed: pressed)
        }

        gamepad.dpad.up.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.dpadUp, pressed: pressed)
        }

        gamepad.dpad.down.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.dpadDown, pressed: pressed)
        }

        gamepad.dpad.left.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.dpadLeft, pressed: pressed)
        }

        gamepad.dpad.right.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.dpadRight, pressed: pressed)
        }

        gamepad.leftThumbstickButton?.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.leftStick, pressed: pressed)
        }

        gamepad.rightThumbstickButton?.pressedChangedHandler = { [weak self] _, _, pressed in
            self?.update(.rightStick, pressed: pressed)
        }
    }

    private func update(_ input: ControllerInput, pressed: Bool) {
        if pressed {
            activeInputs.insert(input)
            onInputPressed?(input)
        } else {
            activeInputs.remove(input)
            onInputReleased?(input)
        }
    }
}
