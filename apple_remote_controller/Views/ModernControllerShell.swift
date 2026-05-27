import SwiftUI

struct ModernControllerShell: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.width
        let h = rect.height

        path.move(to: CGPoint(x: w * 0.18, y: h * 0.28))

        path.addCurve(
            to: CGPoint(x: w * 0.08, y: h * 0.60),
            control1: CGPoint(x: w * 0.08, y: h * 0.30),
            control2: CGPoint(x: w * 0.03, y: h * 0.45)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.16, y: h * 0.88),
            control1: CGPoint(x: w * 0.10, y: h * 0.72),
            control2: CGPoint(x: w * 0.11, y: h * 0.84)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.34, y: h * 0.70),
            control1: CGPoint(x: w * 0.22, y: h * 0.93),
            control2: CGPoint(x: w * 0.30, y: h * 0.80)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.66, y: h * 0.70),
            control1: CGPoint(x: w * 0.42, y: h * 0.62),
            control2: CGPoint(x: w * 0.58, y: h * 0.62)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.84, y: h * 0.88),
            control1: CGPoint(x: w * 0.70, y: h * 0.80),
            control2: CGPoint(x: w * 0.78, y: h * 0.93)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.92, y: h * 0.60),
            control1: CGPoint(x: w * 0.89, y: h * 0.84),
            control2: CGPoint(x: w * 0.90, y: h * 0.72)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.82, y: h * 0.28),
            control1: CGPoint(x: w * 0.97, y: h * 0.45),
            control2: CGPoint(x: w * 0.92, y: h * 0.30)
        )

        path.addCurve(
            to: CGPoint(x: w * 0.18, y: h * 0.28),
            control1: CGPoint(x: w * 0.68, y: h * 0.22),
            control2: CGPoint(x: w * 0.32, y: h * 0.22)
        )

        path.closeSubpath()
        return path
    }
}
