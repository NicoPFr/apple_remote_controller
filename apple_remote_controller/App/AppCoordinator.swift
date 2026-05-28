//
//  AppCoordinator.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 27/05/2026.
//


import Foundation
import Combine

@MainActor
final class AppCoordinator: ObservableObject {
    @Published private(set) var hasAccessibilityPermission = false

    let mappingStore: ControllerMappingStore
    let controllerManager: GameControllerManager
    let dispatcher: SystemEventDispatcher
    let settingsStore: AppSettingsStore
    let layoutStore: UILayoutStore
    let analogRuntime: AnalogStickRuntime

    init() {
        self.mappingStore = ControllerMappingStore()
        self.controllerManager = GameControllerManager()
        self.dispatcher = SystemEventDispatcher()
        self.settingsStore = AppSettingsStore()
        self.layoutStore = UILayoutStore()
        self.analogRuntime = AnalogStickRuntime(
            mappingStore: mappingStore,
            dispatcher: dispatcher,
            settingsStore: settingsStore
        )

        hasAccessibilityPermission = AccessibilityPermissionService.isTrusted()

        controllerManager.onInputPressed = { [weak self] input in
            guard let self else { return }
            guard self.hasAccessibilityPermission else { return }
            guard let action = self.mappingStore.action(for: input) else { return }

            self.dispatcher.perform(action)
        }

        controllerManager.onLeftStickChanged = { [weak self] vector in
            guard let self, self.hasAccessibilityPermission else { return }
            self.analogRuntime.updateLeftStick(vector)
        }

        controllerManager.onRightStickChanged = { [weak self] vector in
            guard let self, self.hasAccessibilityPermission else { return }
            self.analogRuntime.updateRightStick(vector)
        }

        if hasAccessibilityPermission {
            analogRuntime.start()
        }
    }

    func requestAccessibilityPermission() {
        hasAccessibilityPermission = AccessibilityPermissionService.requestIfNeeded()

        if hasAccessibilityPermission {
            analogRuntime.start()
        }
    }

    func refreshAccessibilityPermission() {
        hasAccessibilityPermission = AccessibilityPermissionService.isTrusted()

        if hasAccessibilityPermission {
            analogRuntime.start()
        }
    }

    func openAccessibilitySettings() {
        AccessibilityPermissionService.openSystemSettings()
    }
}
