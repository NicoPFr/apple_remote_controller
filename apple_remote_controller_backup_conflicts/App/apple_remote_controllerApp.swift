//
//  apple_remote_controllerApp.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//

import SwiftUI
import AppKit

@main
struct apple_remote_controllerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    await configureInitialWindowIfNeeded()
                }
        }
    }

    private func configureInitialWindowIfNeeded() async {
        try? await Task.sleep(nanoseconds: 150_000_000)

        guard let screen = NSScreen.main,
              let window = NSApplication.shared.windows.first else { return }

        if window.identifier?.rawValue == "main-configured-window" {
            return
        }

        let visibleFrame = screen.visibleFrame
        let targetWidth = min(1280, visibleFrame.width * 0.66)
        let targetHeight = min(820, visibleFrame.height * 0.68)

        await MainActor.run {
            window.minSize = NSSize(width: 1100, height: 720)

            let frame = NSRect(
                x: visibleFrame.midX - targetWidth / 2,
                y: visibleFrame.midY - targetHeight / 2,
                width: targetWidth,
                height: targetHeight
            )

            window.setFrame(frame, display: true)
            window.identifier = NSUserInterfaceItemIdentifier("main-configured-window")
        }
    }
}
