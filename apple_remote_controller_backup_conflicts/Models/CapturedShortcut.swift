//
//  CapturedShortcut.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI
import AppKit

struct CapturedShortcut: Hashable {
    var key: String
    var modifiers: [KeyboardModifier]

    var displayLabel: String {
        let prefix = modifiers.map(\.label).joined()
        return prefix + key
    }
}

struct KeyCaptureField: NSViewRepresentable {
    @Binding var capturedShortcut: CapturedShortcut?
    @Binding var isRecording: Bool

    func makeNSView(context: Context) -> KeyCaptureNSView {
        let view = KeyCaptureNSView()
        view.onShortcutCaptured = { shortcut in
            DispatchQueue.main.async {
                self.capturedShortcut = shortcut
                self.isRecording = false
            }
        }
        return view
    }

    func updateNSView(_ nsView: KeyCaptureNSView, context: Context) {
        nsView.isRecording = isRecording

        if isRecording, nsView.window != nil, nsView.acceptsFirstResponder {
            nsView.window?.makeFirstResponder(nsView)
        }
    }
}

final class KeyCaptureNSView: NSView {
    var onShortcutCaptured: ((CapturedShortcut) -> Void)?
    var isRecording: Bool = false

    override var acceptsFirstResponder: Bool { true }

    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()

        if isRecording {
            window?.makeFirstResponder(self)
        }
    }

    override func keyDown(with event: NSEvent) {
        guard isRecording else {
            super.keyDown(with: event)
            return
        }

        let modifiers = event.modifierFlags.keyboardModifiers
        let key = event.keyDisplayString

        guard !key.isEmpty else { return }

        onShortcutCaptured?(
            CapturedShortcut(
                key: key,
                modifiers: modifiers
            )
        )
    }
}

private extension NSEvent.ModifierFlags {
    var keyboardModifiers: [KeyboardModifier] {
        var result: [KeyboardModifier] = []

        if contains(.command) { result.append(.command) }
        if contains(.option) { result.append(.option) }
        if contains(.control) { result.append(.control) }
        if contains(.shift) { result.append(.shift) }

        return result
    }
}

private extension NSEvent {
    var keyDisplayString: String {
        switch keyCode {
        case 36: return "Return"
        case 48: return "Tab"
        case 49: return "Space"
        case 51: return "Delete"
        case 53: return "Escape"
        case 123: return "←"
        case 124: return "→"
        case 125: return "↓"
        case 126: return "↑"
        default:
            return charactersIgnoringModifiers?.uppercased() ?? ""
        }
    }
}
