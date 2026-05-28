//
//  Xbox_Controller.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 26/05/2026.
//

import SwiftUI

struct XboxControllerView: View {

  var body: some View {
    if isResizable {
      canvas
        .frame(idealWidth: 744.0, idealHeight: 500.0)
    } else {
      canvas
        .frame(width: 744.0, height: 500.0)
    }
  }

  private var isResizable = false

  func resizable() -> Self {
     var copy = self
     copy.isResizable = true
     return copy
  }

  var canvas: some View {
    Canvas(
      opaque: false,
      colorMode: .linear,
      rendersAsynchronously: false
    ) { context, size in
      let scale = CGSize(width: size.width / 744.0, height: size.height / 500.0)
      context.withCGContext { ctx in
        ctx.scaleBy(x: scale.width, y: scale.height)
        ctx.saveGState()
        ctx.translateBy(x: -11.04, y: -267.3)
        let rgb = CGColorSpaceCreateDeviceRGB()
        let color1 = CGColor(colorSpace: rgb, components: [0.78, 0.78, 0.78, 1])!
        ctx.setFillColor(color1)
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 200.95, y: 395.58))
        path.addCurve(to: CGPoint(x: 111.65, y: 419.24),
                       control1: CGPoint(x: 170.95, y: 395.36),
                       control2: CGPoint(x: 128.48, y: 412.57))
        path.addCurve(to: CGPoint(x: 86.44, y: 454.5),
                       control1: CGPoint(x: 106.87, y: 421.14),
                       control2: CGPoint(x: 94.26, y: 438.06))
        path.addCurve(to: CGPoint(x: 57.16, y: 536.66),
                       control1: CGPoint(x: 82.94, y: 461.85),
                       control2: CGPoint(x: 57.16, y: 536.66))
        path.addCurve(to: CGPoint(x: 47.16, y: 628.78),
                       control1: CGPoint(x: 57.16, y: 536.66),
                       control2: CGPoint(x: 45.01, y: 594.5))
        path.addCurve(to: CGPoint(x: 70, y: 694.5),
                       control1: CGPoint(x: 49.3, y: 663.07),
                       control2: CGPoint(x: 70, y: 694.5))
        path.addCurve(to: CGPoint(x: 97, y: 715.19),
                       control1: CGPoint(x: 70, y: 694.5),
                       control2: CGPoint(x: 87.56, y: 711.6))
        path.addCurve(to: CGPoint(x: 140, y: 720.22),
                       control1: CGPoint(x: 108.3, y: 719.48),
                       control2: CGPoint(x: 128.85, y: 722.1))
        path.addCurve(to: CGPoint(x: 243.44, y: 676.78),
                       control1: CGPoint(x: 165.87, y: 715.86),
                       control2: CGPoint(x: 238.44, y: 678.92))
        path.addCurve(to: CGPoint(x: 258.12, y: 671.47),
                       control1: CGPoint(x: 248.44, y: 674.64),
                       control2: CGPoint(x: 253.35, y: 672.68))
        path.addCurve(to: CGPoint(x: 301.81, y: 672.81),
                       control1: CGPoint(x: 261.64, y: 674.81),
                       control2: CGPoint(x: 288.24, y: 677.1))
        path.addCurve(to: CGPoint(x: 329.03, y: 659.56),
                       control1: CGPoint(x: 315.38, y: 668.53),
                       control2: CGPoint(x: 322.73, y: 664.87))
        path.addCurve(to: CGPoint(x: 381.44, y: 659.06),
                       control1: CGPoint(x: 340.79, y: 658.93),
                       control2: CGPoint(x: 362, y: 658.96))
        path.addCurve(to: CGPoint(x: 433.72, y: 659.56),
                       control1: CGPoint(x: 400.83, y: 658.96),
                       control2: CGPoint(x: 421.98, y: 658.93))
        path.addCurve(to: CGPoint(x: 460.88, y: 672.81),
                       control1: CGPoint(x: 440.01, y: 664.86),
                       control2: CGPoint(x: 447.33, y: 668.53))
        path.addCurve(to: CGPoint(x: 504.5, y: 671.47),
                       control1: CGPoint(x: 474.42, y: 677.1),
                       control2: CGPoint(x: 500.99, y: 674.81))
        path.addCurve(to: CGPoint(x: 519.12, y: 676.78),
                       control1: CGPoint(x: 509.26, y: 672.68),
                       control2: CGPoint(x: 514.14, y: 674.64))
        path.addCurve(to: CGPoint(x: 622.38, y: 720.22),
                       control1: CGPoint(x: 524.11, y: 678.92),
                       control2: CGPoint(x: 596.56, y: 715.86))
        path.addCurve(to: CGPoint(x: 665.28, y: 715.16),
                       control1: CGPoint(x: 633.5, y: 722.1),
                       control2: CGPoint(x: 654, y: 719.45))
        path.addCurve(to: CGPoint(x: 692.22, y: 694.5),
                       control1: CGPoint(x: 674.71, y: 711.57),
                       control2: CGPoint(x: 692.22, y: 694.5))
        path.addCurve(to: CGPoint(x: 715.03, y: 628.81),
                       control1: CGPoint(x: 692.22, y: 694.5),
                       control2: CGPoint(x: 712.89, y: 663.09))
        path.addCurve(to: CGPoint(x: 705.06, y: 536.69),
                       control1: CGPoint(x: 717.17, y: 594.53),
                       control2: CGPoint(x: 705.06, y: 536.69))
        path.addCurve(to: CGPoint(x: 675.84, y: 454.56),
                       control1: CGPoint(x: 705.06, y: 536.69),
                       control2: CGPoint(x: 679.34, y: 461.91))
        path.addCurve(to: CGPoint(x: 650.03, y: 417.75),
                       control1: CGPoint(x: 668.03, y: 438.12),
                       control2: CGPoint(x: 654.81, y: 419.65))
        path.addCurve(to: CGPoint(x: 586.91, y: 396.97),
                       control1: CGPoint(x: 637.75, y: 412.87),
                       control2: CGPoint(x: 613.8, y: 401.13))
        path.addCurve(to: CGPoint(x: 536.16, y: 398.69),
                       control1: CGPoint(x: 570.21, y: 394.38),
                       control2: CGPoint(x: 550.31, y: 394.06))
        path.addCurve(to: CGPoint(x: 511.88, y: 413.47),
                       control1: CGPoint(x: 526.61, y: 401.81),
                       control2: CGPoint(x: 518.19, y: 409.87))
        path.addCurve(to: CGPoint(x: 457.25, y: 440.18),
                       control1: CGPoint(x: 504.49, y: 417.67),
                       control2: CGPoint(x: 474.36, y: 435.9))
        path.addCurve(to: CGPoint(x: 381.69, y: 443.5),
                       control1: CGPoint(x: 432.34, y: 444.35),
                       control2: CGPoint(x: 406.72, y: 444.16))
        path.addCurve(to: CGPoint(x: 305.72, y: 439.9),
                       control1: CGPoint(x: 381.69, y: 443.5),
                       control2: CGPoint(x: 322.86, y: 444.18))
        path.addCurve(to: CGPoint(x: 258.31, y: 415.93),
                       control1: CGPoint(x: 288.58, y: 435.61),
                       control2: CGPoint(x: 265.7, y: 420.14))
        path.addCurve(to: CGPoint(x: 233.35, y: 401.77),
                       control1: CGPoint(x: 251.98, y: 412.33),
                       control2: CGPoint(x: 247.46, y: 408.41))
        path.addCurve(to: CGPoint(x: 200.95, y: 395.58),
                       control1: CGPoint(x: 222.45, y: 395.41),
                       control2: CGPoint(x: 210.72, y: 395.58))
        path.closeSubpath()
        ctx.addPath(path)
        ctx.fillPath()
        ctx.setLineCap(.butt)
        ctx.setLineJoin(.miter)
        ctx.setLineWidth(1)
        ctx.setMiterLimit(4)
        let color2 = CGColor(colorSpace: rgb, components: [0, 0, 0, 1])!
        ctx.setStrokeColor(color2)
        ctx.addPath(path)
        ctx.strokePath()
        ctx.saveGState()
        ctx.translateBy(x: -2.02, y: -18.18)
        let color3 = CGColor(colorSpace: rgb, components: [0.882, 0.882, 0.882, 1])!
        ctx.setFillColor(color3)
        let path1 = CGMutablePath()
        path1.move(to: CGPoint(x: 356.84, y: 629.11))
        path1.addCurve(to: CGPoint(x: 282.46, y: 689.97),
                       control1: CGPoint(x: 356.84, y: 662.72),
                       control2: CGPoint(x: 323.54, y: 689.97))
        path1.addCurve(to: CGPoint(x: 208.09, y: 629.11),
                       control1: CGPoint(x: 241.39, y: 689.97),
                       control2: CGPoint(x: 208.09, y: 662.72))
        path1.addCurve(to: CGPoint(x: 282.46, y: 568.25),
                       control1: CGPoint(x: 208.09, y: 595.5),
                       control2: CGPoint(x: 241.39, y: 568.25))
        path1.addCurve(to: CGPoint(x: 356.84, y: 629.11),
                       control1: CGPoint(x: 323.54, y: 568.25),
                       control2: CGPoint(x: 356.84, y: 595.5))
        path1.closeSubpath()
        ctx.addPath(path1)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path1)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform = CGAffineTransform(
          a: 1.1474983,
          b: 0.0,
          c: 0.0,
          d: 1.1592071,
          tx: -21.086266,
          ty: -99.12696
        )
        ctx.concatenate(transform)
        let color4 = CGColor(colorSpace: rgb, components: [0.788, 0.788, 0.788, 1])!
        ctx.setFillColor(color4)
        let path2 = CGMutablePath()
        path2.move(to: CGPoint(x: 322.5, y: 617.36))
        path2.addCurve(to: CGPoint(x: 261.79, y: 665.93),
                       control1: CGPoint(x: 322.5, y: 644.19),
                       control2: CGPoint(x: 295.32, y: 665.93))
        path2.addCurve(to: CGPoint(x: 201.07, y: 617.36),
                       control1: CGPoint(x: 228.25, y: 665.93),
                       control2: CGPoint(x: 201.07, y: 644.19))
        path2.addCurve(to: CGPoint(x: 261.79, y: 568.79),
                       control1: CGPoint(x: 201.07, y: 590.54),
                       control2: CGPoint(x: 228.25, y: 568.79))
        path2.addCurve(to: CGPoint(x: 322.5, y: 617.36),
                       control1: CGPoint(x: 295.32, y: 568.79),
                       control2: CGPoint(x: 322.5, y: 590.54))
        path2.closeSubpath()
        ctx.addPath(path2)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path2)
        ctx.strokePath()
        ctx.restoreGState()
        let color5 = CGColor(colorSpace: rgb, components: [0.855, 0.855, 0.855, 1])!
        ctx.setFillColor(color5)
        let path3 = CGMutablePath()
        path3.move(to: CGPoint(x: 201.31, y: 340.72))
        path3.addCurve(to: CGPoint(x: 172.47, y: 344.5),
                       control1: CGPoint(x: 188.58, y: 341),
                       control2: CGPoint(x: 176.57, y: 343.4))
        path3.addCurve(to: CGPoint(x: 162.12, y: 350.06),
                       control1: CGPoint(x: 165.9, y: 346.27),
                       control2: CGPoint(x: 162.12, y: 350.06))
        path3.addLine(to: CGPoint(x: 130.06, y: 380.09))
        path3.addCurve(to: CGPoint(x: 124.51, y: 385.91),
                       control1: CGPoint(x: 130.06, y: 380.09),
                       control2: CGPoint(x: 125.02, y: 385.28))
        path3.addCurve(to: CGPoint(x: 115.55, y: 396.14),
                       control1: CGPoint(x: 118.02, y: 394.03),
                       control2: CGPoint(x: 116.56, y: 394.12))
        path3.addCurve(to: CGPoint(x: 109.59, y: 403.96),
                       control1: CGPoint(x: 114.54, y: 398.16),
                       control2: CGPoint(x: 111.24, y: 401.57))
        path3.addCurve(to: CGPoint(x: 104.31, y: 411.69),
                       control1: CGPoint(x: 108.56, y: 405.48),
                       control2: CGPoint(x: 105.83, y: 410.42))
        path3.addCurve(to: CGPoint(x: 82.84, y: 463.78),
                       control1: CGPoint(x: 102.8, y: 412.95),
                       control2: CGPoint(x: 82.84, y: 463.78))
        path3.addCurve(to: CGPoint(x: 120.88, y: 432.91),
                       control1: CGPoint(x: 82.84, y: 463.78),
                       control2: CGPoint(x: 105.86, y: 439.31))
        path3.addCurve(to: CGPoint(x: 226.12, y: 419.87),
                       control1: CGPoint(x: 153.4, y: 419.06),
                       control2: CGPoint(x: 191.4, y: 413.2))
        path3.addCurve(to: CGPoint(x: 298.86, y: 459.86),
                       control1: CGPoint(x: 253.29, y: 425.08),
                       control2: CGPoint(x: 272.24, y: 452.29))
        path3.addCurve(to: CGPoint(x: 380.01, y: 464),
                       control1: CGPoint(x: 324.91, y: 467.26),
                       control2: CGPoint(x: 352.92, y: 464.16))
        path3.addCurve(to: CGPoint(x: 468.59, y: 458.44),
                       control1: CGPoint(x: 409.59, y: 463.83),
                       control2: CGPoint(x: 440.11, y: 466.44))
        path3.addCurve(to: CGPoint(x: 541.87, y: 419.81),
                       control1: CGPoint(x: 495.17, y: 450.97),
                       control2: CGPoint(x: 514.75, y: 424.98))
        path3.addCurve(to: CGPoint(x: 650.86, y: 431.69),
                       control1: CGPoint(x: 577.77, y: 412.97),
                       control2: CGPoint(x: 618.39, y: 414.92))
        path3.addCurve(to: CGPoint(x: 679.41, y: 463.84),
                       control1: CGPoint(x: 663.6, y: 438.27),
                       control2: CGPoint(x: 679.41, y: 463.84))
        path3.addCurve(to: CGPoint(x: 658, y: 411.72),
                       control1: CGPoint(x: 679.41, y: 463.84),
                       control2: CGPoint(x: 659.51, y: 412.98))
        path3.addCurve(to: CGPoint(x: 653.48, y: 404.28),
                       control1: CGPoint(x: 656.87, y: 409.83),
                       control2: CGPoint(x: 653.98, y: 406.05))
        path3.addCurve(to: CGPoint(x: 645.5, y: 395.06),
                       control1: CGPoint(x: 652.97, y: 402.51),
                       control2: CGPoint(x: 646.51, y: 397.08))
        path3.addCurve(to: CGPoint(x: 637.83, y: 386.86),
                       control1: CGPoint(x: 644.49, y: 393.04),
                       control2: CGPoint(x: 644.48, y: 394.82))
        path3.addCurve(to: CGPoint(x: 632.28, y: 380.16),
                       control1: CGPoint(x: 635.83, y: 384.46),
                       control2: CGPoint(x: 632.28, y: 380.16))
        path3.addLine(to: CGPoint(x: 600.28, y: 350.12))
        path3.addCurve(to: CGPoint(x: 589.94, y: 344.56),
                       control1: CGPoint(x: 600.28, y: 350.12),
                       control2: CGPoint(x: 596.49, y: 346.33))
        path3.addCurve(to: CGPoint(x: 539.03, y: 343.31),
                       control1: CGPoint(x: 583.38, y: 342.8),
                       control2: CGPoint(x: 556.71, y: 337.86))
        path3.addCurve(to: CGPoint(x: 523.41, y: 350.12),
                       control1: CGPoint(x: 525.37, y: 347.53),
                       control2: CGPoint(x: 523.41, y: 350.12))
        path3.addCurve(to: CGPoint(x: 510.31, y: 361.25),
                       control1: CGPoint(x: 523.41, y: 350.12),
                       control2: CGPoint(x: 515.86, y: 359.48))
        path3.addCurve(to: CGPoint(x: 462.19, y: 381.44),
                       control1: CGPoint(x: 504.77, y: 363.02),
                       control2: CGPoint(x: 479.83, y: 379.67))
        path3.addCurve(to: CGPoint(x: 421.34, y: 384.47),
                       control1: CGPoint(x: 444.55, y: 383.2),
                       control2: CGPoint(x: 427.39, y: 385.98))
        path3.addCurve(to: CGPoint(x: 381.44, y: 383.38),
                       control1: CGPoint(x: 415.3, y: 382.95),
                       control2: CGPoint(x: 381.44, y: 383.38))
        path3.addLine(to: CGPoint(x: 381.44, y: 383.31))
        path3.addCurve(to: CGPoint(x: 341.44, y: 384.41),
                       control1: CGPoint(x: 381.44, y: 383.31),
                       control2: CGPoint(x: 347.5, y: 382.89))
        path3.addCurve(to: CGPoint(x: 300.53, y: 381.38),
                       control1: CGPoint(x: 335.38, y: 385.92),
                       control2: CGPoint(x: 318.21, y: 383.14))
        path3.addCurve(to: CGPoint(x: 252.28, y: 361.16),
                       control1: CGPoint(x: 282.85, y: 379.61),
                       control2: CGPoint(x: 257.84, y: 362.92))
        path3.addCurve(to: CGPoint(x: 239.16, y: 350.06),
                       control1: CGPoint(x: 246.73, y: 359.39),
                       control2: CGPoint(x: 239.16, y: 350.06))
        path3.addCurve(to: CGPoint(x: 223.5, y: 343.25),
                       control1: CGPoint(x: 239.16, y: 350.06),
                       control2: CGPoint(x: 237.27, y: 346.97))
        path3.addCurve(to: CGPoint(x: 201.31, y: 340.72),
                       control1: CGPoint(x: 216.79, y: 341.44),
                       control2: CGPoint(x: 208.95, y: 340.55))
        path3.closeSubpath()
        ctx.addPath(path3)
        ctx.fillPath()
        ctx.addPath(path3)
        ctx.strokePath()
        ctx.setFillColor(color2)
        let path4 = CGMutablePath()
        path4.move(to: CGPoint(x: 177.64, y: 334.65))
        path4.addLine(to: CGPoint(x: 223.12, y: 346.78))
        path4.addLine(to: CGPoint(x: 210.76, y: 393.24))
        path4.addLine(to: CGPoint(x: 168.32, y: 382.54))
        path4.closeSubpath()
        ctx.addPath(path4)
        ctx.fillPath()
        ctx.setLineWidth(0.98)
        ctx.addPath(path4)
        ctx.strokePath()
        let color6 = CGColor(colorSpace: rgb, components: [0.973, 0.973, 0.973, 1])!
        ctx.setFillColor(color6)
        let path5 = CGMutablePath()
        path5.move(to: CGPoint(x: 168.75, y: 379.86))
        path5.addCurve(to: CGPoint(x: 175.36, y: 337.72),
                       control1: CGPoint(x: 168.75, y: 379.86),
                       control2: CGPoint(x: 175.18, y: 340.4))
        path5.addCurve(to: CGPoint(x: 178.04, y: 316.29),
                       control1: CGPoint(x: 175.54, y: 335.04),
                       control2: CGPoint(x: 177.5, y: 318.61))
        path5.addCurve(to: CGPoint(x: 187.14, y: 308.61),
                       control1: CGPoint(x: 178.57, y: 313.97),
                       control2: CGPoint(x: 184.82, y: 308.61))
        path5.addCurve(to: CGPoint(x: 206.61, y: 308.61),
                       control1: CGPoint(x: 189.46, y: 308.61),
                       control2: CGPoint(x: 206.61, y: 308.61))
        path5.addCurve(to: CGPoint(x: 218.93, y: 318.97),
                       control1: CGPoint(x: 206.61, y: 308.61),
                       control2: CGPoint(x: 218.57, y: 310.58))
        path5.addCurve(to: CGPoint(x: 219.46, y: 336.29),
                       control1: CGPoint(x: 219.29, y: 327.36),
                       control2: CGPoint(x: 219.46, y: 336.29))
        path5.addLine(to: CGPoint(x: 216.25, y: 377.36))
        path5.closeSubpath()
        ctx.addPath(path5)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path5)
        ctx.strokePath()
        let color7 = CGColor(colorSpace: rgb, components: [0.953, 0.953, 0.953, 0.452])!
        ctx.setFillColor(color7)
        let path6 = CGMutablePath()
        path6.move(to: CGPoint(x: 563.91, y: 395.09))
        path6.addCurve(to: CGPoint(x: 536.16, y: 398.69),
                       control1: CGPoint(x: 553.9, y: 395.04),
                       control2: CGPoint(x: 544.12, y: 396.09))
        path6.addCurve(to: CGPoint(x: 511.88, y: 413.47),
                       control1: CGPoint(x: 526.61, y: 401.81),
                       control2: CGPoint(x: 518.19, y: 409.87))
        path6.addCurve(to: CGPoint(x: 457.25, y: 440.19),
                       control1: CGPoint(x: 504.49, y: 417.67),
                       control2: CGPoint(x: 474.36, y: 435.9))
        path6.addCurve(to: CGPoint(x: 381.69, y: 443.5),
                       control1: CGPoint(x: 432.34, y: 444.35),
                       control2: CGPoint(x: 406.72, y: 444.16))
        path6.addCurve(to: CGPoint(x: 305.72, y: 439.91),
                       control1: CGPoint(x: 381.69, y: 443.5),
                       control2: CGPoint(x: 322.86, y: 444.19))
        path6.addCurve(to: CGPoint(x: 258.31, y: 415.94),
                       control1: CGPoint(x: 288.58, y: 435.62),
                       control2: CGPoint(x: 265.71, y: 420.14))
        path6.addCurve(to: CGPoint(x: 233.44, y: 401.88),
                       control1: CGPoint(x: 251.98, y: 412.34),
                       control2: CGPoint(x: 247.55, y: 408.52))
        path6.addCurve(to: CGPoint(x: 200.94, y: 395.59),
                       control1: CGPoint(x: 222.53, y: 395.52),
                       control2: CGPoint(x: 210.71, y: 395.59))
        path6.addCurve(to: CGPoint(x: 111.66, y: 418.11),
                       control1: CGPoint(x: 170.95, y: 395.37),
                       control2: CGPoint(x: 128.48, y: 411.44))
        path6.addCurve(to: CGPoint(x: 86.88, y: 453.62),
                       control1: CGPoint(x: 106.95, y: 419.98),
                       control2: CGPoint(x: 94.72, y: 437.46))
        path6.addCurve(to: CGPoint(x: 82.84, y: 463.78),
                       control1: CGPoint(x: 84.57, y: 459.43),
                       control2: CGPoint(x: 82.84, y: 463.78))
        path6.addCurve(to: CGPoint(x: 120.88, y: 432.91),
                       control1: CGPoint(x: 82.84, y: 463.78),
                       control2: CGPoint(x: 105.85, y: 439.3))
        path6.addCurve(to: CGPoint(x: 226.12, y: 419.88),
                       control1: CGPoint(x: 153.4, y: 419.06),
                       control2: CGPoint(x: 191.41, y: 413.21))
        path6.addCurve(to: CGPoint(x: 298.84, y: 459.84),
                       control1: CGPoint(x: 253.3, y: 425.09),
                       control2: CGPoint(x: 272.23, y: 452.28))
        path6.addCurve(to: CGPoint(x: 380, y: 464),
                       control1: CGPoint(x: 324.9, y: 467.25),
                       control2: CGPoint(x: 352.91, y: 464.16))
        path6.addCurve(to: CGPoint(x: 468.59, y: 458.44),
                       control1: CGPoint(x: 409.58, y: 463.83),
                       control2: CGPoint(x: 440.11, y: 466.44))
        path6.addCurve(to: CGPoint(x: 541.88, y: 419.81),
                       control1: CGPoint(x: 495.18, y: 450.97),
                       control2: CGPoint(x: 514.75, y: 424.98))
        path6.addCurve(to: CGPoint(x: 650.88, y: 431.69),
                       control1: CGPoint(x: 577.77, y: 412.97),
                       control2: CGPoint(x: 618.4, y: 414.92))
        path6.addCurve(to: CGPoint(x: 679.41, y: 463.84),
                       control1: CGPoint(x: 663.61, y: 438.26),
                       control2: CGPoint(x: 679.41, y: 463.84))
        path6.addCurve(to: CGPoint(x: 675.41, y: 453.72),
                       control1: CGPoint(x: 679.41, y: 463.84),
                       control2: CGPoint(x: 677.69, y: 459.51))
        path6.addCurve(to: CGPoint(x: 650.03, y: 417.75),
                       control1: CGPoint(x: 667.55, y: 437.5),
                       control2: CGPoint(x: 654.73, y: 419.62))
        path6.addCurve(to: CGPoint(x: 586.91, y: 396.97),
                       control1: CGPoint(x: 637.75, y: 412.87),
                       control2: CGPoint(x: 613.8, y: 401.14))
        path6.addCurve(to: CGPoint(x: 563.91, y: 395.09),
                       control1: CGPoint(x: 579.6, y: 395.84),
                       control2: CGPoint(x: 571.69, y: 395.13))
        path6.closeSubpath()
        ctx.addPath(path6)
        ctx.fillPath()
        ctx.addPath(path6)
        ctx.strokePath()
        let color8 = CGColor(colorSpace: rgb, components: [0.945, 0.945, 0.945, 1])!
        ctx.setFillColor(color8)
        let path7 = CGMutablePath()
        path7.move(to: CGPoint(x: 110.89, y: 411.83))
        path7.addLine(to: CGPoint(x: 111.96, y: 401.29))
        path7.addCurve(to: CGPoint(x: 125.54, y: 385.58),
                       control1: CGPoint(x: 111.96, y: 401.29),
                       control2: CGPoint(x: 111.25, y: 391.65))
        path7.addCurve(to: CGPoint(x: 168.57, y: 368.43),
                       control1: CGPoint(x: 139.82, y: 379.51),
                       control2: CGPoint(x: 151.96, y: 371.83))
        path7.addCurve(to: CGPoint(x: 203.21, y: 364.33),
                       control1: CGPoint(x: 185.18, y: 365.04),
                       control2: CGPoint(x: 195.18, y: 364.15))
        path7.addCurve(to: CGPoint(x: 225.36, y: 365.93),
                       control1: CGPoint(x: 211.25, y: 364.51),
                       control2: CGPoint(x: 223.93, y: 365.4))
        path7.addCurve(to: CGPoint(x: 230.71, y: 373.26),
                       control1: CGPoint(x: 226.79, y: 366.47),
                       control2: CGPoint(x: 228.93, y: 372.9))
        path7.addCurve(to: CGPoint(x: 236.96, y: 374.86),
                       control1: CGPoint(x: 232.5, y: 373.61),
                       control2: CGPoint(x: 236.96, y: 374.86))
        path7.addLine(to: CGPoint(x: 237.5, y: 387.54))
        path7.addLine(to: CGPoint(x: 233.39, y: 401.65))
        path7.addCurve(to: CGPoint(x: 186.79, y: 397.36),
                       control1: CGPoint(x: 233.39, y: 401.65),
                       control2: CGPoint(x: 220.54, y: 392.72))
        path7.addCurve(to: CGPoint(x: 142.5, y: 407.18),
                       control1: CGPoint(x: 153.04, y: 402.01),
                       control2: CGPoint(x: 142.5, y: 407.18))
        path7.addCurve(to: CGPoint(x: 111.25, y: 418.08),
                       control1: CGPoint(x: 142.5, y: 407.18),
                       control2: CGPoint(x: 112.32, y: 418.97))
        path7.addCurve(to: CGPoint(x: 110.89, y: 411.83),
                       control1: CGPoint(x: 110.18, y: 417.18),
                       control2: CGPoint(x: 110.89, y: 411.83))
        path7.closeSubpath()
        ctx.addPath(path7)
        ctx.fillPath()
        ctx.addPath(path7)
        ctx.strokePath()
        ctx.saveGState()
        let transform1 = CGAffineTransform(
          a: 0.9656103,
          b: -0.25999358,
          c: 0.25999358,
          d: 0.9656103,
          tx: 0.0,
          ty: 0.0
        )
        ctx.concatenate(transform1)
        ctx.setFillColor(color2)
        let path8 = CGMutablePath()
        path8.move(to: CGPoint(x: 434.2, y: 474.97))
        path8.addLine(to: CGPoint(x: 479.33, y: 474.97))
        path8.addLine(to: CGPoint(x: 479.33, y: 523.06))
        path8.addLine(to: CGPoint(x: 434.2, y: 523.06))
        path8.closeSubpath()
        ctx.addPath(path8)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path8)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.setFillColor(color6)
        let path9 = CGMutablePath()
        path9.move(to: CGPoint(x: 597.21, y: 379.42))
        path9.addCurve(to: CGPoint(x: 590.62, y: 337.29),
                       control1: CGPoint(x: 597.21, y: 379.42),
                       control2: CGPoint(x: 590.8, y: 339.97))
        path9.addCurve(to: CGPoint(x: 587.95, y: 315.87),
                       control1: CGPoint(x: 590.44, y: 334.61),
                       control2: CGPoint(x: 588.48, y: 318.19))
        path9.addCurve(to: CGPoint(x: 578.86, y: 308.19),
                       control1: CGPoint(x: 587.41, y: 313.55),
                       control2: CGPoint(x: 581.17, y: 308.19))
        path9.addCurve(to: CGPoint(x: 559.43, y: 308.19),
                       control1: CGPoint(x: 576.54, y: 308.19),
                       control2: CGPoint(x: 559.43, y: 308.19))
        path9.addCurve(to: CGPoint(x: 547.14, y: 318.54),
                       control1: CGPoint(x: 559.43, y: 308.19),
                       control2: CGPoint(x: 547.49, y: 310.15))
        path9.addCurve(to: CGPoint(x: 546.6, y: 335.86),
                       control1: CGPoint(x: 546.78, y: 326.93),
                       control2: CGPoint(x: 546.6, y: 335.86))
        path9.addLine(to: CGPoint(x: 549.81, y: 376.92))
        path9.closeSubpath()
        ctx.addPath(path9)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path9)
        ctx.strokePath()
        ctx.setFillColor(color8)
        let path10 = CGMutablePath()
        path10.move(to: CGPoint(x: 651.42, y: 411.88))
        path10.addLine(to: CGPoint(x: 650.35, y: 401.35))
        path10.addCurve(to: CGPoint(x: 636.8, y: 385.64),
                       control1: CGPoint(x: 650.35, y: 401.35),
                       control2: CGPoint(x: 651.06, y: 391.71))
        path10.addCurve(to: CGPoint(x: 593.86, y: 368.5),
                       control1: CGPoint(x: 622.55, y: 379.57),
                       control2: CGPoint(x: 610.43, y: 371.89))
        path10.addCurve(to: CGPoint(x: 559.28, y: 364.4),
                       control1: CGPoint(x: 577.28, y: 365.11),
                       control2: CGPoint(x: 567.3, y: 364.22))
        path10.addCurve(to: CGPoint(x: 537.19, y: 366),
                       control1: CGPoint(x: 551.26, y: 364.57),
                       control2: CGPoint(x: 538.61, y: 365.47))
        path10.addCurve(to: CGPoint(x: 531.84, y: 373.32),
                       control1: CGPoint(x: 535.76, y: 366.54),
                       control2: CGPoint(x: 533.62, y: 372.96))
        path10.addCurve(to: CGPoint(x: 525.6, y: 374.93),
                       control1: CGPoint(x: 530.06, y: 373.68),
                       control2: CGPoint(x: 525.6, y: 374.93))
        path10.addLine(to: CGPoint(x: 525.07, y: 387.6))
        path10.addLine(to: CGPoint(x: 529.17, y: 401.71))
        path10.addCurve(to: CGPoint(x: 575.68, y: 397.42),
                       control1: CGPoint(x: 529.17, y: 401.71),
                       control2: CGPoint(x: 542, y: 392.78))
        path10.addCurve(to: CGPoint(x: 619.88, y: 407.24),
                       control1: CGPoint(x: 609.36, y: 402.07),
                       control2: CGPoint(x: 619.88, y: 407.24))
        path10.addCurve(to: CGPoint(x: 651.06, y: 418.13),
                       control1: CGPoint(x: 619.88, y: 407.24),
                       control2: CGPoint(x: 649.99, y: 419.03))
        path10.addCurve(to: CGPoint(x: 651.42, y: 411.88),
                       control1: CGPoint(x: 652.13, y: 417.24),
                       control2: CGPoint(x: 651.42, y: 411.88))
        path10.closeSubpath()
        ctx.addPath(path10)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path10)
        ctx.strokePath()
        ctx.saveGState()
        let transform2 = CGAffineTransform(
          a: 1.2651356,
          b: 0.0,
          c: 0.0,
          d: 1.1951606,
          tx: -146.91893,
          ty: -109.1041
        )
        ctx.concatenate(transform2)
        let color9 = CGColor(colorSpace: rgb, components: [0, 0.196, 0.69, 1])!
        ctx.setFillColor(color9)
        let path11 = CGMutablePath()
        path11.move(to: CGPoint(x: 555.71, y: 521.65))
        path11.addCurve(to: CGPoint(x: 536.79, y: 539.15),
                       control1: CGPoint(x: 555.71, y: 531.31),
                       control2: CGPoint(x: 547.24, y: 539.15))
        path11.addCurve(to: CGPoint(x: 517.86, y: 521.65),
                       control1: CGPoint(x: 526.33, y: 539.15),
                       control2: CGPoint(x: 517.86, y: 531.31))
        path11.addCurve(to: CGPoint(x: 536.79, y: 504.15),
                       control1: CGPoint(x: 517.86, y: 511.98),
                       control2: CGPoint(x: 526.33, y: 504.15))
        path11.addCurve(to: CGPoint(x: 555.71, y: 521.65),
                       control1: CGPoint(x: 547.24, y: 504.15),
                       control2: CGPoint(x: 555.71, y: 511.98))
        path11.closeSubpath()
        ctx.addPath(path11)
        ctx.fillPath()
        ctx.setLineWidth(0.81)
        ctx.addPath(path11)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform3 = CGAffineTransform(
          a: 1.1530474,
          b: 0.0,
          c: 0.0,
          d: 1.0,
          tx: -86.22098,
          ty: -3.9285717
        )
        ctx.concatenate(transform3)
        let color10 = CGColor(colorSpace: rgb, components: [0.055, 0.322, 1, 1])!
        ctx.setFillColor(color10)
        ctx.addPath(path11)
        ctx.fillPath()
        ctx.setLineWidth(0.93)
        ctx.addPath(path11)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform4 = CGAffineTransform(
          a: 1.3491842,
          b: -0.20807008,
          c: 0.20089756,
          d: 1.3026755,
          tx: -325.9441,
          ty: -57.28388
        )
        ctx.concatenate(transform4)
        let color11 = CGColor(colorSpace: rgb, components: [0.141, 0.584, 0, 1])!
        ctx.setFillColor(color11)
        let path12 = CGMutablePath()
        path12.move(to: CGPoint(x: 608.39, y: 565.49))
        path12.addCurve(to: CGPoint(x: 589.91, y: 580.58),
                       control1: CGPoint(x: 608.39, y: 573.82),
                       control2: CGPoint(x: 600.12, y: 580.58))
        path12.addCurve(to: CGPoint(x: 571.43, y: 565.49),
                       control1: CGPoint(x: 579.7, y: 580.58),
                       control2: CGPoint(x: 571.43, y: 573.82))
        path12.addCurve(to: CGPoint(x: 589.91, y: 550.4),
                       control1: CGPoint(x: 571.43, y: 557.15),
                       control2: CGPoint(x: 579.7, y: 550.4))
        path12.addCurve(to: CGPoint(x: 608.39, y: 565.49),
                       control1: CGPoint(x: 600.12, y: 550.4),
                       control2: CGPoint(x: 608.39, y: 557.15))
        path12.closeSubpath()
        ctx.addPath(path12)
        ctx.fillPath()
        ctx.addPath(path12)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform5 = CGAffineTransform(
          a: 1.1905591,
          b: -0.20373648,
          c: 0.20458785,
          d: 1.1955342,
          tx: -232.81271,
          ty: 4.8958764
        )
        ctx.concatenate(transform5)
        let color12 = CGColor(colorSpace: rgb, components: [0.208, 0.851, 0, 1])!
        ctx.setFillColor(color12)
        ctx.addPath(path12)
        ctx.fillPath()
        ctx.addPath(path12)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform6 = CGAffineTransform(
          a: 1.147631,
          b: -0.28802174,
          c: 0.28768995,
          d: 1.146309,
          tx: -232.42822,
          ty: 96.795395
        )
        ctx.concatenate(transform6)
        let color13 = CGColor(colorSpace: rgb, components: [0.851, 0.765, 0, 1])!
        ctx.setFillColor(color13)
        let path13 = CGMutablePath()
        path13.move(to: CGPoint(x: 619.64, y: 473.34))
        path13.addCurve(to: CGPoint(x: 597.59, y: 492.18),
                       control1: CGPoint(x: 619.64, y: 483.75),
                       control2: CGPoint(x: 609.77, y: 492.18))
        path13.addCurve(to: CGPoint(x: 575.54, y: 473.34),
                       control1: CGPoint(x: 585.41, y: 492.18),
                       control2: CGPoint(x: 575.54, y: 483.75))
        path13.addCurve(to: CGPoint(x: 597.59, y: 454.51),
                       control1: CGPoint(x: 575.54, y: 462.94),
                       control2: CGPoint(x: 585.41, y: 454.51))
        path13.addCurve(to: CGPoint(x: 619.64, y: 473.34),
                       control1: CGPoint(x: 609.77, y: 454.51),
                       control2: CGPoint(x: 619.64, y: 462.94))
        path13.closeSubpath()
        ctx.addPath(path13)
        ctx.fillPath()
        ctx.addPath(path13)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform7 = CGAffineTransform(
          a: 1.0110047,
          b: -0.2444118,
          c: 0.25543436,
          d: 1.0565993,
          tx: -134.55844,
          ty: 117.91427
        )
        ctx.concatenate(transform7)
        let color14 = CGColor(colorSpace: rgb, components: [1, 0.91, 0.137, 1])!
        ctx.setFillColor(color14)
        ctx.addPath(path13)
        ctx.fillPath()
        ctx.addPath(path13)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform8 = CGAffineTransform(
          a: 1.172785,
          b: -0.49099222,
          c: 0.4397093,
          d: 1.1348517,
          tx: -374.82327,
          ty: 225.4705
        )
        ctx.concatenate(transform8)
        let color15 = CGColor(colorSpace: rgb, components: [0.671, 0.043, 0, 1])!
        ctx.setFillColor(color15)
        let path14 = CGMutablePath()
        path14.move(to: CGPoint(x: 685, y: 538.61))
        path14.addCurve(to: CGPoint(x: 665, y: 555.58),
                       control1: CGPoint(x: 685, y: 547.98),
                       control2: CGPoint(x: 676.05, y: 555.58))
        path14.addCurve(to: CGPoint(x: 645, y: 538.61),
                       control1: CGPoint(x: 653.95, y: 555.58),
                       control2: CGPoint(x: 645, y: 547.98))
        path14.addCurve(to: CGPoint(x: 665, y: 521.65),
                       control1: CGPoint(x: 645, y: 529.24),
                       control2: CGPoint(x: 653.95, y: 521.65))
        path14.addCurve(to: CGPoint(x: 685, y: 538.61),
                       control1: CGPoint(x: 676.05, y: 521.65),
                       control2: CGPoint(x: 685, y: 529.24))
        path14.closeSubpath()
        ctx.addPath(path14)
        ctx.fillPath()
        ctx.addPath(path14)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform9 = CGAffineTransform(
          a: 1.0213898,
          b: -0.43107828,
          c: 0.3829471,
          d: 0.9963701,
          tx: -242.06805,
          ty: 263.22357
        )
        ctx.concatenate(transform9)
        let color16 = CGColor(colorSpace: rgb, components: [1, 0.075, 0.012, 1])!
        ctx.setFillColor(color16)
        ctx.addPath(path14)
        ctx.fillPath()
        ctx.addPath(path14)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform10 = CGAffineTransform(
          a: 1.0235578,
          b: 0.0,
          c: 0.0,
          d: 1.0,
          tx: -8.770861,
          ty: -3.0304575
        )
        ctx.concatenate(transform10)
        let color17 = CGColor(colorSpace: rgb, components: [0.094, 0.094, 0.094, 1])!
        ctx.setFillColor(color17)
        let path15 = CGMutablePath()
        path15.move(to: CGPoint(x: 339.92, y: 620.52))
        path15.addCurve(to: CGPoint(x: 281.07, y: 669.01),
                       control1: CGPoint(x: 339.92, y: 647.3),
                       control2: CGPoint(x: 313.57, y: 669.01))
        path15.addCurve(to: CGPoint(x: 222.23, y: 620.52),
                       control1: CGPoint(x: 248.58, y: 669.01),
                       control2: CGPoint(x: 222.23, y: 647.3))
        path15.addCurve(to: CGPoint(x: 281.07, y: 572.03),
                       control1: CGPoint(x: 222.23, y: 593.74),
                       control2: CGPoint(x: 248.58, y: 572.03))
        path15.addCurve(to: CGPoint(x: 339.92, y: 620.52),
                       control1: CGPoint(x: 313.57, y: 572.03),
                       control2: CGPoint(x: 339.92, y: 593.74))
        path15.closeSubpath()
        ctx.addPath(path15)
        ctx.fillPath()
        ctx.addPath(path15)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform11 = CGAffineTransform(
          a: 1.2274823,
          b: 0.0,
          c: 0.0,
          d: 1.2883399,
          tx: -63.06467,
          ty: -182.16359
        )
        ctx.concatenate(transform11)
        let color18 = CGColor(colorSpace: rgb, components: [0.6, 0.6, 0.6, 1])!
        ctx.setFillColor(color18)
        let path16 = CGMutablePath()
        path16.move(to: CGPoint(x: 323.93, y: 622.01))
        path16.addCurve(to: CGPoint(x: 278.3, y: 657.9),
                       control1: CGPoint(x: 323.93, y: 641.83),
                       control2: CGPoint(x: 303.5, y: 657.9))
        path16.addCurve(to: CGPoint(x: 232.68, y: 622.01),
                       control1: CGPoint(x: 253.11, y: 657.9),
                       control2: CGPoint(x: 232.68, y: 641.83))
        path16.addCurve(to: CGPoint(x: 278.3, y: 586.11),
                       control1: CGPoint(x: 232.68, y: 602.18),
                       control2: CGPoint(x: 253.11, y: 586.11))
        path16.addCurve(to: CGPoint(x: 323.93, y: 622.01),
                       control1: CGPoint(x: 303.5, y: 586.11),
                       control2: CGPoint(x: 323.93, y: 602.18))
        path16.closeSubpath()
        ctx.addPath(path16)
        ctx.fillPath()
        ctx.addPath(path16)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform12 = CGAffineTransform(
          a: 1.1728021,
          b: 0.0,
          c: 0.0,
          d: 1.162354,
          tx: -48.0133,
          ty: -99.98272
        )
        ctx.concatenate(transform12)
        let color19 = CGColor(colorSpace: rgb, components: [0.518, 0.518, 0.518, 1])!
        ctx.setFillColor(color19)
        ctx.addPath(path16)
        ctx.fillPath()
        ctx.addPath(path16)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform13 = CGAffineTransform(
          a: 1.3360021,
          b: 0.0,
          c: 0.0,
          d: 1.4387159,
          tx: -131.28702,
          ty: -230.44884
        )
        ctx.concatenate(transform13)
        let color20 = CGColor(colorSpace: rgb, components: [0.208, 0.208, 0.208, 1])!
        ctx.setFillColor(color20)
        let path17 = CGMutablePath()
        path17.move(to: CGPoint(x: 415.09, y: 517.67))
        path17.addCurve(to: CGPoint(x: 384.29, y: 540.93),
                       control1: CGPoint(x: 415.09, y: 530.52),
                       control2: CGPoint(x: 401.3, y: 540.93))
        path17.addCurve(to: CGPoint(x: 353.48, y: 517.67),
                       control1: CGPoint(x: 367.27, y: 540.93),
                       control2: CGPoint(x: 353.48, y: 530.52))
        path17.addCurve(to: CGPoint(x: 384.29, y: 494.42),
                       control1: CGPoint(x: 353.48, y: 504.83),
                       control2: CGPoint(x: 367.27, y: 494.42))
        path17.addCurve(to: CGPoint(x: 415.09, y: 517.67),
                       control1: CGPoint(x: 401.3, y: 494.42),
                       control2: CGPoint(x: 415.09, y: 504.83))
        path17.closeSubpath()
        ctx.addPath(path17)
        ctx.fillPath()
        ctx.addPath(path17)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform14 = CGAffineTransform(
          a: 4.0721273,
          b: 0.0,
          c: 0.0,
          d: 4.2220693,
          tx: -1211.0046,
          ty: -1685.8278
        )
        ctx.concatenate(transform14)
        let color21 = CGColor(colorSpace: rgb, components: [0.792, 0.792, 0.792, 1])!
        ctx.setFillColor(color21)
        let path18 = CGMutablePath()
        path18.move(to: CGPoint(x: 399.55, y: 521.07))
        path18.addCurve(to: CGPoint(x: 391.25, y: 527.54),
                       control1: CGPoint(x: 399.55, y: 524.64),
                       control2: CGPoint(x: 395.84, y: 527.54))
        path18.addCurve(to: CGPoint(x: 382.95, y: 521.07),
                       control1: CGPoint(x: 386.66, y: 527.54),
                       control2: CGPoint(x: 382.95, y: 524.64))
        path18.addCurve(to: CGPoint(x: 391.25, y: 514.59),
                       control1: CGPoint(x: 382.95, y: 517.49),
                       control2: CGPoint(x: 386.66, y: 514.59))
        path18.addCurve(to: CGPoint(x: 399.55, y: 521.07),
                       control1: CGPoint(x: 395.84, y: 514.59),
                       control2: CGPoint(x: 399.55, y: 517.49))
        path18.closeSubpath()
        ctx.addPath(path18)
        ctx.fillPath()
        ctx.setLineWidth(0.24)
        ctx.addPath(path18)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.setFillColor(color18)
        let path19 = CGMutablePath()
        path19.move(to: CGPoint(x: 278.4, y: 581))
        path19.addLine(to: CGPoint(x: 289.07, y: 581.5))
        path19.addCurve(to: CGPoint(x: 292.86, y: 585.92),
                       control1: CGPoint(x: 289.07, y: 581.5),
                       control2: CGPoint(x: 292.29, y: 582.77))
        path19.addCurve(to: CGPoint(x: 296.52, y: 600.7),
                       control1: CGPoint(x: 293.28, y: 588.25),
                       control2: CGPoint(x: 295.76, y: 600.07))
        path19.addCurve(to: CGPoint(x: 303.72, y: 607.64),
                       control1: CGPoint(x: 297.28, y: 601.33),
                       control2: CGPoint(x: 300.69, y: 607.26))
        path19.addCurve(to: CGPoint(x: 328.34, y: 612.06),
                       control1: CGPoint(x: 306.75, y: 608.02),
                       control2: CGPoint(x: 327.08, y: 610.93))
        path19.addCurve(to: CGPoint(x: 331.5, y: 618.12),
                       control1: CGPoint(x: 329.6, y: 613.2),
                       control2: CGPoint(x: 331.5, y: 618.12))
        path19.addLine(to: CGPoint(x: 331.75, y: 630.37))
        path19.addCurve(to: CGPoint(x: 329.85, y: 634.79),
                       control1: CGPoint(x: 331.75, y: 630.37),
                       control2: CGPoint(x: 330.99, y: 634.16))
        path19.addCurve(to: CGPoint(x: 307.76, y: 637.44),
                       control1: CGPoint(x: 328.72, y: 635.42),
                       control2: CGPoint(x: 307.76, y: 637.44))
        path19.addCurve(to: CGPoint(x: 300.31, y: 642.62),
                       control1: CGPoint(x: 307.76, y: 637.44),
                       control2: CGPoint(x: 301.44, y: 638.96))
        path19.addCurve(to: CGPoint(x: 295.89, y: 662.44),
                       control1: CGPoint(x: 299.17, y: 646.28),
                       control2: CGPoint(x: 296.9, y: 661.43))
        path19.addCurve(to: CGPoint(x: 290.58, y: 665.98),
                       control1: CGPoint(x: 294.88, y: 663.45),
                       control2: CGPoint(x: 293.49, y: 665.6))
        path19.addCurve(to: CGPoint(x: 273.41, y: 666.61),
                       control1: CGPoint(x: 287.68, y: 666.36),
                       control2: CGPoint(x: 273.41, y: 666.61))
        path19.addCurve(to: CGPoint(x: 266.85, y: 663.71),
                       control1: CGPoint(x: 273.41, y: 666.61),
                       control2: CGPoint(x: 268.11, y: 665.47))
        path19.addCurve(to: CGPoint(x: 262.43, y: 646.28),
                       control1: CGPoint(x: 265.58, y: 661.94),
                       control2: CGPoint(x: 262.43, y: 646.28))
        path19.addCurve(to: CGPoint(x: 254.09, y: 639.08),
                       control1: CGPoint(x: 262.43, y: 646.28),
                       control2: CGPoint(x: 260.41, y: 640.73))
        path19.addCurve(to: CGPoint(x: 232.37, y: 637.19),
                       control1: CGPoint(x: 247.78, y: 637.44),
                       control2: CGPoint(x: 235.91, y: 638.83))
        path19.addCurve(to: CGPoint(x: 226.19, y: 629.87),
                       control1: CGPoint(x: 228.84, y: 635.55),
                       control2: CGPoint(x: 226.44, y: 632.52))
        path19.addCurve(to: CGPoint(x: 225.3, y: 617.24),
                       control1: CGPoint(x: 225.93, y: 627.21),
                       control2: CGPoint(x: 224.8, y: 618))
        path19.addCurve(to: CGPoint(x: 229.6, y: 611.81),
                       control1: CGPoint(x: 225.81, y: 616.48),
                       control2: CGPoint(x: 228.21, y: 611.94))
        path19.addCurve(to: CGPoint(x: 252.2, y: 607.9),
                       control1: CGPoint(x: 230.99, y: 611.68),
                       control2: CGPoint(x: 250.05, y: 609.54))
        path19.addCurve(to: CGPoint(x: 259.4, y: 599.94),
                       control1: CGPoint(x: 254.35, y: 606.25),
                       control2: CGPoint(x: 259.14, y: 602.47))
        path19.addCurve(to: CGPoint(x: 261.73, y: 583.21),
                       control1: CGPoint(x: 259.65, y: 597.41),
                       control2: CGPoint(x: 260.76, y: 583.22))
        path19.addCurve(to: CGPoint(x: 263.83, y: 581.94),
                       control1: CGPoint(x: 262.54, y: 582.48),
                       control2: CGPoint(x: 263.21, y: 582.27))
        path19.addCurve(to: CGPoint(x: 271.14, y: 581.19),
                       control1: CGPoint(x: 264.88, y: 581.39),
                       control2: CGPoint(x: 267.62, y: 581.24))
        path19.addCurve(to: CGPoint(x: 278.4, y: 581),
                       control1: CGPoint(x: 275.56, y: 581.13),
                       control2: CGPoint(x: 278.4, y: 581))
        path19.closeSubpath()
        ctx.addPath(path19)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path19)
        ctx.strokePath()
        ctx.setFillColor(color8)
        let path20 = CGMutablePath()
        path20.move(to: CGPoint(x: 307.75, y: 503.99))
        path20.addCurve(to: CGPoint(x: 301.91, y: 503.98),
                       control1: CGPoint(x: 307.75, y: 503.99),
                       control2: CGPoint(x: 303.05, y: 503.85))
        path20.addCurve(to: CGPoint(x: 290.23, y: 516.03),
                       control1: CGPoint(x: 300.77, y: 504.1),
                       control2: CGPoint(x: 290.61, y: 505.24))
        path20.addCurve(to: CGPoint(x: 302.24, y: 528.98),
                       control1: CGPoint(x: 289.85, y: 526.83),
                       control2: CGPoint(x: 302.24, y: 528.98))
        path20.addLine(to: CGPoint(x: 307.72, y: 529.1))
        path20.addLine(to: CGPoint(x: 313.48, y: 529.11))
        path20.addCurve(to: CGPoint(x: 326.28, y: 516.48),
                       control1: CGPoint(x: 313.48, y: 529.11),
                       control2: CGPoint(x: 326.09, y: 527.4))
        path20.addCurve(to: CGPoint(x: 313.27, y: 504.04),
                       control1: CGPoint(x: 326.47, y: 505.55),
                       control2: CGPoint(x: 313.27, y: 504.04))
        path20.closeSubpath()
        ctx.addPath(path20)
        ctx.fillPath()
        ctx.addPath(path20)
        ctx.strokePath()
        let path21 = CGMutablePath()
        path21.move(to: CGPoint(x: 456.5, y: 504.53))
        path21.addCurve(to: CGPoint(x: 450.66, y: 504.51),
                       control1: CGPoint(x: 456.5, y: 504.53),
                       control2: CGPoint(x: 451.8, y: 504.39))
        path21.addCurve(to: CGPoint(x: 438.98, y: 516.57),
                       control1: CGPoint(x: 449.52, y: 504.64),
                       control2: CGPoint(x: 439.36, y: 505.77))
        path21.addCurve(to: CGPoint(x: 450.99, y: 529.52),
                       control1: CGPoint(x: 438.6, y: 527.37),
                       control2: CGPoint(x: 450.99, y: 529.52))
        path21.addLine(to: CGPoint(x: 456.47, y: 529.63))
        path21.addLine(to: CGPoint(x: 462.23, y: 529.65))
        path21.addCurve(to: CGPoint(x: 475.03, y: 517.01),
                       control1: CGPoint(x: 462.23, y: 529.65),
                       control2: CGPoint(x: 474.84, y: 527.93))
        path21.addCurve(to: CGPoint(x: 462.02, y: 504.57),
                       control1: CGPoint(x: 475.22, y: 506.09),
                       control2: CGPoint(x: 462.02, y: 504.57))
        path21.closeSubpath()
        ctx.addPath(path21)
        ctx.fillPath()
        ctx.addPath(path21)
        ctx.strokePath()
        let color22 = CGColor(colorSpace: rgb, components: [0.851, 0.851, 0.851, 1])!
        ctx.setFillColor(color22)
        let path22 = CGMutablePath()
        path22.move(to: CGPoint(x: 312.86, y: 513.34))
        path22.addLine(to: CGPoint(x: 312.59, y: 527.09))
        path22.addLine(to: CGPoint(x: 298.84, y: 519.77))
        path22.closeSubpath()
        ctx.addPath(path22)
        ctx.fillPath()
        ctx.addPath(path22)
        ctx.strokePath()
        let path23 = CGMutablePath()
        path23.move(to: CGPoint(x: 452.19, y: 513.66))
        path23.addLine(to: CGPoint(x: 451.52, y: 526.78))
        path23.addLine(to: CGPoint(x: 465.94, y: 520.53))
        path23.closeSubpath()
        ctx.addPath(path23)
        ctx.fillPath()
        ctx.addPath(path23)
        ctx.strokePath()
        let color23 = CGColor(colorSpace: rgb, components: [0.467, 0.925, 0, 1])!
        ctx.setFillColor(color23)
        let path24 = CGMutablePath()
        path24.move(to: CGPoint(x: 381.71, y: 515.72))
        path24.addLine(to: CGPoint(x: 396.36, y: 524.94))
        path24.addCurve(to: CGPoint(x: 404.44, y: 530.37),
                       control1: CGPoint(x: 396.36, y: 524.94),
                       control2: CGPoint(x: 403.93, y: 529.61))
        path24.addCurve(to: CGPoint(x: 406.46, y: 533.02),
                       control1: CGPoint(x: 404.94, y: 531.12),
                       control2: CGPoint(x: 406.46, y: 533.02))
        path24.addCurve(to: CGPoint(x: 408.92, y: 530.74),
                       control1: CGPoint(x: 406.46, y: 533.02),
                       control2: CGPoint(x: 408.54, y: 531.25))
        path24.addCurve(to: CGPoint(x: 408.61, y: 527.9),
                       control1: CGPoint(x: 409.3, y: 530.24),
                       control2: CGPoint(x: 408.61, y: 527.9))
        path24.addCurve(to: CGPoint(x: 400.4, y: 518.88),
                       control1: CGPoint(x: 408.61, y: 527.9),
                       control2: CGPoint(x: 406.97, y: 523.93))
        path24.addCurve(to: CGPoint(x: 388.53, y: 507.76),
                       control1: CGPoint(x: 393.83, y: 513.82),
                       control2: CGPoint(x: 388.53, y: 507.76))
        path24.addLine(to: CGPoint(x: 394.97, y: 500.31))
        path24.addCurve(to: CGPoint(x: 400.65, y: 494.51),
                       control1: CGPoint(x: 394.97, y: 500.31),
                       control2: CGPoint(x: 399.7, y: 494.95))
        path24.addCurve(to: CGPoint(x: 403.11, y: 493.05),
                       control1: CGPoint(x: 401.12, y: 494.29),
                       control2: CGPoint(x: 403.11, y: 493.05))
        path24.addCurve(to: CGPoint(x: 398.76, y: 490.46),
                       control1: CGPoint(x: 403.11, y: 493.05),
                       control2: CGPoint(x: 401.03, y: 491.1))
        path24.addCurve(to: CGPoint(x: 381.21, y: 499.68),
                       control1: CGPoint(x: 396.48, y: 489.83),
                       control2: CGPoint(x: 381.21, y: 499.68))
        path24.addCurve(to: CGPoint(x: 363.21, y: 491.66),
                       control1: CGPoint(x: 381.21, y: 499.68),
                       control2: CGPoint(x: 365.49, y: 492.42))
        path24.addCurve(to: CGPoint(x: 358.67, y: 494.51),
                       control1: CGPoint(x: 361.32, y: 492.49),
                       control2: CGPoint(x: 359.85, y: 493.53))
        path24.addCurve(to: CGPoint(x: 362.2, y: 496.4),
                       control1: CGPoint(x: 361.34, y: 495.29),
                       control2: CGPoint(x: 362.2, y: 496.4))
        path24.addCurve(to: CGPoint(x: 373, y: 506.69),
                       control1: CGPoint(x: 362.2, y: 496.4),
                       control2: CGPoint(x: 372.3, y: 505.92))
        path24.addCurve(to: CGPoint(x: 374.2, y: 507.95),
                       control1: CGPoint(x: 373.69, y: 507.45),
                       control2: CGPoint(x: 374.2, y: 507.95))
        path24.addLine(to: CGPoint(x: 363.2, y: 519.95))
        path24.addCurve(to: CGPoint(x: 357.39, y: 529.31),
                       control1: CGPoint(x: 363.2, y: 519.95),
                       control2: CGPoint(x: 357.34, y: 527.38))
        path24.addCurve(to: CGPoint(x: 357.12, y: 532.37),
                       control1: CGPoint(x: 357.43, y: 530.79),
                       control2: CGPoint(x: 356.63, y: 531.78))
        path24.addCurve(to: CGPoint(x: 360.18, y: 534.67),
                       control1: CGPoint(x: 357.12, y: 532.37),
                       control2: CGPoint(x: 360.69, y: 535.94))
        path24.addCurve(to: CGPoint(x: 361.45, y: 531.85),
                       control1: CGPoint(x: 359.68, y: 533.41),
                       control2: CGPoint(x: 361.45, y: 531.85))
        path24.addCurve(to: CGPoint(x: 368.36, y: 526.1),
                       control1: CGPoint(x: 361.45, y: 531.85),
                       control2: CGPoint(x: 366.78, y: 527.13))
        path24.addCurve(to: CGPoint(x: 381.71, y: 515.72),
                       control1: CGPoint(x: 370.06, y: 525),
                       control2: CGPoint(x: 381.71, y: 515.72))
        path24.closeSubpath()
        ctx.addPath(path24)
        ctx.fillPath()
        ctx.addPath(path24)
        ctx.strokePath()
        ctx.saveGState()
        let transform15 = CGAffineTransform(
          a: 1.0,
          b: 0.0,
          c: 0.0,
          d: 1.0750504,
          tx: 13.384521,
          ty: -50.488125
        )
        ctx.concatenate(transform15)
        ctx.setFillColor(color5)
        let path25 = CGMutablePath()
        path25.move(to: CGPoint(x: 536.9, y: 610.04))
        path25.addCurve(to: CGPoint(x: 463.28, y: 658.4),
                       control1: CGPoint(x: 536.9, y: 636.75),
                       control2: CGPoint(x: 503.94, y: 658.4))
        path25.addCurve(to: CGPoint(x: 389.67, y: 610.04),
                       control1: CGPoint(x: 422.62, y: 658.4),
                       control2: CGPoint(x: 389.67, y: 636.75))
        path25.addCurve(to: CGPoint(x: 463.28, y: 561.68),
                       control1: CGPoint(x: 389.67, y: 583.33),
                       control2: CGPoint(x: 422.62, y: 561.68))
        path25.addCurve(to: CGPoint(x: 536.9, y: 610.04),
                       control1: CGPoint(x: 503.94, y: 561.68),
                       control2: CGPoint(x: 536.9, y: 583.33))
        path25.closeSubpath()
        ctx.addPath(path25)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path25)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform16 = CGAffineTransform(
          a: 1.1078378,
          b: 0.0,
          c: 0.0,
          d: 1.069313,
          tx: -57.042725,
          ty: -47.700954
        )
        ctx.concatenate(transform16)
        ctx.setFillColor(color17)
        let path26 = CGMutablePath()
        path26.move(to: CGPoint(x: 525.18, y: 624.59))
        path26.addCurve(to: CGPoint(x: 482.5, y: 661.47),
                       control1: CGPoint(x: 525.18, y: 644.96),
                       control2: CGPoint(x: 506.07, y: 661.47))
        path26.addCurve(to: CGPoint(x: 439.82, y: 624.59),
                       control1: CGPoint(x: 458.93, y: 661.47),
                       control2: CGPoint(x: 439.82, y: 644.96))
        path26.addCurve(to: CGPoint(x: 482.5, y: 587.72),
                       control1: CGPoint(x: 439.82, y: 604.23),
                       control2: CGPoint(x: 458.93, y: 587.72))
        path26.addCurve(to: CGPoint(x: 525.18, y: 624.59),
                       control1: CGPoint(x: 506.07, y: 587.72),
                       control2: CGPoint(x: 525.18, y: 604.23))
        path26.closeSubpath()
        ctx.addPath(path26)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path26)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform17 = CGAffineTransform(
          a: 1.0990778,
          b: 0.0,
          c: 0.0,
          d: 1.090643,
          tx: -47.142178,
          ty: -84.97654
        )
        ctx.concatenate(transform17)
        let color24 = CGColor(colorSpace: rgb, components: [0.459, 0.459, 0.459, 1])!
        ctx.setFillColor(color24)
        let path27 = CGMutablePath()
        path27.move(to: CGPoint(x: 516.19, y: 646.28))
        path27.addCurve(to: CGPoint(x: 476.92, y: 679.36),
                       control1: CGPoint(x: 516.19, y: 664.55),
                       control2: CGPoint(x: 498.61, y: 679.36))
        path27.addCurve(to: CGPoint(x: 437.65, y: 646.28),
                       control1: CGPoint(x: 455.23, y: 679.36),
                       control2: CGPoint(x: 437.65, y: 664.55))
        path27.addCurve(to: CGPoint(x: 476.92, y: 613.2),
                       control1: CGPoint(x: 437.65, y: 628.01),
                       control2: CGPoint(x: 455.23, y: 613.2))
        path27.addCurve(to: CGPoint(x: 516.19, y: 646.28),
                       control1: CGPoint(x: 498.61, y: 613.2),
                       control2: CGPoint(x: 516.19, y: 628.01))
        path27.closeSubpath()
        ctx.addPath(path27)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path27)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform18 = CGAffineTransform(
          a: 1.2911156,
          b: 0.25075042,
          c: -0.24114302,
          d: 1.342555,
          tx: 122.03144,
          ty: -282.91336
        )
        ctx.concatenate(transform18)
        let color25 = CGColor(colorSpace: rgb, components: [0.871, 0.871, 0.871, 1])!
        ctx.setFillColor(color25)
        let path28 = CGMutablePath()
        path28.move(to: CGPoint(x: 202.86, y: 563.79))
        path28.addCurve(to: CGPoint(x: 147.14, y: 605.58),
                       control1: CGPoint(x: 202.86, y: 586.87),
                       control2: CGPoint(x: 177.91, y: 605.58))
        path28.addCurve(to: CGPoint(x: 91.43, y: 563.79),
                       control1: CGPoint(x: 116.37, y: 605.58),
                       control2: CGPoint(x: 91.43, y: 586.87))
        path28.addCurve(to: CGPoint(x: 147.14, y: 522.01),
                       control1: CGPoint(x: 91.43, y: 540.71),
                       control2: CGPoint(x: 116.37, y: 522.01))
        path28.addCurve(to: CGPoint(x: 202.86, y: 563.79),
                       control1: CGPoint(x: 177.91, y: 522.01),
                       control2: CGPoint(x: 202.86, y: 540.71))
        path28.closeSubpath()
        ctx.addPath(path28)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path28)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform19 = CGAffineTransform(
          a: 1.1786188,
          b: 0.0,
          c: 0.0,
          d: 1.1800003,
          tx: -38.537422,
          ty: -94.6039
        )
        ctx.concatenate(transform19)
        ctx.setFillColor(color17)
        let path29 = CGMutablePath()
        path29.move(to: CGPoint(x: 223.57, y: 523.43))
        path29.addCurve(to: CGPoint(x: 183.21, y: 557.01),
                       control1: CGPoint(x: 223.57, y: 541.97),
                       control2: CGPoint(x: 205.5, y: 557.01))
        path29.addCurve(to: CGPoint(x: 142.86, y: 523.43),
                       control1: CGPoint(x: 160.93, y: 557.01),
                       control2: CGPoint(x: 142.86, y: 541.97))
        path29.addCurve(to: CGPoint(x: 183.21, y: 489.86),
                       control1: CGPoint(x: 142.86, y: 504.89),
                       control2: CGPoint(x: 160.93, y: 489.86))
        path29.addCurve(to: CGPoint(x: 223.57, y: 523.43),
                       control1: CGPoint(x: 205.5, y: 489.86),
                       control2: CGPoint(x: 223.57, y: 504.89))
        path29.closeSubpath()
        ctx.addPath(path29)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path29)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform20 = CGAffineTransform(
          a: 1.0990778,
          b: 0.0,
          c: 0.0,
          d: 1.090643,
          tx: -346.4279,
          ty: -182.1194
        )
        ctx.concatenate(transform20)
        ctx.setFillColor(color24)
        ctx.addPath(path27)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path27)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform21 = CGAffineTransform(
          a: 1.2146473,
          b: 0.0,
          c: 0.0,
          d: 1.4419692,
          tx: -32.14006,
          ty: -262.68317
        )
        ctx.concatenate(transform21)
        let color26 = CGColor(colorSpace: rgb, components: [0.525, 0.525, 0.525, 1])!
        ctx.setFillColor(color26)
        let path30 = CGMutablePath()
        path30.move(to: CGPoint(x: 207.14, y: 553.61))
        path30.addCurve(to: CGPoint(x: 169.64, y: 580.76),
                       control1: CGPoint(x: 207.14, y: 568.6),
                       control2: CGPoint(x: 190.35, y: 580.76))
        path30.addCurve(to: CGPoint(x: 132.14, y: 553.61),
                       control1: CGPoint(x: 148.93, y: 580.76),
                       control2: CGPoint(x: 132.14, y: 568.6))
        path30.addCurve(to: CGPoint(x: 169.64, y: 526.47),
                       control1: CGPoint(x: 132.14, y: 538.62),
                       control2: CGPoint(x: 148.93, y: 526.47))
        path30.addCurve(to: CGPoint(x: 207.14, y: 553.61),
                       control1: CGPoint(x: 190.35, y: 526.47),
                       control2: CGPoint(x: 207.14, y: 538.62))
        path30.closeSubpath()
        ctx.addPath(path30)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path30)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform22 = CGAffineTransform(
          a: 1.0684925,
          b: 0.0,
          c: 0.0,
          d: 1.133116,
          tx: -33.08437,
          ty: -85.93538
        )
        ctx.concatenate(transform22)
        ctx.setFillColor(color26)
        let path31 = CGMutablePath()
        path31.move(to: CGPoint(x: 519.29, y: 638.34))
        path31.addCurve(to: CGPoint(x: 478.04, y: 670.93),
                       control1: CGPoint(x: 519.29, y: 656.34),
                       control2: CGPoint(x: 500.82, y: 670.93))
        path31.addCurve(to: CGPoint(x: 436.79, y: 638.34),
                       control1: CGPoint(x: 455.25, y: 670.93),
                       control2: CGPoint(x: 436.79, y: 656.34))
        path31.addCurve(to: CGPoint(x: 478.04, y: 605.76),
                       control1: CGPoint(x: 436.79, y: 620.35),
                       control2: CGPoint(x: 455.25, y: 605.76))
        path31.addCurve(to: CGPoint(x: 519.29, y: 638.34),
                       control1: CGPoint(x: 500.82, y: 605.76),
                       control2: CGPoint(x: 519.29, y: 620.35))
        path31.closeSubpath()
        ctx.addPath(path31)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path31)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.scaleBy(x: 1.23, y: 0.81)
        let color27 = CGColor(colorSpace: rgb, components: [0.408, 0.408, 0.408, 1])!
        ctx.setFillColor(color27)
        let path32 = CGMutablePath()
        path32.move(to: CGPoint(x: 283.52, y: 599.05))
        path32.addLine(to: CGPoint(x: 282.17, y: 599.05))
        path32.addLine(to: CGPoint(x: 282.17, y: 593.96))
        path32.addCurve(to: CGPoint(x: 280.42, y: 594.99),
                       control1: CGPoint(x: 281.67, y: 594.42),
                       control2: CGPoint(x: 281.09, y: 594.76))
        path32.addLine(to: CGPoint(x: 280.42, y: 593.76))
        path32.addCurve(to: CGPoint(x: 281.57, y: 593.11),
                       control1: CGPoint(x: 280.77, y: 593.65),
                       control2: CGPoint(x: 281.16, y: 593.43))
        path32.addCurve(to: CGPoint(x: 282.42, y: 591.98),
                       control1: CGPoint(x: 281.98, y: 592.78),
                       control2: CGPoint(x: 282.27, y: 592.41))
        path32.addLine(to: CGPoint(x: 283.52, y: 591.98))
        path32.closeSubpath()
        ctx.addPath(path32)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.scaleBy(x: 1.12, y: 0.89)
        ctx.setFillColor(color27)
        let path33 = CGMutablePath()
        path33.move(to: CGPoint(x: 374.13, y: 545.74))
        path33.addLine(to: CGPoint(x: 374.13, y: 546.84))
        path33.addLine(to: CGPoint(x: 369.97, y: 546.84))
        path33.addCurve(to: CGPoint(x: 370.38, y: 545.66),
                       control1: CGPoint(x: 370.02, y: 546.43),
                       control2: CGPoint(x: 370.15, y: 546.03))
        path33.addCurve(to: CGPoint(x: 371.71, y: 544.18),
                       control1: CGPoint(x: 370.6, y: 545.29),
                       control2: CGPoint(x: 371.04, y: 544.79))
        path33.addCurve(to: CGPoint(x: 372.69, y: 543.16),
                       control1: CGPoint(x: 372.24, y: 543.68),
                       control2: CGPoint(x: 372.57, y: 543.34))
        path33.addCurve(to: CGPoint(x: 372.94, y: 542.44),
                       control1: CGPoint(x: 372.85, y: 542.92),
                       control2: CGPoint(x: 372.94, y: 542.68))
        path33.addCurve(to: CGPoint(x: 372.72, y: 541.83),
                       control1: CGPoint(x: 372.94, y: 542.17),
                       control2: CGPoint(x: 372.86, y: 541.97))
        path33.addCurve(to: CGPoint(x: 372.13, y: 541.62),
                       control1: CGPoint(x: 372.58, y: 541.69),
                       control2: CGPoint(x: 372.38, y: 541.62))
        path33.addCurve(to: CGPoint(x: 371.54, y: 541.84),
                       control1: CGPoint(x: 371.89, y: 541.62),
                       control2: CGPoint(x: 371.69, y: 541.69))
        path33.addCurve(to: CGPoint(x: 371.29, y: 542.58),
                       control1: CGPoint(x: 371.4, y: 541.99),
                       control2: CGPoint(x: 371.31, y: 542.24))
        path33.addLine(to: CGPoint(x: 370.11, y: 542.46))
        path33.addCurve(to: CGPoint(x: 370.77, y: 541.06),
                       control1: CGPoint(x: 370.18, y: 541.81),
                       control2: CGPoint(x: 370.4, y: 541.34))
        path33.addCurve(to: CGPoint(x: 372.16, y: 540.63),
                       control1: CGPoint(x: 371.14, y: 540.77),
                       control2: CGPoint(x: 371.61, y: 540.63))
        path33.addCurve(to: CGPoint(x: 373.6, y: 541.13),
                       control1: CGPoint(x: 372.77, y: 540.63),
                       control2: CGPoint(x: 373.25, y: 540.8))
        path33.addCurve(to: CGPoint(x: 374.13, y: 542.35),
                       control1: CGPoint(x: 373.95, y: 541.46),
                       control2: CGPoint(x: 374.13, y: 541.86))
        path33.addCurve(to: CGPoint(x: 373.98, y: 543.15),
                       control1: CGPoint(x: 374.13, y: 542.63),
                       control2: CGPoint(x: 374.08, y: 542.9))
        path33.addCurve(to: CGPoint(x: 373.5, y: 543.94),
                       control1: CGPoint(x: 373.88, y: 543.4),
                       control2: CGPoint(x: 373.72, y: 543.66))
        path33.addCurve(to: CGPoint(x: 372.72, y: 544.73),
                       control1: CGPoint(x: 373.36, y: 544.12),
                       control2: CGPoint(x: 373.1, y: 544.39))
        path33.addCurve(to: CGPoint(x: 372.01, y: 545.41),
                       control1: CGPoint(x: 372.35, y: 545.07),
                       control2: CGPoint(x: 372.11, y: 545.3))
        path33.addCurve(to: CGPoint(x: 371.77, y: 545.74),
                       control1: CGPoint(x: 371.91, y: 545.52),
                       control2: CGPoint(x: 371.83, y: 545.63))
        path33.closeSubpath()
        ctx.addPath(path33)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.scaleBy(x: 1.14, y: 0.88)
        ctx.setFillColor(color27)
        let path34 = CGMutablePath()
        path34.move(to: CGPoint(x: 302.35, y: 627))
        path34.addLine(to: CGPoint(x: 303.49, y: 626.87))
        path34.addCurve(to: CGPoint(x: 303.79, y: 627.54),
                       control1: CGPoint(x: 303.53, y: 627.16),
                       control2: CGPoint(x: 303.63, y: 627.38))
        path34.addCurve(to: CGPoint(x: 304.37, y: 627.77),
                       control1: CGPoint(x: 303.95, y: 627.69),
                       control2: CGPoint(x: 304.15, y: 627.77))
        path34.addCurve(to: CGPoint(x: 304.99, y: 627.49),
                       control1: CGPoint(x: 304.62, y: 627.77),
                       control2: CGPoint(x: 304.82, y: 627.68))
        path34.addCurve(to: CGPoint(x: 305.24, y: 626.74),
                       control1: CGPoint(x: 305.16, y: 627.3),
                       control2: CGPoint(x: 305.24, y: 627.05))
        path34.addCurve(to: CGPoint(x: 305, y: 626.03),
                       control1: CGPoint(x: 305.24, y: 626.44),
                       control2: CGPoint(x: 305.16, y: 626.2))
        path34.addCurve(to: CGPoint(x: 304.42, y: 625.77),
                       control1: CGPoint(x: 304.84, y: 625.85),
                       control2: CGPoint(x: 304.65, y: 625.77))
        path34.addCurve(to: CGPoint(x: 303.87, y: 625.86),
                       control1: CGPoint(x: 304.26, y: 625.77),
                       control2: CGPoint(x: 304.08, y: 625.8))
        path34.addLine(to: CGPoint(x: 304, y: 624.89))
        path34.addCurve(to: CGPoint(x: 304.74, y: 624.68),
                       control1: CGPoint(x: 304.32, y: 624.9),
                       control2: CGPoint(x: 304.57, y: 624.83))
        path34.addCurve(to: CGPoint(x: 304.99, y: 624.09),
                       control1: CGPoint(x: 304.9, y: 624.53),
                       control2: CGPoint(x: 304.99, y: 624.34))
        path34.addCurve(to: CGPoint(x: 304.8, y: 623.59),
                       control1: CGPoint(x: 304.99, y: 623.88),
                       control2: CGPoint(x: 304.93, y: 623.72))
        path34.addCurve(to: CGPoint(x: 304.31, y: 623.41),
                       control1: CGPoint(x: 304.68, y: 623.47),
                       control2: CGPoint(x: 304.52, y: 623.41))
        path34.addCurve(to: CGPoint(x: 303.79, y: 623.62),
                       control1: CGPoint(x: 304.11, y: 623.41),
                       control2: CGPoint(x: 303.93, y: 623.48))
        path34.addCurve(to: CGPoint(x: 303.53, y: 624.24),
                       control1: CGPoint(x: 303.65, y: 623.76),
                       control2: CGPoint(x: 303.56, y: 623.97))
        path34.addLine(to: CGPoint(x: 302.44, y: 624.05))
        path34.addCurve(to: CGPoint(x: 302.78, y: 623.15),
                       control1: CGPoint(x: 302.51, y: 623.68),
                       control2: CGPoint(x: 302.63, y: 623.38))
        path34.addCurve(to: CGPoint(x: 303.42, y: 622.62),
                       control1: CGPoint(x: 302.93, y: 622.93),
                       control2: CGPoint(x: 303.15, y: 622.75))
        path34.addCurve(to: CGPoint(x: 304.34, y: 622.43),
                       control1: CGPoint(x: 303.7, y: 622.5),
                       control2: CGPoint(x: 304, y: 622.43))
        path34.addCurve(to: CGPoint(x: 305.75, y: 622.99),
                       control1: CGPoint(x: 304.93, y: 622.43),
                       control2: CGPoint(x: 305.39, y: 622.62))
        path34.addCurve(to: CGPoint(x: 306.18, y: 624.02),
                       control1: CGPoint(x: 306.03, y: 623.29),
                       control2: CGPoint(x: 306.18, y: 623.64))
        path34.addCurve(to: CGPoint(x: 305.29, y: 625.32),
                       control1: CGPoint(x: 306.18, y: 624.56),
                       control2: CGPoint(x: 305.88, y: 625))
        path34.addCurve(to: CGPoint(x: 306.14, y: 625.83),
                       control1: CGPoint(x: 305.64, y: 625.4),
                       control2: CGPoint(x: 305.93, y: 625.57))
        path34.addCurve(to: CGPoint(x: 306.46, y: 626.79),
                       control1: CGPoint(x: 306.35, y: 626.1),
                       control2: CGPoint(x: 306.46, y: 626.41))
        path34.addCurve(to: CGPoint(x: 305.86, y: 628.18),
                       control1: CGPoint(x: 306.46, y: 627.33),
                       control2: CGPoint(x: 306.26, y: 627.8))
        path34.addCurve(to: CGPoint(x: 304.38, y: 628.75),
                       control1: CGPoint(x: 305.47, y: 628.56),
                       control2: CGPoint(x: 304.97, y: 628.75))
        path34.addCurve(to: CGPoint(x: 302.99, y: 628.27),
                       control1: CGPoint(x: 303.82, y: 628.75),
                       control2: CGPoint(x: 303.36, y: 628.59))
        path34.addCurve(to: CGPoint(x: 302.35, y: 627),
                       control1: CGPoint(x: 302.62, y: 627.95),
                       control2: CGPoint(x: 302.41, y: 627.53))
        path34.closeSubpath()
        ctx.addPath(path34)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.scaleBy(x: 1.15, y: 0.87)
        ctx.setFillColor(color27)
        let path35 = CGMutablePath()
        path35.move(to: CGPoint(x: 361.95, y: 634.71))
        path35.addLine(to: CGPoint(x: 361.95, y: 633.49))
        path35.addLine(to: CGPoint(x: 359.48, y: 633.49))
        path35.addLine(to: CGPoint(x: 359.48, y: 632.48))
        path35.addLine(to: CGPoint(x: 362.1, y: 628.66))
        path35.addLine(to: CGPoint(x: 363.07, y: 628.66))
        path35.addLine(to: CGPoint(x: 363.07, y: 632.48))
        path35.addLine(to: CGPoint(x: 363.81, y: 632.48))
        path35.addLine(to: CGPoint(x: 363.81, y: 633.49))
        path35.addLine(to: CGPoint(x: 363.07, y: 633.49))
        path35.addLine(to: CGPoint(x: 363.07, y: 634.71))
        path35.closeSubpath()
        path35.move(to: CGPoint(x: 361.95, y: 632.48))
        path35.addLine(to: CGPoint(x: 361.95, y: 630.42))
        path35.addLine(to: CGPoint(x: 360.56, y: 632.48))
        path35.closeSubpath()
        ctx.addPath(path35)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.setFillColor(color27)
        let path36 = CGMutablePath()
        path36.move(to: CGPoint(x: 281.61, y: 502.55))
        path36.addLine(to: CGPoint(x: 283.23, y: 500.94))
        path36.addCurve(to: CGPoint(x: 283.99, y: 500.26),
                       control1: CGPoint(x: 283.56, y: 500.62),
                       control2: CGPoint(x: 283.81, y: 500.39))
        path36.addCurve(to: CGPoint(x: 284.59, y: 500.01),
                       control1: CGPoint(x: 284.18, y: 500.13),
                       control2: CGPoint(x: 284.38, y: 500.05))
        path36.addCurve(to: CGPoint(x: 285.23, y: 500.04),
                       control1: CGPoint(x: 284.79, y: 499.97),
                       control2: CGPoint(x: 285.01, y: 499.98))
        path36.addCurve(to: CGPoint(x: 285.83, y: 500.4),
                       control1: CGPoint(x: 285.46, y: 500.1),
                       control2: CGPoint(x: 285.66, y: 500.22))
        path36.addCurve(to: CGPoint(x: 286.2, y: 501.07),
                       control1: CGPoint(x: 286.02, y: 500.59),
                       control2: CGPoint(x: 286.14, y: 500.81))
        path36.addCurve(to: CGPoint(x: 286.13, y: 501.85),
                       control1: CGPoint(x: 286.25, y: 501.33),
                       control2: CGPoint(x: 286.23, y: 501.59))
        path36.addCurve(to: CGPoint(x: 287.07, y: 501.65),
                       control1: CGPoint(x: 286.45, y: 501.67),
                       control2: CGPoint(x: 286.76, y: 501.61))
        path36.addCurve(to: CGPoint(x: 287.88, y: 502.07),
                       control1: CGPoint(x: 287.37, y: 501.69),
                       control2: CGPoint(x: 287.64, y: 501.83))
        path36.addCurve(to: CGPoint(x: 288.28, y: 502.73),
                       control1: CGPoint(x: 288.06, y: 502.25),
                       control2: CGPoint(x: 288.19, y: 502.47))
        path36.addCurve(to: CGPoint(x: 288.34, y: 503.5),
                       control1: CGPoint(x: 288.37, y: 502.99),
                       control2: CGPoint(x: 288.39, y: 503.25))
        path36.addCurve(to: CGPoint(x: 287.98, y: 504.24),
                       control1: CGPoint(x: 288.3, y: 503.75),
                       control2: CGPoint(x: 288.18, y: 504))
        path36.addCurve(to: CGPoint(x: 287.02, y: 505.25),
                       control1: CGPoint(x: 287.86, y: 504.39),
                       control2: CGPoint(x: 287.54, y: 504.73))
        path36.addLine(to: CGPoint(x: 285.63, y: 506.62))
        path36.closeSubpath()
        path36.move(to: CGPoint(x: 283.1, y: 502.41))
        path36.addLine(to: CGPoint(x: 284.03, y: 503.35))
        path36.addLine(to: CGPoint(x: 284.57, y: 502.82))
        path36.addCurve(to: CGPoint(x: 285.15, y: 502.22),
                       control1: CGPoint(x: 284.89, y: 502.5),
                       control2: CGPoint(x: 285.08, y: 502.3))
        path36.addCurve(to: CGPoint(x: 285.34, y: 501.74),
                       control1: CGPoint(x: 285.28, y: 502.06),
                       control2: CGPoint(x: 285.34, y: 501.9))
        path36.addCurve(to: CGPoint(x: 285.15, y: 501.3),
                       control1: CGPoint(x: 285.34, y: 501.58),
                       control2: CGPoint(x: 285.28, y: 501.44))
        path36.addCurve(to: CGPoint(x: 284.74, y: 501.1),
                       control1: CGPoint(x: 285.02, y: 501.18),
                       control2: CGPoint(x: 284.89, y: 501.11))
        path36.addCurve(to: CGPoint(x: 284.29, y: 501.26),
                       control1: CGPoint(x: 284.59, y: 501.09),
                       control2: CGPoint(x: 284.44, y: 501.14))
        path36.addCurve(to: CGPoint(x: 283.57, y: 501.94),
                       control1: CGPoint(x: 284.2, y: 501.33),
                       control2: CGPoint(x: 283.96, y: 501.56))
        path36.closeSubpath()
        path36.move(to: CGPoint(x: 284.7, y: 504.03))
        path36.addLine(to: CGPoint(x: 285.78, y: 505.12))
        path36.addLine(to: CGPoint(x: 286.54, y: 504.37))
        path36.addCurve(to: CGPoint(x: 287.08, y: 503.78),
                       control1: CGPoint(x: 286.83, y: 504.07),
                       control2: CGPoint(x: 287.01, y: 503.88))
        path36.addCurve(to: CGPoint(x: 287.21, y: 503.33),
                       control1: CGPoint(x: 287.18, y: 503.64),
                       control2: CGPoint(x: 287.22, y: 503.49))
        path36.addCurve(to: CGPoint(x: 286.99, y: 502.87),
                       control1: CGPoint(x: 287.21, y: 503.16),
                       control2: CGPoint(x: 287.13, y: 503.01))
        path36.addCurve(to: CGPoint(x: 286.59, y: 502.64),
                       control1: CGPoint(x: 286.87, y: 502.74),
                       control2: CGPoint(x: 286.73, y: 502.67))
        path36.addCurve(to: CGPoint(x: 286.15, y: 502.71),
                       control1: CGPoint(x: 286.45, y: 502.62),
                       control2: CGPoint(x: 286.3, y: 502.64))
        path36.addCurve(to: CGPoint(x: 285.36, y: 503.37),
                       control1: CGPoint(x: 286, y: 502.78),
                       control2: CGPoint(x: 285.74, y: 503))
        path36.closeSubpath()
        ctx.addPath(path36)
        ctx.fillPath()
        let path37 = CGMutablePath()
        path37.move(to: CGPoint(x: 294.27, y: 499.99))
        path37.addLine(to: CGPoint(x: 293.19, y: 500.64))
        path37.addLine(to: CGPoint(x: 292.09, y: 499.78))
        path37.addLine(to: CGPoint(x: 290.13, y: 500.95))
        path37.addLine(to: CGPoint(x: 290.39, y: 502.31))
        path37.addLine(to: CGPoint(x: 289.34, y: 502.94))
        path37.addLine(to: CGPoint(x: 288.32, y: 496.88))
        path37.addLine(to: CGPoint(x: 289.37, y: 496.25))
        path37.closeSubpath()
        path37.move(to: CGPoint(x: 291.28, y: 499.14))
        path37.addLine(to: CGPoint(x: 289.51, y: 497.72))
        path37.addLine(to: CGPoint(x: 289.94, y: 499.94))
        path37.closeSubpath()
        ctx.addPath(path37)
        ctx.fillPath()
        let path38 = CGMutablePath()
        path38.move(to: CGPoint(x: 297.74, y: 496.69))
        path38.addLine(to: CGPoint(x: 298.92, y: 496.69))
        path38.addCurve(to: CGPoint(x: 298.52, y: 498.28),
                       control1: CGPoint(x: 298.95, y: 497.34),
                       control2: CGPoint(x: 298.81, y: 497.87))
        path38.addCurve(to: CGPoint(x: 297.21, y: 499.17),
                       control1: CGPoint(x: 298.23, y: 498.69),
                       control2: CGPoint(x: 297.8, y: 498.98))
        path38.addCurve(to: CGPoint(x: 295.19, y: 498.99),
                       control1: CGPoint(x: 296.49, y: 499.4),
                       control2: CGPoint(x: 295.81, y: 499.34))
        path38.addCurve(to: CGPoint(x: 293.84, y: 497.18),
                       control1: CGPoint(x: 294.56, y: 498.65),
                       control2: CGPoint(x: 294.12, y: 498.04))
        path38.addCurve(to: CGPoint(x: 293.88, y: 494.84),
                       control1: CGPoint(x: 293.56, y: 496.28),
                       control2: CGPoint(x: 293.57, y: 495.5))
        path38.addCurve(to: CGPoint(x: 295.49, y: 493.5),
                       control1: CGPoint(x: 294.19, y: 494.19),
                       control2: CGPoint(x: 294.73, y: 493.75))
        path38.addCurve(to: CGPoint(x: 297.3, y: 493.58),
                       control1: CGPoint(x: 296.16, y: 493.29),
                       control2: CGPoint(x: 296.76, y: 493.32))
        path38.addCurve(to: CGPoint(x: 298.18, y: 494.41),
                       control1: CGPoint(x: 297.63, y: 493.73),
                       control2: CGPoint(x: 297.92, y: 494.01))
        path38.addLine(to: CGPoint(x: 297.17, y: 495.01))
        path38.addCurve(to: CGPoint(x: 296.56, y: 494.47),
                       control1: CGPoint(x: 297.02, y: 494.75),
                       control2: CGPoint(x: 296.81, y: 494.57))
        path38.addCurve(to: CGPoint(x: 295.73, y: 494.46),
                       control1: CGPoint(x: 296.3, y: 494.37),
                       control2: CGPoint(x: 296.03, y: 494.37))
        path38.addCurve(to: CGPoint(x: 294.89, y: 495.21),
                       control1: CGPoint(x: 295.33, y: 494.59),
                       control2: CGPoint(x: 295.05, y: 494.84))
        path38.addCurve(to: CGPoint(x: 294.95, y: 496.74),
                       control1: CGPoint(x: 294.73, y: 495.58),
                       control2: CGPoint(x: 294.75, y: 496.09))
        path38.addCurve(to: CGPoint(x: 295.79, y: 498.1),
                       control1: CGPoint(x: 295.17, y: 497.43),
                       control2: CGPoint(x: 295.45, y: 497.88))
        path38.addCurve(to: CGPoint(x: 296.9, y: 498.23),
                       control1: CGPoint(x: 296.13, y: 498.31),
                       control2: CGPoint(x: 296.5, y: 498.36))
        path38.addCurve(to: CGPoint(x: 297.57, y: 497.71),
                       control1: CGPoint(x: 297.19, y: 498.14),
                       control2: CGPoint(x: 297.42, y: 497.97))
        path38.addCurve(to: CGPoint(x: 297.74, y: 496.69),
                       control1: CGPoint(x: 297.72, y: 497.46),
                       control2: CGPoint(x: 297.78, y: 497.12))
        path38.closeSubpath()
        ctx.addPath(path38)
        ctx.fillPath()
        let path39 = CGMutablePath()
        path39.move(to: CGPoint(x: 300.46, y: 498.19))
        path39.addLine(to: CGPoint(x: 299.85, y: 492.5))
        path39.addLine(to: CGPoint(x: 301, y: 492.37))
        path39.addLine(to: CGPoint(x: 301.27, y: 494.9))
        path39.addLine(to: CGPoint(x: 303.32, y: 492.12))
        path39.addLine(to: CGPoint(x: 304.86, y: 491.96))
        path39.addLine(to: CGPoint(x: 302.96, y: 494.41))
        path39.addLine(to: CGPoint(x: 305.6, y: 497.64))
        path39.addLine(to: CGPoint(x: 304.11, y: 497.8))
        path39.addLine(to: CGPoint(x: 302.26, y: 495.3))
        path39.addLine(to: CGPoint(x: 301.43, y: 496.35))
        path39.addLine(to: CGPoint(x: 301.61, y: 498.07))
        path39.closeSubpath()
        ctx.addPath(path39)
        ctx.fillPath()
        let path40 = CGMutablePath()
        path40.move(to: CGPoint(x: 457.6, y: 495.92))
        path40.addLine(to: CGPoint(x: 458.72, y: 495.82))
        path40.addCurve(to: CGPoint(x: 459.13, y: 496.65),
                       control1: CGPoint(x: 458.79, y: 496.19),
                       control2: CGPoint(x: 458.92, y: 496.47))
        path40.addCurve(to: CGPoint(x: 459.96, y: 496.92),
                       control1: CGPoint(x: 459.33, y: 496.83),
                       control2: CGPoint(x: 459.61, y: 496.92))
        path40.addCurve(to: CGPoint(x: 460.81, y: 496.69),
                       control1: CGPoint(x: 460.34, y: 496.93),
                       control2: CGPoint(x: 460.62, y: 496.85))
        path40.addCurve(to: CGPoint(x: 461.09, y: 496.14),
                       control1: CGPoint(x: 461, y: 496.54),
                       control2: CGPoint(x: 461.09, y: 496.35))
        path40.addCurve(to: CGPoint(x: 460.98, y: 495.8),
                       control1: CGPoint(x: 461.09, y: 496.01),
                       control2: CGPoint(x: 461.06, y: 495.89))
        path40.addCurve(to: CGPoint(x: 460.56, y: 495.55),
                       control1: CGPoint(x: 460.9, y: 495.7),
                       control2: CGPoint(x: 460.76, y: 495.62))
        path40.addCurve(to: CGPoint(x: 459.64, y: 495.29),
                       control1: CGPoint(x: 460.43, y: 495.5),
                       control2: CGPoint(x: 460.12, y: 495.41))
        path40.addCurve(to: CGPoint(x: 458.34, y: 494.71),
                       control1: CGPoint(x: 459.02, y: 495.13),
                       control2: CGPoint(x: 458.59, y: 494.94))
        path40.addCurve(to: CGPoint(x: 457.82, y: 493.56),
                       control1: CGPoint(x: 457.99, y: 494.39),
                       control2: CGPoint(x: 457.82, y: 494.01))
        path40.addCurve(to: CGPoint(x: 458.07, y: 492.74),
                       control1: CGPoint(x: 457.82, y: 493.26),
                       control2: CGPoint(x: 457.91, y: 492.99))
        path40.addCurve(to: CGPoint(x: 458.79, y: 492.16),
                       control1: CGPoint(x: 458.24, y: 492.49),
                       control2: CGPoint(x: 458.48, y: 492.3))
        path40.addCurve(to: CGPoint(x: 459.92, y: 491.97),
                       control1: CGPoint(x: 459.11, y: 492.03),
                       control2: CGPoint(x: 459.48, y: 491.97))
        path40.addCurve(to: CGPoint(x: 461.54, y: 492.46),
                       control1: CGPoint(x: 460.64, y: 491.98),
                       control2: CGPoint(x: 461.18, y: 492.14))
        path40.addCurve(to: CGPoint(x: 462.1, y: 493.72),
                       control1: CGPoint(x: 461.9, y: 492.78),
                       control2: CGPoint(x: 462.09, y: 493.2))
        path40.addLine(to: CGPoint(x: 460.95, y: 493.77))
        path40.addCurve(to: CGPoint(x: 460.63, y: 493.13),
                       control1: CGPoint(x: 460.9, y: 493.47),
                       control2: CGPoint(x: 460.8, y: 493.26))
        path40.addCurve(to: CGPoint(x: 459.9, y: 492.93),
                       control1: CGPoint(x: 460.47, y: 493),
                       control2: CGPoint(x: 460.23, y: 492.93))
        path40.addCurve(to: CGPoint(x: 459.11, y: 493.13),
                       control1: CGPoint(x: 459.57, y: 492.93),
                       control2: CGPoint(x: 459.3, y: 493))
        path40.addCurve(to: CGPoint(x: 458.93, y: 493.49),
                       control1: CGPoint(x: 458.99, y: 493.22),
                       control2: CGPoint(x: 458.93, y: 493.34))
        path40.addCurve(to: CGPoint(x: 459.1, y: 493.83),
                       control1: CGPoint(x: 458.93, y: 493.62),
                       control2: CGPoint(x: 458.98, y: 493.74))
        path40.addCurve(to: CGPoint(x: 460.16, y: 494.23),
                       control1: CGPoint(x: 459.24, y: 493.96),
                       control2: CGPoint(x: 459.59, y: 494.09))
        path40.addCurve(to: CGPoint(x: 461.4, y: 494.65),
                       control1: CGPoint(x: 460.72, y: 494.36),
                       control2: CGPoint(x: 461.13, y: 494.5))
        path40.addCurve(to: CGPoint(x: 462.03, y: 495.23),
                       control1: CGPoint(x: 461.67, y: 494.79),
                       control2: CGPoint(x: 461.88, y: 494.99))
        path40.addCurve(to: CGPoint(x: 462.25, y: 496.15),
                       control1: CGPoint(x: 462.18, y: 495.48),
                       control2: CGPoint(x: 462.25, y: 495.79))
        path40.addCurve(to: CGPoint(x: 461.97, y: 497.07),
                       control1: CGPoint(x: 462.25, y: 496.48),
                       control2: CGPoint(x: 462.15, y: 496.78))
        path40.addCurve(to: CGPoint(x: 461.19, y: 497.7),
                       control1: CGPoint(x: 461.79, y: 497.35),
                       control2: CGPoint(x: 461.53, y: 497.56))
        path40.addCurve(to: CGPoint(x: 459.94, y: 497.9),
                       control1: CGPoint(x: 460.86, y: 497.84),
                       control2: CGPoint(x: 460.44, y: 497.9))
        path40.addCurve(to: CGPoint(x: 458.28, y: 497.39),
                       control1: CGPoint(x: 459.22, y: 497.9),
                       control2: CGPoint(x: 458.67, y: 497.72))
        path40.addCurve(to: CGPoint(x: 457.6, y: 495.92),
                       control1: CGPoint(x: 457.89, y: 497.05),
                       control2: CGPoint(x: 457.67, y: 496.56))
        path40.closeSubpath()
        ctx.addPath(path40)
        ctx.fillPath()
        let path41 = CGMutablePath()
        path41.move(to: CGPoint(x: 464.49, y: 498.21))
        path41.addLine(to: CGPoint(x: 465.36, y: 493.53))
        path41.addLine(to: CGPoint(x: 463.69, y: 493.22))
        path41.addLine(to: CGPoint(x: 463.87, y: 492.27))
        path41.addLine(to: CGPoint(x: 468.34, y: 493.1))
        path41.addLine(to: CGPoint(x: 468.16, y: 494.05))
        path41.addLine(to: CGPoint(x: 466.5, y: 493.74))
        path41.addLine(to: CGPoint(x: 465.62, y: 498.42))
        path41.closeSubpath()
        ctx.addPath(path41)
        ctx.fillPath()
        let path42 = CGMutablePath()
        path42.move(to: CGPoint(x: 472.86, y: 500.74))
        path42.addLine(to: CGPoint(x: 471.68, y: 500.3))
        path42.addLine(to: CGPoint(x: 471.67, y: 498.9))
        path42.addLine(to: CGPoint(x: 469.53, y: 498.1))
        path42.addLine(to: CGPoint(x: 468.63, y: 499.16))
        path42.addLine(to: CGPoint(x: 467.48, y: 498.73))
        path42.addLine(to: CGPoint(x: 471.58, y: 494.14))
        path42.addLine(to: CGPoint(x: 472.72, y: 494.57))
        path42.closeSubpath()
        path42.move(to: CGPoint(x: 471.66, y: 497.87))
        path42.addLine(to: CGPoint(x: 471.67, y: 495.6))
        path42.addLine(to: CGPoint(x: 470.2, y: 497.32))
        path42.closeSubpath()
        ctx.addPath(path42)
        ctx.fillPath()
        let path43 = CGMutablePath()
        path43.move(to: CGPoint(x: 473.41, y: 501.06))
        path43.addLine(to: CGPoint(x: 476.39, y: 496.17))
        path43.addLine(to: CGPoint(x: 478.47, y: 497.44))
        path43.addCurve(to: CGPoint(x: 479.53, y: 498.27),
                       control1: CGPoint(x: 478.99, y: 497.76),
                       control2: CGPoint(x: 479.35, y: 498.04))
        path43.addCurve(to: CGPoint(x: 479.81, y: 499.08),
                       control1: CGPoint(x: 479.71, y: 498.5),
                       control2: CGPoint(x: 479.81, y: 498.77))
        path43.addCurve(to: CGPoint(x: 479.56, y: 499.98),
                       control1: CGPoint(x: 479.82, y: 499.4),
                       control2: CGPoint(x: 479.73, y: 499.7))
        path43.addCurve(to: CGPoint(x: 478.68, y: 500.7),
                       control1: CGPoint(x: 479.33, y: 500.35),
                       control2: CGPoint(x: 479.04, y: 500.59))
        path43.addCurve(to: CGPoint(x: 477.44, y: 500.56),
                       control1: CGPoint(x: 478.32, y: 500.8),
                       control2: CGPoint(x: 477.9, y: 500.76))
        path43.addCurve(to: CGPoint(x: 477.71, y: 501.29),
                       control1: CGPoint(x: 477.57, y: 500.81),
                       control2: CGPoint(x: 477.67, y: 501.06))
        path43.addCurve(to: CGPoint(x: 477.79, y: 502.43),
                       control1: CGPoint(x: 477.76, y: 501.52),
                       control2: CGPoint(x: 477.79, y: 501.9))
        path43.addLine(to: CGPoint(x: 477.81, y: 503.74))
        path43.addLine(to: CGPoint(x: 476.63, y: 503.02))
        path43.addLine(to: CGPoint(x: 476.56, y: 501.53))
        path43.addCurve(to: CGPoint(x: 476.48, y: 500.49),
                       control1: CGPoint(x: 476.54, y: 500.99),
                       control2: CGPoint(x: 476.51, y: 500.65))
        path43.addCurve(to: CGPoint(x: 476.31, y: 500.11),
                       control1: CGPoint(x: 476.45, y: 500.33),
                       control2: CGPoint(x: 476.39, y: 500.21))
        path43.addCurve(to: CGPoint(x: 475.84, y: 499.75),
                       control1: CGPoint(x: 476.22, y: 500),
                       control2: CGPoint(x: 476.07, y: 499.89))
        path43.addLine(to: CGPoint(x: 475.64, y: 499.62))
        path43.addLine(to: CGPoint(x: 474.4, y: 501.67))
        path43.closeSubpath()
        path43.move(to: CGPoint(x: 476.12, y: 498.84))
        path43.addLine(to: CGPoint(x: 476.85, y: 499.29))
        path43.addCurve(to: CGPoint(x: 477.77, y: 499.77),
                       control1: CGPoint(x: 477.32, y: 499.58),
                       control2: CGPoint(x: 477.63, y: 499.74))
        path43.addCurve(to: CGPoint(x: 478.18, y: 499.73),
                       control1: CGPoint(x: 477.92, y: 499.8),
                       control2: CGPoint(x: 478.05, y: 499.79))
        path43.addCurve(to: CGPoint(x: 478.5, y: 499.43),
                       control1: CGPoint(x: 478.3, y: 499.68),
                       control2: CGPoint(x: 478.41, y: 499.57))
        path43.addCurve(to: CGPoint(x: 478.61, y: 498.95),
                       control1: CGPoint(x: 478.6, y: 499.26),
                       control2: CGPoint(x: 478.64, y: 499.1))
        path43.addCurve(to: CGPoint(x: 478.36, y: 498.53),
                       control1: CGPoint(x: 478.59, y: 498.79),
                       control2: CGPoint(x: 478.5, y: 498.65))
        path43.addCurve(to: CGPoint(x: 477.65, y: 498.07),
                       control1: CGPoint(x: 478.28, y: 498.47),
                       control2: CGPoint(x: 478.05, y: 498.32))
        path43.addLine(to: CGPoint(x: 476.88, y: 497.6))
        path43.closeSubpath()
        ctx.addPath(path43)
        ctx.fillPath()
        let path44 = CGMutablePath()
        path44.move(to: CGPoint(x: 479.24, y: 505.04))
        path44.addLine(to: CGPoint(x: 482.37, y: 501.47))
        path44.addLine(to: CGPoint(x: 481.1, y: 500.35))
        path44.addLine(to: CGPoint(x: 481.73, y: 499.62))
        path44.addLine(to: CGPoint(x: 485.16, y: 502.62))
        path44.addLine(to: CGPoint(x: 484.52, y: 503.35))
        path44.addLine(to: CGPoint(x: 483.24, y: 502.23))
        path44.addLine(to: CGPoint(x: 480.11, y: 505.81))
        path44.closeSubpath()
        ctx.addPath(path44)
        ctx.fillPath()
        ctx.saveGState()
        let transform23 = CGAffineTransform(
          a: 1.1697253,
          b: 0.0,
          c: 0.0,
          d: 1.3433058,
          tx: -24.4169,
          ty: -206.46918
        )
        ctx.concatenate(transform23)
        ctx.setFillColor(color18)
        ctx.addPath(path30)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path30)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform24 = CGAffineTransform(
          a: 1.1404276,
          b: 0.0,
          c: 0.0,
          d: 1.2848063,
          tx: 284.32098,
          ty: -72.70919
        )
        ctx.concatenate(transform24)
        ctx.setFillColor(color18)
        ctx.addPath(path30)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path30)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.translateBy(x: 3.03, y: -2.02)
        let color28 = CGColor(colorSpace: rgb, components: [0.69, 0.69, 0.69, 1])!
        ctx.setFillColor(color28)
        let path45 = CGMutablePath()
        path45.move(to: CGPoint(x: 171.35, y: 514.96))
        path45.addCurve(to: CGPoint(x: 169.39, y: 516.6),
                       control1: CGPoint(x: 171.35, y: 515.87),
                       control2: CGPoint(x: 170.47, y: 516.6))
        path45.addCurve(to: CGPoint(x: 167.43, y: 514.96),
                       control1: CGPoint(x: 168.31, y: 516.6),
                       control2: CGPoint(x: 167.43, y: 515.87))
        path45.addCurve(to: CGPoint(x: 169.39, y: 513.32),
                       control1: CGPoint(x: 167.43, y: 514.05),
                       control2: CGPoint(x: 168.31, y: 513.32))
        path45.addCurve(to: CGPoint(x: 171.35, y: 514.96),
                       control1: CGPoint(x: 170.47, y: 513.32),
                       control2: CGPoint(x: 171.35, y: 514.05))
        path45.closeSubpath()
        ctx.addPath(path45)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path45)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.translateBy(x: 36.37, y: 24.88)
        ctx.setFillColor(color28)
        ctx.addPath(path45)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path45)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.translateBy(x: 3.28, y: 48.99)
        ctx.setFillColor(color28)
        ctx.addPath(path45)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path45)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.translateBy(x: -27.4, y: 23.11)
        ctx.setFillColor(color28)
        ctx.addPath(path45)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path45)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.translateBy(x: 309.11, y: 102.28)
        let color29 = CGColor(colorSpace: rgb, components: [0.686, 0.686, 0.686, 1])!
        ctx.setFillColor(color29)
        ctx.addPath(path45)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path45)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.translateBy(x: 339.29, y: 126.52)
        let color30 = CGColor(colorSpace: rgb, components: [0.592, 0.592, 0.592, 1])!
        ctx.setFillColor(color30)
        ctx.addPath(path45)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path45)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.translateBy(x: 308.35, y: 148.24)
        ctx.setFillColor(color28)
        ctx.addPath(path45)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path45)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.translateBy(x: 279.69, y: 124.88)
        ctx.setFillColor(color28)
        ctx.addPath(path45)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path45)
        ctx.strokePath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.scaleBy(x: 1.02, y: 0.98)
        ctx.setFillColor(color11)
        let path46 = CGMutablePath()
        path46.move(to: CGPoint(x: 580.25, y: 576.29))
        path46.addLine(to: CGPoint(x: 570.59, y: 576.29))
        path46.addLine(to: CGPoint(x: 569.07, y: 580.65))
        path46.addLine(to: CGPoint(x: 562.87, y: 580.65))
        path46.addLine(to: CGPoint(x: 571.73, y: 556.71))
        path46.addLine(to: CGPoint(x: 579.09, y: 556.71))
        path46.addLine(to: CGPoint(x: 587.96, y: 580.65))
        path46.addLine(to: CGPoint(x: 581.75, y: 580.65))
        path46.closeSubpath()
        path46.move(to: CGPoint(x: 572.13, y: 571.85))
        path46.addLine(to: CGPoint(x: 578.69, y: 571.85))
        path46.addLine(to: CGPoint(x: 575.42, y: 562.32))
        path46.closeSubpath()
        ctx.addPath(path46)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform25 = CGAffineTransform(
          a: 1.0166235,
          b: 0.0,
          c: 0.0,
          d: 0.98364836,
          tx: -0.34723994,
          ty: 0.25253814
        )
        ctx.concatenate(transform25)
        ctx.setFillColor(color9)
        let path47 = CGMutablePath()
        path47.move(to: CGPoint(x: 528.01, y: 524.78))
        path47.addLine(to: CGPoint(x: 536.32, y: 537))
        path47.addLine(to: CGPoint(x: 529.89, y: 537))
        path47.addLine(to: CGPoint(x: 524.29, y: 528.83))
        path47.addLine(to: CGPoint(x: 518.74, y: 537))
        path47.addLine(to: CGPoint(x: 512.28, y: 537))
        path47.addLine(to: CGPoint(x: 520.59, y: 524.78))
        path47.addLine(to: CGPoint(x: 512.6, y: 513.06))
        path47.addLine(to: CGPoint(x: 519.05, y: 513.06))
        path47.addLine(to: CGPoint(x: 524.29, y: 520.78))
        path47.addLine(to: CGPoint(x: 529.52, y: 513.06))
        path47.addLine(to: CGPoint(x: 536, y: 513.06))
        path47.closeSubpath()
        ctx.addPath(path47)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform26 = CGAffineTransform(
          a: 1.0166235,
          b: 0.0,
          c: 0.0,
          d: 0.98364836,
          tx: -1.0732871,
          ty: 0.0
        )
        ctx.concatenate(transform26)
        ctx.setFillColor(color13)
        let path48 = CGMutablePath()
        path48.move(to: CGPoint(x: 569.22, y: 466.72))
        path48.addLine(to: CGPoint(x: 575.97, y: 466.72))
        path48.addLine(to: CGPoint(x: 581.42, y: 475.25))
        path48.addLine(to: CGPoint(x: 586.87, y: 466.72))
        path48.addLine(to: CGPoint(x: 593.64, y: 466.72))
        path48.addLine(to: CGPoint(x: 584.51, y: 480.58))
        path48.addLine(to: CGPoint(x: 584.51, y: 490.66))
        path48.addLine(to: CGPoint(x: 578.34, y: 490.66))
        path48.addLine(to: CGPoint(x: 578.34, y: 480.58))
        path48.closeSubpath()
        ctx.addPath(path48)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform27 = CGAffineTransform(
          a: 1.0165333,
          b: 0.01354401,
          c: -0.0131047,
          d: 0.98356104,
          tx: -0.5682108,
          ty: -0.37880722
        )
        ctx.concatenate(transform27)
        ctx.setFillColor(color15)
        let path49 = CGMutablePath()
        path49.move(to: CGPoint(x: 640.91, y: 510.45))
        path49.addCurve(to: CGPoint(x: 643.16, y: 509.8),
                       control1: CGPoint(x: 641.9, y: 510.45),
                       control2: CGPoint(x: 642.65, y: 510.23))
        path49.addCurve(to: CGPoint(x: 643.93, y: 507.87),
                       control1: CGPoint(x: 643.68, y: 509.36),
                       control2: CGPoint(x: 643.93, y: 508.72))
        path49.addCurve(to: CGPoint(x: 643.16, y: 505.95),
                       control1: CGPoint(x: 643.93, y: 507.03),
                       control2: CGPoint(x: 643.68, y: 506.39))
        path49.addCurve(to: CGPoint(x: 640.91, y: 505.29),
                       control1: CGPoint(x: 642.65, y: 505.51),
                       control2: CGPoint(x: 641.9, y: 505.29))
        path49.addLine(to: CGPoint(x: 637.43, y: 505.29))
        path49.addLine(to: CGPoint(x: 637.43, y: 510.45))
        path49.closeSubpath()
        path49.move(to: CGPoint(x: 641.12, y: 521.11))
        path49.addCurve(to: CGPoint(x: 643.97, y: 520.31),
                       control1: CGPoint(x: 642.39, y: 521.11),
                       control2: CGPoint(x: 643.34, y: 520.85))
        path49.addCurve(to: CGPoint(x: 644.93, y: 517.9),
                       control1: CGPoint(x: 644.61, y: 519.78),
                       control2: CGPoint(x: 644.93, y: 518.97))
        path49.addCurve(to: CGPoint(x: 643.98, y: 515.52),
                       control1: CGPoint(x: 644.93, y: 516.84),
                       control2: CGPoint(x: 644.61, y: 516.05))
        path49.addCurve(to: CGPoint(x: 641.12, y: 514.73),
                       control1: CGPoint(x: 643.35, y: 514.99),
                       control2: CGPoint(x: 642.4, y: 514.73))
        path49.addLine(to: CGPoint(x: 637.43, y: 514.73))
        path49.addLine(to: CGPoint(x: 637.43, y: 521.11))
        path49.closeSubpath()
        path49.move(to: CGPoint(x: 646.97, y: 512.34))
        path49.addCurve(to: CGPoint(x: 650.11, y: 514.52),
                       control1: CGPoint(x: 648.32, y: 512.74),
                       control2: CGPoint(x: 649.36, y: 513.46))
        path49.addCurve(to: CGPoint(x: 651.22, y: 518.4),
                       control1: CGPoint(x: 650.85, y: 515.57),
                       control2: CGPoint(x: 651.22, y: 516.87))
        path49.addCurve(to: CGPoint(x: 648.83, y: 523.66),
                       control1: CGPoint(x: 651.22, y: 520.76),
                       control2: CGPoint(x: 650.42, y: 522.51))
        path49.addCurve(to: CGPoint(x: 641.58, y: 525.39),
                       control1: CGPoint(x: 647.24, y: 524.82),
                       control2: CGPoint(x: 644.82, y: 525.39))
        path49.addLine(to: CGPoint(x: 631.14, y: 525.39))
        path49.addLine(to: CGPoint(x: 631.14, y: 501.01))
        path49.addLine(to: CGPoint(x: 640.58, y: 501.01))
        path49.addCurve(to: CGPoint(x: 647.94, y: 502.54),
                       control1: CGPoint(x: 643.97, y: 501.01),
                       control2: CGPoint(x: 646.42, y: 501.52))
        path49.addCurve(to: CGPoint(x: 650.22, y: 507.46),
                       control1: CGPoint(x: 649.46, y: 503.57),
                       control2: CGPoint(x: 650.22, y: 505.21))
        path49.addCurve(to: CGPoint(x: 649.39, y: 510.49),
                       control1: CGPoint(x: 650.22, y: 508.65),
                       control2: CGPoint(x: 649.94, y: 509.66))
        path49.addCurve(to: CGPoint(x: 646.97, y: 512.34),
                       control1: CGPoint(x: 648.83, y: 511.32),
                       control2: CGPoint(x: 648.03, y: 511.94))
        path49.closeSubpath()
        ctx.addPath(path49)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.setFillColor(color6)
        let path50 = CGMutablePath()
        path50.move(to: CGPoint(x: 111.96, y: 401.29))
        path50.addCurve(to: CGPoint(x: 125.54, y: 385.58),
                       control1: CGPoint(x: 111.96, y: 401.29),
                       control2: CGPoint(x: 111.25, y: 391.65))
        path50.addCurve(to: CGPoint(x: 168.57, y: 368.43),
                       control1: CGPoint(x: 139.82, y: 379.51),
                       control2: CGPoint(x: 151.96, y: 371.83))
        path50.addCurve(to: CGPoint(x: 203.21, y: 364.33),
                       control1: CGPoint(x: 185.18, y: 365.04),
                       control2: CGPoint(x: 195.18, y: 364.15))
        path50.addCurve(to: CGPoint(x: 225.36, y: 365.93),
                       control1: CGPoint(x: 211.25, y: 364.51),
                       control2: CGPoint(x: 223.93, y: 365.4))
        path50.addCurve(to: CGPoint(x: 225.41, y: 370.98),
                       control1: CGPoint(x: 226.79, y: 366.47),
                       control2: CGPoint(x: 225.88, y: 369.22))
        path50.addCurve(to: CGPoint(x: 224.21, y: 373.98),
                       control1: CGPoint(x: 225.05, y: 372.35),
                       control2: CGPoint(x: 224.21, y: 373.98))
        path50.addLine(to: CGPoint(x: 223.36, y: 377.69))
        path50.addLine(to: CGPoint(x: 223.17, y: 380.94))
        path50.addCurve(to: CGPoint(x: 185.4, y: 382.46),
                       control1: CGPoint(x: 223.17, y: 380.94),
                       control2: CGPoint(x: 218.94, y: 376.49))
        path50.addCurve(to: CGPoint(x: 153.36, y: 388.5),
                       control1: CGPoint(x: 154.08, y: 388.04),
                       control2: CGPoint(x: 153.36, y: 388.5))
        path50.addCurve(to: CGPoint(x: 135.49, y: 394.34),
                       control1: CGPoint(x: 153.36, y: 388.5),
                       control2: CGPoint(x: 141.87, y: 391.57))
        path50.addCurve(to: CGPoint(x: 118.04, y: 399.61),
                       control1: CGPoint(x: 134.21, y: 394.89),
                       control2: CGPoint(x: 118.04, y: 399.61))
        path50.addCurve(to: CGPoint(x: 111.96, y: 401.29),
                       control1: CGPoint(x: 115.78, y: 400.16),
                       control2: CGPoint(x: 113.69, y: 401.2))
        path50.closeSubpath()
        ctx.addPath(path50)
        ctx.fillPath()
        ctx.addPath(path50)
        ctx.strokePath()
        ctx.saveGState()
        let transform28 = CGAffineTransform(
          a: 1.3107349,
          b: -0.08809376,
          c: 0.05104557,
          d: 0.7595,
          tx: 0.0,
          ty: 0.0
        )
        ctx.concatenate(transform28)
        let color31 = CGColor(colorSpace: rgb, components: [0.733, 0.733, 0.733, 1])!
        ctx.setFillColor(color31)
        let path51 = CGMutablePath()
        path51.move(to: CGPoint(x: 116.87, y: 509.3))
        path51.addLine(to: CGPoint(x: 116.87, y: 500.6))
        path51.addLine(to: CGPoint(x: 118.64, y: 500.6))
        path51.addLine(to: CGPoint(x: 118.64, y: 507.83))
        path51.addLine(to: CGPoint(x: 123.05, y: 507.83))
        path51.addLine(to: CGPoint(x: 123.05, y: 509.3))
        path51.closeSubpath()
        ctx.addPath(path51)
        ctx.fillPath()
        let path52 = CGMutablePath()
        path52.move(to: CGPoint(x: 124.32, y: 500.53))
        path52.addLine(to: CGPoint(x: 127.83, y: 500.53))
        path52.addCurve(to: CGPoint(x: 129.38, y: 500.62),
                       control1: CGPoint(x: 128.52, y: 500.53),
                       control2: CGPoint(x: 129.04, y: 500.56))
        path52.addCurve(to: CGPoint(x: 130.3, y: 500.98),
                       control1: CGPoint(x: 129.72, y: 500.68),
                       control2: CGPoint(x: 130.03, y: 500.8))
        path52.addCurve(to: CGPoint(x: 130.97, y: 501.71),
                       control1: CGPoint(x: 130.57, y: 501.16),
                       control2: CGPoint(x: 130.79, y: 501.41))
        path52.addCurve(to: CGPoint(x: 131.24, y: 502.74),
                       control1: CGPoint(x: 131.15, y: 502.02),
                       control2: CGPoint(x: 131.24, y: 502.36))
        path52.addCurve(to: CGPoint(x: 130.91, y: 503.87),
                       control1: CGPoint(x: 131.24, y: 503.15),
                       control2: CGPoint(x: 131.13, y: 503.53))
        path52.addCurve(to: CGPoint(x: 130.01, y: 504.64),
                       control1: CGPoint(x: 130.69, y: 504.21),
                       control2: CGPoint(x: 130.39, y: 504.47))
        path52.addCurve(to: CGPoint(x: 131.24, y: 505.44),
                       control1: CGPoint(x: 130.54, y: 504.8),
                       control2: CGPoint(x: 130.95, y: 505.06))
        path52.addCurve(to: CGPoint(x: 131.67, y: 506.76),
                       control1: CGPoint(x: 131.53, y: 505.81),
                       control2: CGPoint(x: 131.67, y: 506.25))
        path52.addCurve(to: CGPoint(x: 131.39, y: 507.92),
                       control1: CGPoint(x: 131.67, y: 507.16),
                       control2: CGPoint(x: 131.58, y: 507.55))
        path52.addCurve(to: CGPoint(x: 130.63, y: 508.83),
                       control1: CGPoint(x: 131.21, y: 508.3),
                       control2: CGPoint(x: 130.95, y: 508.6))
        path52.addCurve(to: CGPoint(x: 129.44, y: 509.24),
                       control1: CGPoint(x: 130.31, y: 509.05),
                       control2: CGPoint(x: 129.91, y: 509.19))
        path52.addCurve(to: CGPoint(x: 127.31, y: 509.3),
                       control1: CGPoint(x: 129.15, y: 509.27),
                       control2: CGPoint(x: 128.44, y: 509.3))
        path52.addLine(to: CGPoint(x: 124.32, y: 509.3))
        path52.closeSubpath()
        path52.move(to: CGPoint(x: 126.09, y: 501.99))
        path52.addLine(to: CGPoint(x: 126.09, y: 504.02))
        path52.addLine(to: CGPoint(x: 127.25, y: 504.02))
        path52.addCurve(to: CGPoint(x: 128.54, y: 503.99),
                       control1: CGPoint(x: 127.94, y: 504.02),
                       control2: CGPoint(x: 128.37, y: 504.01))
        path52.addCurve(to: CGPoint(x: 129.26, y: 503.68),
                       control1: CGPoint(x: 128.84, y: 503.95),
                       control2: CGPoint(x: 129.08, y: 503.85))
        path52.addCurve(to: CGPoint(x: 129.52, y: 502.99),
                       control1: CGPoint(x: 129.43, y: 503.5),
                       control2: CGPoint(x: 129.52, y: 503.27))
        path52.addCurve(to: CGPoint(x: 129.29, y: 502.33),
                       control1: CGPoint(x: 129.52, y: 502.72),
                       control2: CGPoint(x: 129.44, y: 502.5))
        path52.addCurve(to: CGPoint(x: 128.62, y: 502.02),
                       control1: CGPoint(x: 129.14, y: 502.16),
                       control2: CGPoint(x: 128.92, y: 502.06))
        path52.addCurve(to: CGPoint(x: 127.11, y: 501.99),
                       control1: CGPoint(x: 128.45, y: 502),
                       control2: CGPoint(x: 127.94, y: 501.99))
        path52.closeSubpath()
        path52.move(to: CGPoint(x: 126.09, y: 505.48))
        path52.addLine(to: CGPoint(x: 126.09, y: 507.83))
        path52.addLine(to: CGPoint(x: 127.73, y: 507.83))
        path52.addCurve(to: CGPoint(x: 128.95, y: 507.77),
                       control1: CGPoint(x: 128.37, y: 507.83),
                       control2: CGPoint(x: 128.78, y: 507.81))
        path52.addCurve(to: CGPoint(x: 129.59, y: 507.42),
                       control1: CGPoint(x: 129.21, y: 507.72),
                       control2: CGPoint(x: 129.43, y: 507.61))
        path52.addCurve(to: CGPoint(x: 129.84, y: 506.68),
                       control1: CGPoint(x: 129.76, y: 507.24),
                       control2: CGPoint(x: 129.84, y: 506.99))
        path52.addCurve(to: CGPoint(x: 129.65, y: 506.01),
                       control1: CGPoint(x: 129.84, y: 506.41),
                       control2: CGPoint(x: 129.78, y: 506.19))
        path52.addCurve(to: CGPoint(x: 129.09, y: 505.61),
                       control1: CGPoint(x: 129.52, y: 505.82),
                       control2: CGPoint(x: 129.34, y: 505.69))
        path52.addCurve(to: CGPoint(x: 127.52, y: 505.48),
                       control1: CGPoint(x: 128.85, y: 505.52),
                       control2: CGPoint(x: 128.33, y: 505.48))
        path52.closeSubpath()
        ctx.addPath(path52)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.scaleBy(x: 1.25, y: 0.8)
        ctx.setFillColor(color31)
        let path53 = CGMutablePath()
        path53.move(to: CGPoint(x: 148.98, y: 450.62))
        path53.addLine(to: CGPoint(x: 148.98, y: 442.34))
        path53.addLine(to: CGPoint(x: 150.66, y: 442.34))
        path53.addLine(to: CGPoint(x: 150.66, y: 449.21))
        path53.addLine(to: CGPoint(x: 154.85, y: 449.21))
        path53.addLine(to: CGPoint(x: 154.85, y: 450.62))
        path53.closeSubpath()
        ctx.addPath(path53)
        ctx.fillPath()
        let path54 = CGMutablePath()
        path54.move(to: CGPoint(x: 157.94, y: 450.62))
        path54.addLine(to: CGPoint(x: 157.94, y: 443.68))
        path54.addLine(to: CGPoint(x: 155.46, y: 443.68))
        path54.addLine(to: CGPoint(x: 155.46, y: 442.27))
        path54.addLine(to: CGPoint(x: 162.1, y: 442.27))
        path54.addLine(to: CGPoint(x: 162.1, y: 443.68))
        path54.addLine(to: CGPoint(x: 159.63, y: 443.68))
        path54.addLine(to: CGPoint(x: 159.63, y: 450.62))
        path54.closeSubpath()
        ctx.addPath(path54)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.saveGState()
        ctx.scaleBy(x: 1.25, y: 0.8)
        ctx.setFillColor(color31)
        let path55 = CGMutablePath()
        path55.move(to: CGPoint(x: 450.96, y: 450.94))
        path55.addLine(to: CGPoint(x: 450.96, y: 442.59))
        path55.addLine(to: CGPoint(x: 454.5, y: 442.59))
        path55.addCurve(to: CGPoint(x: 456.45, y: 442.82),
                       control1: CGPoint(x: 455.4, y: 442.59),
                       control2: CGPoint(x: 456.05, y: 442.67))
        path55.addCurve(to: CGPoint(x: 457.42, y: 443.62),
                       control1: CGPoint(x: 456.85, y: 442.97),
                       control2: CGPoint(x: 457.18, y: 443.24))
        path55.addCurve(to: CGPoint(x: 457.78, y: 444.93),
                       control1: CGPoint(x: 457.66, y: 444),
                       control2: CGPoint(x: 457.78, y: 444.44))
        path55.addCurve(to: CGPoint(x: 457.23, y: 446.49),
                       control1: CGPoint(x: 457.78, y: 445.56),
                       control2: CGPoint(x: 457.6, y: 446.08))
        path55.addCurve(to: CGPoint(x: 455.58, y: 447.26),
                       control1: CGPoint(x: 456.86, y: 446.89),
                       control2: CGPoint(x: 456.31, y: 447.15))
        path55.addCurve(to: CGPoint(x: 456.48, y: 447.96),
                       control1: CGPoint(x: 455.95, y: 447.47),
                       control2: CGPoint(x: 456.25, y: 447.7))
        path55.addCurve(to: CGPoint(x: 457.44, y: 449.31),
                       control1: CGPoint(x: 456.72, y: 448.21),
                       control2: CGPoint(x: 457.04, y: 448.66))
        path55.addLine(to: CGPoint(x: 458.46, y: 450.94))
        path55.addLine(to: CGPoint(x: 456.45, y: 450.94))
        path55.addLine(to: CGPoint(x: 455.23, y: 449.13))
        path55.addCurve(to: CGPoint(x: 454.34, y: 447.9),
                       control1: CGPoint(x: 454.8, y: 448.48),
                       control2: CGPoint(x: 454.5, y: 448.07))
        path55.addCurve(to: CGPoint(x: 453.83, y: 447.55),
                       control1: CGPoint(x: 454.18, y: 447.73),
                       control2: CGPoint(x: 454.01, y: 447.61))
        path55.addCurve(to: CGPoint(x: 452.98, y: 447.46),
                       control1: CGPoint(x: 453.65, y: 447.49),
                       control2: CGPoint(x: 453.37, y: 447.46))
        path55.addLine(to: CGPoint(x: 452.64, y: 447.46))
        path55.addLine(to: CGPoint(x: 452.64, y: 450.94))
        path55.closeSubpath()
        path55.move(to: CGPoint(x: 452.64, y: 446.13))
        path55.addLine(to: CGPoint(x: 453.89, y: 446.13))
        path55.addCurve(to: CGPoint(x: 455.4, y: 446.02),
                       control1: CGPoint(x: 454.7, y: 446.13),
                       control2: CGPoint(x: 455.2, y: 446.09))
        path55.addCurve(to: CGPoint(x: 455.88, y: 445.67),
                       control1: CGPoint(x: 455.61, y: 445.95),
                       control2: CGPoint(x: 455.76, y: 445.84))
        path55.addCurve(to: CGPoint(x: 456.05, y: 445.04),
                       control1: CGPoint(x: 455.99, y: 445.5),
                       control2: CGPoint(x: 456.05, y: 445.29))
        path55.addCurve(to: CGPoint(x: 455.82, y: 444.36),
                       control1: CGPoint(x: 456.05, y: 444.76),
                       control2: CGPoint(x: 455.97, y: 444.54))
        path55.addCurve(to: CGPoint(x: 455.19, y: 444.04),
                       control1: CGPoint(x: 455.67, y: 444.19),
                       control2: CGPoint(x: 455.46, y: 444.08))
        path55.addCurve(to: CGPoint(x: 453.96, y: 444.01),
                       control1: CGPoint(x: 455.05, y: 444.02),
                       control2: CGPoint(x: 454.64, y: 444.01))
        path55.addLine(to: CGPoint(x: 452.64, y: 444.01))
        path55.closeSubpath()
        ctx.addPath(path55)
        ctx.fillPath()
        let path56 = CGMutablePath()
        path56.move(to: CGPoint(x: 461.26, y: 450.94))
        path56.addLine(to: CGPoint(x: 461.26, y: 444.01))
        path56.addLine(to: CGPoint(x: 458.78, y: 444.01))
        path56.addLine(to: CGPoint(x: 458.78, y: 442.59))
        path56.addLine(to: CGPoint(x: 465.42, y: 442.59))
        path56.addLine(to: CGPoint(x: 465.42, y: 444.01))
        path56.addLine(to: CGPoint(x: 462.94, y: 444.01))
        path56.addLine(to: CGPoint(x: 462.94, y: 450.94))
        path56.closeSubpath()
        ctx.addPath(path56)
        ctx.fillPath()
        ctx.restoreGState()
        let path57 = CGMutablePath()
        path57.move(to: CGPoint(x: 645.97, y: 401.62))
        path57.addLine(to: CGPoint(x: 650.35, y: 401.35))
        path57.addCurve(to: CGPoint(x: 636.8, y: 385.64),
                       control1: CGPoint(x: 650.35, y: 401.35),
                       control2: CGPoint(x: 651.06, y: 391.71))
        path57.addCurve(to: CGPoint(x: 593.86, y: 368.5),
                       control1: CGPoint(x: 622.55, y: 379.57),
                       control2: CGPoint(x: 610.43, y: 371.89))
        path57.addCurve(to: CGPoint(x: 559.28, y: 364.4),
                       control1: CGPoint(x: 577.28, y: 365.11),
                       control2: CGPoint(x: 567.3, y: 364.22))
        path57.addCurve(to: CGPoint(x: 538.91, y: 365.87),
                       control1: CGPoint(x: 551.26, y: 364.57),
                       control2: CGPoint(x: 540.34, y: 365.34))
        path57.addCurve(to: CGPoint(x: 540.16, y: 375.64),
                       control1: CGPoint(x: 539.58, y: 369.28),
                       control2: CGPoint(x: 539.38, y: 372.89))
        path57.addLine(to: CGPoint(x: 541.04, y: 380.37))
        path57.addCurve(to: CGPoint(x: 577.2, y: 382.24),
                       control1: CGPoint(x: 541.04, y: 380.37),
                       control2: CGPoint(x: 543.51, y: 377.6))
        path57.addCurve(to: CGPoint(x: 613.8, y: 388.85),
                       control1: CGPoint(x: 610.88, y: 386.89),
                       control2: CGPoint(x: 613.8, y: 388.85))
        path57.addCurve(to: CGPoint(x: 625.44, y: 393.4),
                       control1: CGPoint(x: 613.8, y: 388.85),
                       control2: CGPoint(x: 624.12, y: 392.95))
        path57.addCurve(to: CGPoint(x: 645.97, y: 401.62),
                       control1: CGPoint(x: 628.56, y: 394.47),
                       control2: CGPoint(x: 645.97, y: 401.62))
        path57.closeSubpath()
        ctx.addPath(path57)
        ctx.fillPath()
        ctx.setLineWidth(1)
        ctx.addPath(path57)
        ctx.strokePath()
        ctx.saveGState()
        let transform29 = CGAffineTransform(
          a: 1.3128592,
          b: 0.04676647,
          c: -0.02709865,
          d: 0.760731,
          tx: 0.0,
          ty: 0.0
        )
        ctx.concatenate(transform29)
        ctx.setFillColor(color31)
        let path58 = CGMutablePath()
        path58.move(to: CGPoint(x: 441.5, y: 465.63))
        path58.addLine(to: CGPoint(x: 441.5, y: 456.86))
        path58.addLine(to: CGPoint(x: 445.23, y: 456.86))
        path58.addCurve(to: CGPoint(x: 447.27, y: 457.09),
                       control1: CGPoint(x: 446.16, y: 456.86),
                       control2: CGPoint(x: 446.84, y: 456.94))
        path58.addCurve(to: CGPoint(x: 448.29, y: 457.93),
                       control1: CGPoint(x: 447.69, y: 457.25),
                       control2: CGPoint(x: 448.03, y: 457.53))
        path58.addCurve(to: CGPoint(x: 448.67, y: 459.32),
                       control1: CGPoint(x: 448.55, y: 458.34),
                       control2: CGPoint(x: 448.67, y: 458.8))
        path58.addCurve(to: CGPoint(x: 448.09, y: 460.95),
                       control1: CGPoint(x: 448.67, y: 459.97),
                       control2: CGPoint(x: 448.48, y: 460.52))
        path58.addCurve(to: CGPoint(x: 446.36, y: 461.76),
                       control1: CGPoint(x: 447.71, y: 461.38),
                       control2: CGPoint(x: 447.13, y: 461.65))
        path58.addCurve(to: CGPoint(x: 447.31, y: 462.49),
                       control1: CGPoint(x: 446.74, y: 461.98),
                       control2: CGPoint(x: 447.06, y: 462.23))
        path58.addCurve(to: CGPoint(x: 448.31, y: 463.92),
                       control1: CGPoint(x: 447.55, y: 462.76),
                       control2: CGPoint(x: 447.89, y: 463.23))
        path58.addLine(to: CGPoint(x: 449.38, y: 465.63))
        path58.addLine(to: CGPoint(x: 447.27, y: 465.63))
        path58.addLine(to: CGPoint(x: 445.99, y: 463.72))
        path58.addCurve(to: CGPoint(x: 445.05, y: 462.43),
                       control1: CGPoint(x: 445.53, y: 463.04),
                       control2: CGPoint(x: 445.22, y: 462.61))
        path58.addCurve(to: CGPoint(x: 444.52, y: 462.07),
                       control1: CGPoint(x: 444.89, y: 462.25),
                       control2: CGPoint(x: 444.71, y: 462.13))
        path58.addCurve(to: CGPoint(x: 443.63, y: 461.97),
                       control1: CGPoint(x: 444.33, y: 462),
                       control2: CGPoint(x: 444.04, y: 461.97))
        path58.addLine(to: CGPoint(x: 443.27, y: 461.97))
        path58.addLine(to: CGPoint(x: 443.27, y: 465.63))
        path58.closeSubpath()
        path58.move(to: CGPoint(x: 443.27, y: 460.57))
        path58.addLine(to: CGPoint(x: 444.58, y: 460.57))
        path58.addCurve(to: CGPoint(x: 446.17, y: 460.46),
                       control1: CGPoint(x: 445.43, y: 460.57),
                       control2: CGPoint(x: 445.96, y: 460.53))
        path58.addCurve(to: CGPoint(x: 446.67, y: 460.09),
                       control1: CGPoint(x: 446.38, y: 460.39),
                       control2: CGPoint(x: 446.55, y: 460.26))
        path58.addCurve(to: CGPoint(x: 446.85, y: 459.43),
                       control1: CGPoint(x: 446.79, y: 459.91),
                       control2: CGPoint(x: 446.85, y: 459.69))
        path58.addCurve(to: CGPoint(x: 446.61, y: 458.71),
                       control1: CGPoint(x: 446.85, y: 459.13),
                       control2: CGPoint(x: 446.77, y: 458.9))
        path58.addCurve(to: CGPoint(x: 445.94, y: 458.37),
                       control1: CGPoint(x: 446.45, y: 458.53),
                       control2: CGPoint(x: 446.23, y: 458.42))
        path58.addCurve(to: CGPoint(x: 444.65, y: 458.34),
                       control1: CGPoint(x: 445.8, y: 458.35),
                       control2: CGPoint(x: 445.37, y: 458.34))
        path58.addLine(to: CGPoint(x: 443.27, y: 458.34))
        path58.closeSubpath()
        ctx.addPath(path58)
        ctx.fillPath()
        let path59 = CGMutablePath()
        path59.move(to: CGPoint(x: 450.35, y: 456.86))
        path59.addLine(to: CGPoint(x: 453.86, y: 456.86))
        path59.addCurve(to: CGPoint(x: 455.41, y: 456.94),
                       control1: CGPoint(x: 454.55, y: 456.86),
                       control2: CGPoint(x: 455.07, y: 456.89))
        path59.addCurve(to: CGPoint(x: 456.33, y: 457.31),
                       control1: CGPoint(x: 455.75, y: 457),
                       control2: CGPoint(x: 456.06, y: 457.12))
        path59.addCurve(to: CGPoint(x: 457, y: 458.04),
                       control1: CGPoint(x: 456.6, y: 457.49),
                       control2: CGPoint(x: 456.82, y: 457.73))
        path59.addCurve(to: CGPoint(x: 457.27, y: 459.06),
                       control1: CGPoint(x: 457.18, y: 458.34),
                       control2: CGPoint(x: 457.27, y: 458.69))
        path59.addCurve(to: CGPoint(x: 456.94, y: 460.2),
                       control1: CGPoint(x: 457.27, y: 459.48),
                       control2: CGPoint(x: 457.16, y: 459.85))
        path59.addCurve(to: CGPoint(x: 456.04, y: 460.97),
                       control1: CGPoint(x: 456.72, y: 460.54),
                       control2: CGPoint(x: 456.42, y: 460.8))
        path59.addCurve(to: CGPoint(x: 457.27, y: 461.76),
                       control1: CGPoint(x: 456.57, y: 461.12),
                       control2: CGPoint(x: 456.98, y: 461.39))
        path59.addCurve(to: CGPoint(x: 457.7, y: 463.09),
                       control1: CGPoint(x: 457.56, y: 462.14),
                       control2: CGPoint(x: 457.7, y: 462.58))
        path59.addCurve(to: CGPoint(x: 457.42, y: 464.25),
                       control1: CGPoint(x: 457.7, y: 463.48),
                       control2: CGPoint(x: 457.61, y: 463.87))
        path59.addCurve(to: CGPoint(x: 456.66, y: 465.15),
                       control1: CGPoint(x: 457.24, y: 464.63),
                       control2: CGPoint(x: 456.98, y: 464.93))
        path59.addCurve(to: CGPoint(x: 455.48, y: 465.57),
                       control1: CGPoint(x: 456.34, y: 465.38),
                       control2: CGPoint(x: 455.95, y: 465.52))
        path59.addCurve(to: CGPoint(x: 453.34, y: 465.63),
                       control1: CGPoint(x: 455.18, y: 465.6),
                       control2: CGPoint(x: 454.47, y: 465.62))
        path59.addLine(to: CGPoint(x: 450.35, y: 465.63))
        path59.closeSubpath()
        path59.move(to: CGPoint(x: 452.13, y: 458.32))
        path59.addLine(to: CGPoint(x: 452.13, y: 460.34))
        path59.addLine(to: CGPoint(x: 453.29, y: 460.34))
        path59.addCurve(to: CGPoint(x: 454.57, y: 460.31),
                       control1: CGPoint(x: 453.98, y: 460.34),
                       control2: CGPoint(x: 454.4, y: 460.33))
        path59.addCurve(to: CGPoint(x: 455.29, y: 460),
                       control1: CGPoint(x: 454.88, y: 460.28),
                       control2: CGPoint(x: 455.11, y: 460.17))
        path59.addCurve(to: CGPoint(x: 455.55, y: 459.32),
                       control1: CGPoint(x: 455.46, y: 459.83),
                       control2: CGPoint(x: 455.55, y: 459.6))
        path59.addCurve(to: CGPoint(x: 455.32, y: 458.65),
                       control1: CGPoint(x: 455.55, y: 459.04),
                       control2: CGPoint(x: 455.47, y: 458.82))
        path59.addCurve(to: CGPoint(x: 454.66, y: 458.35),
                       control1: CGPoint(x: 455.17, y: 458.49),
                       control2: CGPoint(x: 454.95, y: 458.38))
        path59.addCurve(to: CGPoint(x: 453.14, y: 458.32),
                       control1: CGPoint(x: 454.48, y: 458.33),
                       control2: CGPoint(x: 453.98, y: 458.32))
        path59.closeSubpath()
        path59.move(to: CGPoint(x: 452.13, y: 461.8))
        path59.addLine(to: CGPoint(x: 452.13, y: 464.15))
        path59.addLine(to: CGPoint(x: 453.76, y: 464.15))
        path59.addCurve(to: CGPoint(x: 454.98, y: 464.1),
                       control1: CGPoint(x: 454.4, y: 464.15),
                       control2: CGPoint(x: 454.81, y: 464.13))
        path59.addCurve(to: CGPoint(x: 455.62, y: 463.75),
                       control1: CGPoint(x: 455.24, y: 464.05),
                       control2: CGPoint(x: 455.46, y: 463.93))
        path59.addCurve(to: CGPoint(x: 455.87, y: 463),
                       control1: CGPoint(x: 455.79, y: 463.56),
                       control2: CGPoint(x: 455.87, y: 463.31))
        path59.addCurve(to: CGPoint(x: 455.68, y: 462.33),
                       control1: CGPoint(x: 455.87, y: 462.74),
                       control2: CGPoint(x: 455.81, y: 462.51))
        path59.addCurve(to: CGPoint(x: 455.13, y: 461.93),
                       control1: CGPoint(x: 455.55, y: 462.15),
                       control2: CGPoint(x: 455.37, y: 462.01))
        path59.addCurve(to: CGPoint(x: 453.56, y: 461.8),
                       control1: CGPoint(x: 454.88, y: 461.85),
                       control2: CGPoint(x: 454.36, y: 461.8))
        path59.closeSubpath()
        ctx.addPath(path59)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform30 = CGAffineTransform(
          a: 1.0166235,
          b: 0.0,
          c: 0.0,
          d: 0.98364836,
          tx: -0.12626907,
          ty: 1.2626907
        )
        ctx.concatenate(transform30)
        let color32 = CGColor(colorSpace: rgb, components: [0.522, 0.655, 1, 1])!
        ctx.setFillColor(color32)
        ctx.addPath(path47)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform31 = CGAffineTransform(
          a: 1.0166235,
          b: 0.0,
          c: 0.0,
          d: 0.98364836,
          tx: 0.17857143,
          ty: 1.6414979
        )
        ctx.concatenate(transform31)
        let color33 = CGColor(colorSpace: rgb, components: [1, 0.976, 0.757, 1])!
        ctx.setFillColor(color33)
        ctx.addPath(path48)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform32 = CGAffineTransform(
          a: 1.0166235,
          b: 0.0,
          c: 0.0,
          d: 0.98364836,
          tx: 0.85138696,
          ty: 1.43043
        )
        ctx.concatenate(transform32)
        let color34 = CGColor(colorSpace: rgb, components: [0.678, 1, 0.573, 1])!
        ctx.setFillColor(color34)
        ctx.addPath(path46)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.saveGState()
        let transform33 = CGAffineTransform(
          a: 1.0165333,
          b: 0.01354401,
          c: -0.0131047,
          d: 0.98356104,
          tx: 0.94701797,
          ty: 0.5050763
        )
        ctx.concatenate(transform33)
        let color35 = CGColor(colorSpace: rgb, components: [1, 0.631, 0.608, 1])!
        ctx.setFillColor(color35)
        ctx.addPath(path49)
        ctx.fillPath()
        ctx.restoreGState()
        ctx.setFillColor(color26)
        let path60 = CGMutablePath()
        path60.move(to: CGPoint(x: 278.4, y: 584.26))
        path60.addLine(to: CGPoint(x: 288.67, y: 584.75))
        path60.addCurve(to: CGPoint(x: 292.32, y: 589),
                       control1: CGPoint(x: 288.67, y: 584.75),
                       control2: CGPoint(x: 291.77, y: 585.97))
        path60.addCurve(to: CGPoint(x: 295.84, y: 603.22),
                       control1: CGPoint(x: 292.72, y: 591.24),
                       control2: CGPoint(x: 295.11, y: 602.61))
        path60.addCurve(to: CGPoint(x: 302.77, y: 609.91),
                       control1: CGPoint(x: 296.57, y: 603.83),
                       control2: CGPoint(x: 299.85, y: 609.54))
        path60.addCurve(to: CGPoint(x: 326.47, y: 614.16),
                       control1: CGPoint(x: 305.68, y: 610.27),
                       control2: CGPoint(x: 325.25, y: 613.07))
        path60.addCurve(to: CGPoint(x: 329.5, y: 619.99),
                       control1: CGPoint(x: 327.68, y: 615.25),
                       control2: CGPoint(x: 329.5, y: 619.99))
        path60.addLine(to: CGPoint(x: 329.75, y: 631.78))
        path60.addCurve(to: CGPoint(x: 327.92, y: 636.03),
                       control1: CGPoint(x: 329.75, y: 631.78),
                       control2: CGPoint(x: 329.02, y: 635.43))
        path60.addCurve(to: CGPoint(x: 306.66, y: 638.59),
                       control1: CGPoint(x: 326.83, y: 636.64),
                       control2: CGPoint(x: 306.66, y: 638.59))
        path60.addCurve(to: CGPoint(x: 299.49, y: 643.57),
                       control1: CGPoint(x: 306.66, y: 638.59),
                       control2: CGPoint(x: 300.58, y: 640.04))
        path60.addCurve(to: CGPoint(x: 295.23, y: 662.65),
                       control1: CGPoint(x: 298.39, y: 647.09),
                       control2: CGPoint(x: 296.21, y: 661.68))
        path60.addCurve(to: CGPoint(x: 290.13, y: 666.05),
                       control1: CGPoint(x: 294.26, y: 663.62),
                       control2: CGPoint(x: 292.92, y: 665.69))
        path60.addCurve(to: CGPoint(x: 273.6, y: 666.66),
                       control1: CGPoint(x: 287.33, y: 666.42),
                       control2: CGPoint(x: 273.6, y: 666.66))
        path60.addCurve(to: CGPoint(x: 267.28, y: 663.86),
                       control1: CGPoint(x: 273.6, y: 666.66),
                       control2: CGPoint(x: 268.5, y: 665.57))
        path60.addCurve(to: CGPoint(x: 263.03, y: 647.09),
                       control1: CGPoint(x: 266.07, y: 662.16),
                       control2: CGPoint(x: 263.03, y: 647.09))
        path60.addCurve(to: CGPoint(x: 255.01, y: 640.17),
                       control1: CGPoint(x: 263.03, y: 647.09),
                       control2: CGPoint(x: 261.08, y: 641.75))
        path60.addCurve(to: CGPoint(x: 234.11, y: 638.34),
                       control1: CGPoint(x: 248.93, y: 638.59),
                       control2: CGPoint(x: 237.51, y: 639.92))
        path60.addCurve(to: CGPoint(x: 228.15, y: 631.29),
                       control1: CGPoint(x: 230.7, y: 636.76),
                       control2: CGPoint(x: 228.39, y: 633.85))
        path60.addCurve(to: CGPoint(x: 227.3, y: 619.14),
                       control1: CGPoint(x: 227.91, y: 628.74),
                       control2: CGPoint(x: 226.81, y: 619.87))
        path60.addCurve(to: CGPoint(x: 231.43, y: 613.92),
                       control1: CGPoint(x: 227.79, y: 618.41),
                       control2: CGPoint(x: 230.1, y: 614.04))
        path60.addCurve(to: CGPoint(x: 253.19, y: 610.15),
                       control1: CGPoint(x: 232.77, y: 613.79),
                       control2: CGPoint(x: 251.12, y: 611.73))
        path60.addCurve(to: CGPoint(x: 260.11, y: 602.49),
                       control1: CGPoint(x: 255.25, y: 608.57),
                       control2: CGPoint(x: 259.87, y: 604.92))
        path60.addCurve(to: CGPoint(x: 262.36, y: 586.39),
                       control1: CGPoint(x: 260.36, y: 600.06),
                       control2: CGPoint(x: 261.42, y: 586.4))
        path60.addCurve(to: CGPoint(x: 264.38, y: 585.17),
                       control1: CGPoint(x: 263.13, y: 585.69),
                       control2: CGPoint(x: 263.78, y: 585.49))
        path60.addCurve(to: CGPoint(x: 271.41, y: 584.45),
                       control1: CGPoint(x: 265.39, y: 584.63),
                       control2: CGPoint(x: 268.03, y: 584.49))
        path60.addCurve(to: CGPoint(x: 278.4, y: 584.26),
                       control1: CGPoint(x: 275.67, y: 584.39),
                       control2: CGPoint(x: 278.4, y: 584.26))
        path60.closeSubpath()
        ctx.addPath(path60)
        ctx.fillPath()
        ctx.setLineWidth(0.96)
        ctx.addPath(path60)
        ctx.strokePath()
        ctx.restoreGState()
      }
    }
  }
}
