//
//  AppSettingsStore.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 27/05/2026.
//


import Foundation
import Combine

@MainActor
final class AppSettingsStore: ObservableObject {
    @Published var leftStickDeadZone: Float = 0.18
    @Published var rightStickDeadZone: Float = 0.18

    @Published var mouseSpeed: Double = 18
    @Published var scrollSpeed: Double = 14
}
