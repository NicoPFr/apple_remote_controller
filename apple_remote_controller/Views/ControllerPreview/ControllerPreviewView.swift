//
//  ControllerPreviewView.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI

struct ControllerPreviewView: View {
    let highlightedInputs: Set<ControllerInput>

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
                faceButton("Y", color: Color.yellow, active: highlightedInputs.contains(.buttonY))
                    .position(x: size.width * 0.775, y: size.height * 0.405)

                faceButton("X", color: Color.blue, active: highlightedInputs.contains(.buttonX))
                    .position(x: size.width * 0.725, y: size.height * 0.475)

                faceButton("B", color: Color.red, active: highlightedInputs.contains(.buttonB))
                    .position(x: size.width * 0.825, y: size.height * 0.475)

                faceButton("A", color: Color.green, active: highlightedInputs.contains(.buttonA))
                    .position(x: size.width * 0.775, y: size.height * 0.545)

                stickHighlight(active: highlightedInputs.contains(.leftStick))
                    .position(x: size.width * 0.365, y: size.height * 0.705)

                stickHighlight(active: highlightedInputs.contains(.rightStick))
                    .position(x: size.width * 0.625, y: size.height * 0.705)

                dpadHighlight(activeInputs: highlightedInputs)
                    .position(x: size.width * 0.225, y: size.height * 0.565)

                shoulderHighlight(title: "LB", active: highlightedInputs.contains(.leftShoulder))
                    .position(x: size.width * 0.255, y: size.height * 0.175)

                shoulderHighlight(title: "RB", active: highlightedInputs.contains(.rightShoulder))
                    .position(x: size.width * 0.745, y: size.height * 0.175)

                triggerHighlight(title: "LT", active: highlightedInputs.contains(.leftTrigger))
                    .position(x: size.width * 0.245, y: size.height * 0.085)

                triggerHighlight(title: "RT", active: highlightedInputs.contains(.rightTrigger))
                    .position(x: size.width * 0.755, y: size.height * 0.085)
            }
        }
        .allowsHitTesting(false)
    }

    private func faceButton(_ title: String, color: Color, active: Bool) -> some View {
        ZStack {
            Circle()
                .fill(active ? color.opacity(0.95) : Color.clear)
                .frame(width: 26, height: 26)
                .shadow(color: active ? color.opacity(0.45) : Color.clear, radius: 10)

            Circle()
                .stroke(active ? Color.white.opacity(0.9) : Color.clear, lineWidth: 1.2)
                .frame(width: 26, height: 26)

            if active {
                Text(title)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(Color.white)
            }
        }
    }

    private func stickHighlight(active: Bool) -> some View {
        Circle()
            .stroke(active ? Color.green.opacity(0.95) : Color.clear, lineWidth: 5)
            .frame(width: 58, height: 58)
            .shadow(color: active ? Color.green.opacity(0.35) : Color.clear, radius: 10)
    }

    private func shoulderHighlight(title: String, active: Bool) -> some View {
        ZStack {
            Capsule(style: .continuous)
                .fill(active ? Color.orange.opacity(0.92) : Color.clear)
                .frame(width: 82, height: 18)

            Capsule(style: .continuous)
                .stroke(active ? Color.white.opacity(0.85) : Color.clear, lineWidth: 1)

            if active {
                Text(title)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(Color.white)
            }
        }
    }

    private func triggerHighlight(title: String, active: Bool) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(active ? Color.purple.opacity(0.92) : Color.clear)
                .frame(width: 64, height: 20)

            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(active ? Color.white.opacity(0.85) : Color.clear, lineWidth: 1)

            if active {
                Text(title)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(Color.white)
            }
        }
    }

    private func dpadHighlight(activeInputs: Set<ControllerInput>) -> some View {
        let up = activeInputs.contains(.dpadUp)
        let down = activeInputs.contains(.dpadDown)
        let left = activeInputs.contains(.dpadLeft)
        let right = activeInputs.contains(.dpadRight)

        return ZStack {
            dpadDot(active: up)
                .offset(y: -18)

            dpadDot(active: down)
                .offset(y: 18)

            dpadDot(active: left)
                .offset(x: -18)

            dpadDot(active: right)
                .offset(x: 18)
        }
    }

    private func dpadDot(active: Bool) -> some View {
        Circle()
            .fill(active ? Color.white.opacity(0.95) : Color.clear)
            .frame(width: 16, height: 16)
            .shadow(color: active ? Color.white.opacity(0.35) : Color.clear, radius: 8)
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
        ]
    )
    .padding()
    .frame(width: 900, height: 420)
}
