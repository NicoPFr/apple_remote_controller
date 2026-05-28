//
//  AnalogStickRuntime.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import Foundation
import CoreGraphics

@MainActor
final class AnalogStickRuntime {
    private let mappingStore: ControllerMappingStore
    private let dispatcher: SystemEventDispatcher
    private let settingsStore: AppSettingsStore

    private var timer: Timer?

    private var leftStick: StickVector = .zero
    private var rightStick: StickVector = .zero

    init(
        mappingStore: ControllerMappingStore,
        dispatcher: SystemEventDispatcher,
        settingsStore: AppSettingsStore
    ) {
        self.mappingStore = mappingStore
        self.dispatcher = dispatcher
        self.settingsStore = settingsStore
    }

    convenience init(mappingStore: ControllerMappingStore) {
        self.init(
            mappingStore: mappingStore,
            dispatcher: SystemEventDispatcher(),
            settingsStore: AppSettingsStore()
        )
    }

    func start() {
        stop()

        timer = Timer.scheduledTimer(withTimeInterval: 1.0 / 60.0, repeats: true) { [weak self] _ in
            guard let self else { return }

            Task { @MainActor in
                self.tick()
            }
        }
    }

    func stop() {
        timer?.invalidate()
        timer = nil
    }

    func updateLeftStick(_ vector: StickVector) {
        leftStick = filtered(vector, deadZone: settingsStore.leftStickDeadZone)
    }

    func updateRightStick(_ vector: StickVector) {
        rightStick = filtered(vector, deadZone: settingsStore.rightStickDeadZone)
    }

    private func tick() {
        handleRightStickMouseMove()
        handleLeftStickScroll()
    }

    private func handleRightStickMouseMove() {
        guard let action = mappingStore.action(for: .rightStickMove) else { return }
        guard case .mouseMove = action else { return }
        guard !rightStick.isNearlyZero else { return }

        let speed = CGFloat(settingsStore.mouseSpeed)
        let dx = CGFloat(rightStick.x) * speed
        let dy = CGFloat(rightStick.y) * speed

        dispatcher.moveMouseBy(deltaX: dx, deltaY: -dy)
    }

    private func handleLeftStickScroll() {
        guard let action = mappingStore.action(for: .leftStickMove) else { return }
        guard case .mouseScroll(let axis) = action else { return }
        guard !leftStick.isNearlyZero else { return }

        let speed = CGFloat(settingsStore.scrollSpeed)

        switch axis {
        case .vertical:
            let amount = Int32(CGFloat(leftStick.y) * speed)
            dispatcher.scrollStep(axis: .vertical, amount: amount)

        case .horizontal:
            let amount = Int32(CGFloat(leftStick.x) * speed)
            dispatcher.scrollStep(axis: .horizontal, amount: amount)
        }
    }

    private func filtered(_ vector: StickVector, deadZone: Float) -> StickVector {
        guard vector.magnitude >= deadZone else {
            return .zero
        }

        return StickVector(
            x: normalized(vector.x, deadZone: deadZone),
            y: normalized(vector.y, deadZone: deadZone)
        )
    }

    private func normalized(_ value: Float, deadZone: Float) -> Float {
        let sign: Float = value >= 0 ? 1 : -1
        let absValue = abs(value)

        guard absValue >= deadZone else { return 0 }

        let adjusted = (absValue - deadZone) / (1 - deadZone)
        return adjusted * sign
    }
}
