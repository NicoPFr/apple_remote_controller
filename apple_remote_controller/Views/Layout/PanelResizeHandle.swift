//
//  PanelResizeHandle.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 27/05/2026.
//


import SwiftUI

struct PanelResizeHandle: View {
    let onChanged: (CGFloat) -> Void

    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(width: 10)
            .overlay(
                Capsule(style: .continuous)
                    .fill(Color.primary.opacity(0.10))
                    .frame(width: 4, height: 56)
            )
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 1)
                    .onChanged { value in
                        onChanged(value.translation.width)
                    }
            )
    }
}
