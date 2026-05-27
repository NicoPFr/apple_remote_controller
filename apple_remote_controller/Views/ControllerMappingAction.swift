import Foundation

enum ControllerMappingAction: Hashable, Codable {
    case keyboardKey(String)
    case keyboardShortcut(modifiers: [KeyboardModifier], key: String)
    case mouseMove(axis: MouseAxis)
    case mouseButton(MouseButton)
    case mouseScroll(axis: ScrollAxis)
    case systemAction(SystemAction)
}

enum KeyboardModifier: String, Hashable, Codable, CaseIterable {
    case command
    case option
    case control
    case shift

    var label: String {
        switch self {
        case .command: return "⌘"
        case .option: return "⌥"
        case .control: return "⌃"
        case .shift: return "⇧"
        }
    }
}

enum MouseAxis: String, Hashable, Codable, CaseIterable {
    case x
    case y

    var label: String {
        switch self {
        case .x: return "Horizontal"
        case .y: return "Vertical"
        }
    }
}

enum MouseButton: String, Hashable, Codable, CaseIterable {
    case left
    case right
    case middle

    var label: String {
        switch self {
        case .left: return "Clic gauche"
        case .right: return "Clic droit"
        case .middle: return "Clic milieu"
        }
    }
}

enum ScrollAxis: String, Hashable, Codable, CaseIterable {
    case horizontal
    case vertical

    var label: String {
        switch self {
        case .horizontal: return "Défilement horizontal"
        case .vertical: return "Défilement vertical"
        }
    }
}

enum SystemAction: String, Hashable, Codable, CaseIterable {
    case missionControl
    case appSwitcher
    case launchpad
    case showDesktop

    var label: String {
        switch self {
        case .missionControl: return "Mission Control"
        case .appSwitcher: return "Sélecteur d’apps"
        case .launchpad: return "Launchpad"
        case .showDesktop: return "Afficher le bureau"
        }
    }
}

enum MappingActionType: String, CaseIterable, Hashable {
    case keyboardKey
    case keyboardShortcut
    case mouseButton
    case mouseMove
    case mouseScroll
    case systemAction

    var label: String {
        switch self {
        case .keyboardKey: return "Touche clavier"
        case .keyboardShortcut: return "Raccourci clavier"
        case .mouseButton: return "Bouton souris"
        case .mouseMove: return "Mouvement souris"
        case .mouseScroll: return "Défilement souris"
        case .systemAction: return "Action système"
        }
    }
}
