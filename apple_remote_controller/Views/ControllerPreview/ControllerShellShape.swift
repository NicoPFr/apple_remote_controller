//
//  ControllerShellShape.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//


import SwiftUI

struct ControllerShellShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.width
        let h = rect.height

        path.move(to: CGPoint(x: w * 0.22, y: h * 0.22))

        path.addCurve(
            to: CGPoint(x: w * 0.11, y: h * 0.52),
            control1: CGPoint(x: w * 0.10, y: h * 0.24),
            control2: CGPoint(x: w * 0.05, y: h * 0.38)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.19, y: h * 0.88),
            control1: CGPoint(x: w * 0.14, y: h * 0.68),
            control2: CGPoint(x: w * 0.10, y: h * 0.83)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.34, y: h * 0.70),
            control1: CGPoint(x: w * 0.26, y: h * 0.95),
            control2: CGPoint(x: w * 0.27, y: h * 0.78)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.66, y: h * 0.70),
            control1: CGPoint(x: w * 0.43, y: h * 0.61),
            control2: CGPoint(x: w * 0.57, y: h * 0.61)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.81, y: h * 0.88),
            control1: CGPoint(x: w * 0.73, y: h * 0.78),
            control2: CGPoint(x: w * 0.74, y: h * 0.95)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.89, y: h * 0.52),
            control1: CGPoint(x: w * 0.90, y: h * 0.83),
            control2: CGPoint(x: w * 0.86, y: h * 0.68)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.78, y: h * 0.22),
            control1: CGPoint(x: w * 0.95, y: h * 0.38),
            control2: CGPoint(x: w * 0.90, y: h * 0.24)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.22, y: h * 0.22),
            control1: CGPoint(x: w * 0.64, y: h * 0.15),
            control2: CGPoint(x: w * 0.36, y: h * 0.15)
        )

        path.closeSubpath()
        return path
    }
}
