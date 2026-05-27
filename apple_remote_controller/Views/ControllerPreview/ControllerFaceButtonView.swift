//
//  ControllerFaceButtonView.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI

struct ControllerFaceButtonView: View {
    let title: String
    let color: Color
    let active: Bool

    var body: some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        colors: active
                        ? [color.opacity(0.95), color.opacity(0.60)]
                        : [Color.white.opacity(0.18), Color.black.opacity(0.22)],
                        center: .topLeading,
                        startRadius: 2,
                        endRadius: 24
                    )
                )
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(active ? 0.7 : 0.12), lineWidth: 1.2)
                )
                .shadow(color: active ? color.opacity(0.35) : .black.opacity(0.10), radius: 8, x: 0, y: 3)

            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 42, height: 42)
    }
}

struct ControllerStickView: View {
    let title: String
    let active: Bool

    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color.black.opacity(0.35), Color.black.opacity(0.20)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            Circle()
                .stroke(active ? Color.green.opacity(0.85) : Color.white.opacity(0.10), lineWidth: 4)

            Circle()
                .fill(
                    LinearGradient(
                        colors: active
                        ? [Color.green.opacity(0.95), Color.green.opacity(0.55)]
                        : [Color.gray.opacity(0.80), Color.black.opacity(0.45)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 34, height: 34)

            Circle()
                .stroke(Color.white.opacity(0.10), lineWidth: 1)
                .frame(width: 34, height: 34)

            Text(title)
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .offset(y: 56)
        }
        .frame(width: 84, height: 84)
        .shadow(color: active ? Color.green.opacity(0.25) : .black.opacity(0.10), radius: 8, x: 0, y: 3)
    }
}

struct ControllerShoulderView: View {
    let title: String
    let active: Bool

    var body: some View {
        ZStack {
            Capsule(style: .continuous)
                .fill(
                    LinearGradient(
                        colors: active
                        ? [Color.orange.opacity(0.95), Color.orange.opacity(0.60)]
                        : [Color.white.opacity(0.14), Color.black.opacity(0.15)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            Capsule(style: .continuous)
                .stroke(Color.white.opacity(0.12), lineWidth: 1)

            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(active ? .white : .primary)
        }
        .frame(width: 120, height: 28)
    }
}

struct ControllerTriggerView: View {
    let title: String
    let active: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: active
                        ? [Color.purple.opacity(0.95), Color.purple.opacity(0.60)]
                        : [Color.white.opacity(0.12), Color.black.opacity(0.14)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.white.opacity(0.12), lineWidth: 1)

            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(active ? .white : .primary)
        }
        .frame(width: 96, height: 34)
    }
}

struct ControllerDPadView: View {
    let highlightedInputs: Set<ControllerInput>

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 9, style: .continuous)
                .fill(dpadMaterial)
                .frame(width: 28, height: 90)

            RoundedRectangle(cornerRadius: 9, style: .continuous)
                .fill(dpadMaterial)
                .frame(width: 90, height: 28)

            dpadCap("↑", active: highlightedInputs.contains(.dpadUp))
                .offset(y: -32)

            dpadCap("↓", active: highlightedInputs.contains(.dpadDown))
                .offset(y: 32)

            dpadCap("←", active: highlightedInputs.contains(.dpadLeft))
                .offset(x: -32)

            dpadCap("→", active: highlightedInputs.contains(.dpadRight))
                .offset(x: 32)
        }
    }

    private var dpadMaterial: LinearGradient {
        LinearGradient(
            colors: [Color.white.opacity(0.12), Color.black.opacity(0.16)],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    private func dpadCap(_ title: String, active: Bool) -> some View {
        ZStack {
            Circle()
                .fill(active ? Color.white.opacity(0.28) : Color.clear)
                .frame(width: 26, height: 26)

            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(active ? .white : .secondary)
        }
    }
}
