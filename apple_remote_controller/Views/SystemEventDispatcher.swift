import Foundation
import AppKit

final class SystemEventDispatcher {
    func perform(_ action: ControllerMappingAction) {
        switch action {
        case .keyboardKey(let key):
            sendKeyboardKey(key)

        case .keyboardShortcut(let modifiers, let key):
            sendKeyboardShortcut(key: key, modifiers: modifiers)

        case .mouseButton(let button):
            clickMouse(button)

        case .mouseMove:
            break

        case .mouseScroll(let axis):
            scroll(axis)

        case .systemAction(let action):
            performSystemAction(action)
        }
    }

    private func sendKeyboardKey(_ key: String) {
        guard let keyCode = KeyCodeMapper.keyCode(for: key) else { return }

        let source = CGEventSource(stateID: .combinedSessionState)

        let keyDown = CGEvent(keyboardEventSource: source, virtualKey: keyCode, keyDown: true)
        let keyUp = CGEvent(keyboardEventSource: source, virtualKey: keyCode, keyDown: false)

        keyDown?.post(tap: .cghidEventTap)
        keyUp?.post(tap: .cghidEventTap)
    }

    private func sendKeyboardShortcut(key: String, modifiers: [KeyboardModifier]) {
        guard let keyCode = KeyCodeMapper.keyCode(for: key) else { return }

        let source = CGEventSource(stateID: .combinedSessionState)
        let flags = CGEventFlags(modifiers: modifiers)

        let keyDown = CGEvent(keyboardEventSource: source, virtualKey: keyCode, keyDown: true)
        keyDown?.flags = flags

        let keyUp = CGEvent(keyboardEventSource: source, virtualKey: keyCode, keyDown: false)
        keyUp?.flags = flags

        keyDown?.post(tap: .cghidEventTap)
        keyUp?.post(tap: .cghidEventTap)
    }

    private func clickMouse(_ button: MouseButton) {
        let location = NSEvent.mouseLocation

        let (downType, upType, cgButton): (CGEventType, CGEventType, CGMouseButton) = {
            switch button {
            case .left:
                return (.leftMouseDown, .leftMouseUp, .left)
            case .right:
                return (.rightMouseDown, .rightMouseUp, .right)
            case .middle:
                return (.otherMouseDown, .otherMouseUp, .center)
            }
        }()

        let source = CGEventSource(stateID: .combinedSessionState)

        let mouseDown = CGEvent(
            mouseEventSource: source,
            mouseType: downType,
            mouseCursorPosition: location,
            mouseButton: cgButton
        )

        let mouseUp = CGEvent(
            mouseEventSource: source,
            mouseType: upType,
            mouseCursorPosition: location,
            mouseButton: cgButton
        )

        mouseDown?.post(tap: .cghidEventTap)
        mouseUp?.post(tap: .cghidEventTap)
    }

    private func scroll(_ axis: ScrollAxis) {
        let event: CGEvent?

        switch axis {
        case .vertical:
            event = CGEvent(
                scrollWheelEvent2Source: nil,
                units: .pixel,
                wheelCount: 1,
                wheel1: 12,
                wheel2: 0,
                wheel3: 0
            )

        case .horizontal:
            event = CGEvent(
                scrollWheelEvent2Source: nil,
                units: .pixel,
                wheelCount: 2,
                wheel1: 0,
                wheel2: 12,
                wheel3: 0
            )
        }

        event?.post(tap: .cghidEventTap)
    }

    private func performSystemAction(_ action: SystemAction) {
        switch action {
        case .missionControl:
            sendKeyboardShortcut(key: "↑", modifiers: [.control])

        case .appSwitcher:
            sendKeyboardShortcut(key: "Tab", modifiers: [.command])

        case .launchpad:
            break

        case .showDesktop:
            break
        }
    }
}

private extension CGEventFlags {
    init(modifiers: [KeyboardModifier]) {
        var flags: CGEventFlags = []

        for modifier in modifiers {
            switch modifier {
            case .command:
                flags.insert(.maskCommand)
            case .option:
                flags.insert(.maskAlternate)
            case .control:
                flags.insert(.maskControl)
            case .shift:
                flags.insert(.maskShift)
            }
        }

        self = flags
    }
}
