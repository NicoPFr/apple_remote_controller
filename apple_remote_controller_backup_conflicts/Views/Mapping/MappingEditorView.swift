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

    @State private var capturedKey: CapturedShortcut?
    @State private var capturedShortcut: CapturedShortcut?
    @State private var isRecordingKey = false
    @State private var isRecordingShortcut = false

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

    @ViewBuilder
    private var actionConfigurationSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Configuration")
                .font(.headline)

            switch selectedActionType {
            case .keyboardKey:
                keyCaptureSection(
                    title: "Touche clavier",
                    captured: capturedKey,
                    isRecording: $isRecordingKey,
                    binding: $capturedKey,
                    help: "Clique sur enregistrer, puis appuie sur une touche."
                )

            case .keyboardShortcut:
                keyCaptureSection(
                    title: "Raccourci clavier",
                    captured: capturedShortcut,
                    isRecording: $isRecordingShortcut,
                    binding: $capturedShortcut,
                    help: "Clique sur enregistrer, puis appuie sur la combinaison souhaitée."
                )

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
    
    private func displayText(for captured: CapturedShortcut?, isRecording: Bool) -> String {
        if isRecording {
            return "Appuie sur une touche..."
        }

        return captured?.displayLabel ?? "Cliquer pour définir une touche"
    }

    private func displayColor(forRecording isRecording: Bool, hasValue: Bool) -> Color {
        if isRecording {
            return Color.accentColor
        }

        return hasValue ? Color.primary : Color.secondary
    }

    private func keyCaptureSection(
        title: String,
        captured: CapturedShortcut?,
        isRecording: Binding<Bool>,
        binding: Binding<CapturedShortcut?>,
        help: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Button {
                isRecording.wrappedValue = true
            } label: {
                HStack {
                    Text(displayText(for: captured, isRecording: isRecording.wrappedValue))
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(displayColor(forRecording: isRecording.wrappedValue, hasValue: captured != nil))

                    Spacer()

                    Image(systemName: isRecording.wrappedValue ? "keyboard.badge.ellipsis" : "keyboard")
                        .foregroundStyle(isRecording.wrappedValue ? Color.accentColor : Color.secondary)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color(nsColor: .textBackgroundColor))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(
                            isRecording.wrappedValue
                            ? Color.accentColor.opacity(0.7)
                            : Color.primary.opacity(0.08),
                            lineWidth: isRecording.wrappedValue ? 2 : 1
                        )
                )
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)

            Text(help)
                .font(.footnote)
                .foregroundStyle(.secondary)

            KeyCaptureField(
                capturedShortcut: binding,
                isRecording: isRecording
            )
            .frame(width: 0, height: 0)
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
            guard let capturedKey else { return }
            action = .keyboardKey(capturedKey.key)

        case .keyboardShortcut:
            guard let capturedShortcut else { return }
            action = .keyboardShortcut(
                modifiers: capturedShortcut.modifiers,
                key: capturedShortcut.key
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
            capturedKey = CapturedShortcut(key: key, modifiers: [])

        case .keyboardShortcut(let modifiers, let key):
            resetEditor()
            selectedActionType = .keyboardShortcut
            capturedShortcut = CapturedShortcut(key: key, modifiers: modifiers)

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
        capturedKey = nil
        capturedShortcut = nil
        isRecordingKey = false
        isRecordingShortcut = false
        selectedMouseButton = .left
        selectedMouseAxis = .x
        selectedScrollAxis = .vertical
        selectedSystemAction = .missionControl
    }
}

#Preview {
    MappingEditorView(selectedInput: .buttonA)
        .environmentObject(ControllerMappingStore())
        .frame(width: 360, height: 700)
}
