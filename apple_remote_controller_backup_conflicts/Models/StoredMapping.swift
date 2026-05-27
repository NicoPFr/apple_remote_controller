//
//  StoredMapping.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 27/05/2026.
//

import Foundation

struct StoredMapping: Codable {
    let input: ControllerInput
    let action: ControllerMappingAction
}
