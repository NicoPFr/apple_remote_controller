//
//  ControllerPreviewView.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//

import SwiftUI

struct ControllerPreviewView: View {
    let highlightedInputs: Set<ControllerInput>
    let selectedInput: ControllerInput?
    let onSelectInput: (ControllerInput) -> Void

    private let controllerAspectRatio: CGFloat = 744 / 500

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            let maxWidth = size.width * 0.78
            let maxHeight = size.height * 0.84

            let fittedWidth = min(maxWidth, maxHeight * controllerAspectRatio)
            let fittedHeight = fittedWidth / controllerAspectRatio

            VStack {
                Spacer(minLength: 0)

                ZStack {
                    XboxControllerView()
                        .resizable()
                        .aspectRatio(controllerAspectRatio, contentMode: .fit)
                        .frame(width: fittedWidth, height: fittedHeight)

                    controllerOverlay
                        .frame(width: fittedWidth, height: fittedHeight)
                }

                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(minHeight: 260)
    }

    private var controllerOverlay: some View {
        GeometryReader { proxy in
            let size = proxy.size

            ZStack {
                interactiveFaceButton(
                    title: "Y",
                    color: .yellow,
                    input: .buttonY,
                    x: size.width * 0.775,
                    y: size.height * 0.405
                )

                interactiveFaceButton(
                    title: "X",
                    color: .blue,
                    input: .buttonX,
                    x: size.width * 0.725,
                    y: size.height * 0.475
                )

                interactiveFaceButton(
                    title: "B",
                    color: .red,
                    input: .buttonB,
                    x: size.width * 0.825,
                    y: size.height * 0.475
                )

                interactiveFaceButton(
                    title: "A",
                    color: .green,
                    input: .buttonA,
                    x: size.width * 0.775,
                    y: size.height * 0.545
                )

                interactiveStick(
                    input: .leftStick,
                    x: size.width * 0.365,
                    y: size.height * 0.705
                )

                interactiveStick(
                    input: .rightStick,
                    x: size.width * 0.625,
                    y: size.height * 0.705
                )

                interactiveDpad(size: size)

                interactiveShoulder(
                    title: "LB",
                    input: .leftShoulder,
                    x: size.width * 0.255,
                    y: size.height * 0.175
                )

                interactiveShoulder(
                    title: "RB",
                    input: .rightShoulder,
                    x: size.width * 0.745,
                    y: size.height * 0.175
                )

                interactiveTrigger(
                    title: "LT",
                    input: .leftTrigger,
                    x: size.width * 0.245,
                    y: size.height * 0.085
                )

                interactiveTrigger(
                    title: "RT",
                    input: .rightTrigger,
                    x: size.width * 0.755,
                    y: size.height * 0.085
                )
            }
        }
    }

    private func interactiveFaceButton(
        title: String,
        color: Color,
        input: ControllerInput,
        x: CGFloat,
        y: CGFloat
    ) -> some View {
        let isActive = highlightedInputs.contains(input)
        let isSelected = selectedInput == input

        return Button {
            onSelectInput(input)
        } label: {
            ZStack {
                Circle()
                    .fill(isActive || isSelected ? color.opacity(0.95) : Color.clear)
                    .frame(width: 26, height: 26)
                    .shadow(color: (isActive || isSelected) ? color.opacity(0.45) : Color.clear, radius: 10)

                Circle()
                    .stroke((isActive || isSelected) ? Color.white.opacity(0.9) : Color.clear, lineWidth: 1.2)
                    .frame(width: 26, height: 26)

                if isActive || isSelected {
                    Text(title)
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(Color.white)
                }
            }
            .frame(width: 36, height: 36)
            .contentShape(Circle())
        }
        .buttonStyle(.plain)
        .position(x: x, y: y)
    }

    private func interactiveStick(
        input: ControllerInput,
        x: CGFloat,
        y: CGFloat
    ) -> some View {
        let isActive = highlightedInputs.contains(input)
        let isSelected = selectedInput == input

        return Button {
            onSelectInput(input)
        } label: {
            Circle()
                .stroke((isActive || isSelected) ? Color.green.opacity(0.95) : Color.clear, lineWidth: 5)
                .frame(width: 58, height: 58)
                .shadow(color: (isActive || isSelected) ? Color.green.opacity(0.35) : Color.clear, radius: 10)
                .contentShape(Circle())
        }
        .buttonStyle(.plain)
        .frame(width: 70, height: 70)
        .position(x: x, y: y)
    }

    private func interactiveShoulder(
        title: String,
        input: ControllerInput,
        x: CGFloat,
        y: CGFloat
    ) -> some View {
        let isActive = highlightedInputs.contains(input)
        let isSelected = selectedInput == input

        return Button {
            onSelectInput(input)
        } label: {
            ZStack {
                Capsule(style: .continuous)
                    .fill(isActive || isSelected ? Color.orange.opacity(0.92) : Color.clear)
                    .frame(width: 82, height: 18)

                Capsule(style: .continuous)
                    .stroke((isActive || isSelected) ? Color.white.opacity(0.85) : Color.clear, lineWidth: 1)

                if isActive || isSelected {
                    Text(title)
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(Color.white)
                }
            }
            .frame(width: 90, height: 28)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .position(x: x, y: y)
    }

    private func interactiveTrigger(
        title: String,
        input: ControllerInput,
        x: CGFloat,
        y: CGFloat
    ) -> some View {
        let isActive = highlightedInputs.contains(input)
        let isSelected = selectedInput == input

        return Button {
            onSelectInput(input)
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(isActive || isSelected ? Color.purple.opacity(0.92) : Color.clear)
                    .frame(width: 64, height: 20)

                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke((isActive || isSelected) ? Color.white.opacity(0.85) : Color.clear, lineWidth: 1)

                if isActive || isSelected {
                    Text(title)
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(Color.white)
                }
            }
            .frame(width: 74, height: 30)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .position(x: x, y: y)
    }

    private func interactiveDpad(size: CGSize) -> some View {
        ZStack {
            dpadButton(input: .dpadUp, offsetX: 0, offsetY: -18)
            dpadButton(input: .dpadDown, offsetX: 0, offsetY: 18)
            dpadButton(input: .dpadLeft, offsetX: -18, offsetY: 0)
            dpadButton(input: .dpadRight, offsetX: 18, offsetY: 0)
        }
        .position(x: size.width * 0.225, y: size.height * 0.565)
    }

    private func dpadButton(
        input: ControllerInput,
        offsetX: CGFloat,
        offsetY: CGFloat
    ) -> some View {
        let isActive = highlightedInputs.contains(input)
        let isSelected = selectedInput == input

        return Button {
            onSelectInput(input)
        } label: {
            Circle()
                .fill(isActive || isSelected ? Color.white.opacity(0.95) : Color.clear)
                .frame(width: 16, height: 16)
                .shadow(color: (isActive || isSelected) ? Color.white.opacity(0.35) : Color.clear, radius: 8)
                .frame(width: 28, height: 28)
                .contentShape(Circle())
        }
        .buttonStyle(.plain)
        .offset(x: offsetX, y: offsetY)
    }
}

#Preview {
    ControllerPreviewView(
        highlightedInputs: [
            .buttonA,
            .buttonX,
            .rightStick,
            .leftTrigger,
            .dpadUp
        ],
        selectedInput: .buttonA,
        onSelectInput: { _ in }
    )
    .padding()
    .frame(width: 900, height: 420)
}
