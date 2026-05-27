//
//  AccessibilityPermissionService.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 27/05/2026.
//


import Foundation
import ApplicationServices
import AppKit

enum AccessibilityPermissionService {
    static func isTrusted() -> Bool {
        AXIsProcessTrusted()
    }

    static func requestIfNeeded() -> Bool {
        let options = [
            kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true
        ] as CFDictionary

        return AXIsProcessTrustedWithOptions(options)
    }

    static func openSystemSettings() {
        guard let url = URL(
            string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
        ) else { return }

        NSWorkspace.shared.open(url)
    }
}
