//
//  GameControllerManager.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import Foundation
import GameController
import Combine

struct StickVector: Equatable {
    var x: Float
    var y: Float

    static let zero = StickVector(x: 0, y: 0)

    var magnitude: Float {
        sqrt((x * x) + (y * y))
    }

    var isNearlyZero: Bool {
        abs(x) < 0.001 && abs(y) < 0.001
    }
}

@MainActor
final class GameControllerManager: ObservableObject {
    @Published private(set) var connectedControllerName: String?
    @Published private(set) var activeInputs: Set<ControllerInput> = []
    @Published private(set) var leftStickVector: StickVector = .zero
    @Published private(set) var rightStickVector: StickVector = .zero

    var onInputPressed: ((ControllerInput) -> Void)?
    var onInputReleased: ((ControllerInput) -> Void)?
    var onLeftStickChanged: ((StickVector) -> Void)?
    var onRightStickChanged: ((StickVector) -> Void)?

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
            guard let self,
                  let controller = notification.object as? GCController else { return }

            Task { @MainActor in
                self.handleControllerConnected(controller)
            }
        }

        NotificationCenter.default.addObserver(
            forName: .GCControllerDidDisconnect,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            guard let self else { return }

            Task { @MainActor in
                self.handleControllerDisconnected()
            }
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
        leftStickVector = .zero
        rightStickVector = .zero
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

        gamepad.leftThumbstick.valueChangedHandler = { [weak self] _, xValue, yValue in
            self?.updateLeftStick(StickVector(x: xValue, y: yValue))
        }

        gamepad.rightThumbstick.valueChangedHandler = { [weak self] _, xValue, yValue in
            self?.updateRightStick(StickVector(x: xValue, y: yValue))
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

    private func updateLeftStick(_ vector: StickVector) {
        leftStickVector = vector
        onLeftStickChanged?(vector)
    }

    private func updateRightStick(_ vector: StickVector) {
        rightStickVector = vector
        onRightStickChanged?(vector)
    }
}
