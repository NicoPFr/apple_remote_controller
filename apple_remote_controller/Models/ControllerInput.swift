//
//  ControllerInput.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//

import Foundation

enum ControllerInput: String, CaseIterable, Hashable, Codable {
    case buttonA
    case buttonB
    case buttonX
    case buttonY

    case leftShoulder
    case rightShoulder

    case leftTrigger
    case rightTrigger

    case dpadUp
    case dpadDown
    case dpadLeft
    case dpadRight

    case leftStick
    case rightStick

    case leftStickMove
    case rightStickMove

    var label: String {
        switch self {
        case .buttonA: return "Bouton A"
        case .buttonB: return "Bouton B"
        case .buttonX: return "Bouton X"
        case .buttonY: return "Bouton Y"

        case .leftShoulder: return "LB"
        case .rightShoulder: return "RB"

        case .leftTrigger: return "LT"
        case .rightTrigger: return "RT"

        case .dpadUp: return "D-pad haut"
        case .dpadDown: return "D-pad bas"
        case .dpadLeft: return "D-pad gauche"
        case .dpadRight: return "D-pad droite"

        case .leftStick: return "Clic stick gauche"
        case .rightStick: return "Clic stick droit"

        case .leftStickMove: return "Mouvement stick gauche"
        case .rightStickMove: return "Mouvement stick droit"
        }
    }
}
