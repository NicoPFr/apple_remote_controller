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
    @StateObject private var mappingStore = ControllerMappingStore()

    var body: some View {
        ResponsiveThreePanelLayout(
            highlightedInputs: $highlightedInputs,
            selectedInput: $selectedInput
        )
        .environmentObject(mappingStore)
    }
}

#Preview {
    ContentView()
        .frame(width: 1280, height: 760)
}
