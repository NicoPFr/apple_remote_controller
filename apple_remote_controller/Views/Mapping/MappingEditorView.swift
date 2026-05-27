//
//  MappingEditorView.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI

struct MappingEditorView: View {
    @EnvironmentObject private var mappingStore: ControllerMappingStore

    let selectedInput: ControllerInput?

    @State private var selectedActionType: MappingActionType = .keyboardKey
    @State private var keyboardKey: String = ""
    @State private var shortcutKey: String = ""
    @State private var shortcutModifiers: Set<KeyboardModifier> = []
    @State private var selectedMouseButton: MouseButton = .left
    @State private var selectedMouseAxis: MouseAxis = .x
    @State private var selectedScrollAxis: ScrollAxis = .vertical
    @State private var selectedSystemAction: SystemAction = .missionControl

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                Text("Éditeur de mapping")
                    .font(.title2)
                    .fontWeight(.semibold)

                if let selectedInput {
                    selectedInputSection(selectedInput)
                    actionTypeSection
                    actionConfigurationSection
                    actionButtonsSection(for: selectedInput)

                    Spacer(minLength: 0)
                } else {
                    Text("Sélectionne une entrée de manette dans la colonne de gauche pour modifier son action.")
                        .foregroundStyle(.secondary)

                    Spacer(minLength: 0)
                }
            }
            .padding(20)
        }
        .scrollIndicators(.hidden)
        .onAppear {
            loadCurrentMapping()
        }
        .onChange(of: selectedInput) {
            loadCurrentMapping()
        }
    }

    private func selectedInputSection(_ input: ControllerInput) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Entrée sélectionnée")
                .font(.headline)

            Text(input.label)
                .font(.body)
                .foregroundStyle(.secondary)
        }
    }

    private var actionTypeSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Type d’action")
                .font(.headline)

            Picker("Type d’action", selection: $selectedActionType) {
                ForEach(MappingActionType.allCases, id: \.self) { type in
                    Text(type.label).tag(type)
                }
            }
            .pickerStyle(.menu)
        }
    }

    private var actionConfigurationSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Configuration")
                .font(.headline)

            switch selectedActionType {
            case .keyboardKey:
                TextField("Exemple : Space, A, Escape, Return", text: $keyboardKey)

            case .keyboardShortcut:
                VStack(alignment: .leading, spacing: 10) {
                    TextField("Touche principale", text: $shortcutKey)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Modificateurs")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        ForEach(KeyboardModifier.allCases, id: \.self) { modifier in
                            Toggle(
                                modifier.label,
                                isOn: Binding(
                                    get: { shortcutModifiers.contains(modifier) },
                                    set: { isOn in
                                        if isOn {
                                            shortcutModifiers.insert(modifier)
                                        } else {
                                            shortcutModifiers.remove(modifier)
                                        }
                                    }
                                )
                            )
                        }
                    }
                }

            case .mouseButton:
                Picker("Bouton souris", selection: $selectedMouseButton) {
                    ForEach(MouseButton.allCases, id: \.self) { button in
                        Text(button.label).tag(button)
                    }
                }
                .pickerStyle(.menu)

            case .mouseMove:
                Picker("Axe souris", selection: $selectedMouseAxis) {
                    ForEach(MouseAxis.allCases, id: \.self) { axis in
                        Text(axis.label).tag(axis)
                    }
                }
                .pickerStyle(.menu)

            case .mouseScroll:
                Picker("Axe de défilement", selection: $selectedScrollAxis) {
                    ForEach(ScrollAxis.allCases, id: \.self) { axis in
                        Text(axis.label).tag(axis)
                    }
                }
                .pickerStyle(.menu)

            case .systemAction:
                Picker("Action système", selection: $selectedSystemAction) {
                    ForEach(SystemAction.allCases, id: \.self) { action in
                        Text(action.label).tag(action)
                    }
                }
                .pickerStyle(.menu)
            }
        }
    }

    private func actionButtonsSection(for input: ControllerInput) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Button("Enregistrer le mapping") {
                saveMapping(for: input)
            }
            .buttonStyle(.borderedProminent)

            Button("Supprimer le mapping") {
                mappingStore.removeAction(for: input)
                loadCurrentMapping()
            }
            .buttonStyle(.bordered)
        }
    }

    private func saveMapping(for input: ControllerInput) {
        let action: ControllerMappingAction

        switch selectedActionType {
        case .keyboardKey:
            let trimmed = keyboardKey.trimmingCharacters(in: .whitespacesAndNewlines)
            action = .keyboardKey(trimmed)

        case .keyboardShortcut:
            let trimmed = shortcutKey.trimmingCharacters(in: .whitespacesAndNewlines)
            action = .keyboardShortcut(
                modifiers: Array(shortcutModifiers),
                key: trimmed
            )

        case .mouseButton:
            action = .mouseButton(selectedMouseButton)

        case .mouseMove:
            action = .mouseMove(axis: selectedMouseAxis)

        case .mouseScroll:
            action = .mouseScroll(axis: selectedScrollAxis)

        case .systemAction:
            action = .systemAction(selectedSystemAction)
        }

        mappingStore.setAction(action, for: input)
    }

    private func loadCurrentMapping() {
        guard let selectedInput,
              let action = mappingStore.action(for: selectedInput) else {
            resetEditor()
            return
        }

        switch action {
        case .keyboardKey(let key):
            resetEditor()
            selectedActionType = .keyboardKey
            keyboardKey = key

        case .keyboardShortcut(let modifiers, let key):
            resetEditor()
            selectedActionType = .keyboardShortcut
            shortcutKey = key
            shortcutModifiers = Set(modifiers)

        case .mouseButton(let button):
            resetEditor()
            selectedActionType = .mouseButton
            selectedMouseButton = button

        case .mouseMove(let axis):
            resetEditor()
            selectedActionType = .mouseMove
            selectedMouseAxis = axis

        case .mouseScroll(let axis):
            resetEditor()
            selectedActionType = .mouseScroll
            selectedScrollAxis = axis

        case .systemAction(let action):
            resetEditor()
            selectedActionType = .systemAction
            selectedSystemAction = action
        }
    }

    private func resetEditor() {
        selectedActionType = .keyboardKey
        keyboardKey = ""
        shortcutKey = ""
        shortcutModifiers = []
        selectedMouseButton = .left
        selectedMouseAxis = .x
        selectedScrollAxis = .vertical
        selectedSystemAction = .missionControl
    }
}

#Preview {
    MappingEditorView(selectedInput: .buttonA)
        .environmentObject(ControllerMappingStore())
        .frame(width: 320, height: 700)
}
