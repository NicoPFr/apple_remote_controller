//
//  ContentView.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI

struct ContentView: View {
    @State private var highlightedInputs: Set<ControllerInput> = [.buttonA]
    @State private var selectedInput: ControllerInput? = .buttonA
    @StateObject private var coordinator = AppCoordinator()

    var body: some View {
        VStack(spacing: 0) {
            if !coordinator.hasAccessibilityPermission {
                AccessibilityPermissionBanner(
                    onRequestPermission: {
                        coordinator.requestAccessibilityPermission()
                    },
                    onOpenSettings: {
                        coordinator.openAccessibilitySettings()
                    },
                    onRefresh: {
                        coordinator.refreshAccessibilityPermission()
                    }
                )
            }

            ResponsiveThreePanelLayout(
                highlightedInputs: $highlightedInputs,
                selectedInput: $selectedInput
            )
        }
        .environmentObject(coordinator.mappingStore)
        .environmentObject(coordinator.controllerManager)
        .environmentObject(coordinator.settingsStore)
        .environmentObject(coordinator.layoutStore)
    }
}

#Preview {
    ContentView()
        .frame(width: 1280, height: 760)
}
