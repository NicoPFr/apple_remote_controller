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
    @StateObject private var controllerManager = GameControllerManager()

    @State private var executionEngine: MappingExecutionEngine?
    @State private var analogRuntime: AnalogStickRuntime?

    var body: some View {
        ResponsiveThreePanelLayout(
            highlightedInputs: $highlightedInputs,
            selectedInput: $selectedInput
        )
        .environmentObject(mappingStore)
        .onAppear {
            let engine = MappingExecutionEngine(mappingStore: mappingStore)
            let analog = AnalogStickRuntime(mappingStore: mappingStore)

            executionEngine = engine
            analogRuntime = analog
            analog.start()

            controllerManager.onInputPressed = { (input: ControllerInput) in
                highlightedInputs = [input]
                selectedInput = input
                engine.handleInputPressed(input)
            }

            controllerManager.onInputReleased = { (_: ControllerInput) in
            }

            controllerManager.onLeftStickChanged = { vector in
                analog.updateLeftStick(vector)
            }

            controllerManager.onRightStickChanged = { vector in
                analog.updateRightStick(vector)
            }
        }
        .onDisappear {
            analogRuntime?.stop()
        }
    }
}

#Preview {
    ContentView()
        .frame(width: 1280, height: 760)
}
