//
//  UILayoutStore.swift
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 27/05/2026.
//


import Foundation
import CoreGraphics
import Combine

@MainActor
final class UILayoutStore: ObservableObject {
    @Published var isLeftPanelVisible: Bool {
        didSet {
            userDefaults.set(isLeftPanelVisible, forKey: Self.isLeftPanelVisibleKey)
        }
    }

    @Published var isRightPanelVisible: Bool {
        didSet {
            userDefaults.set(isRightPanelVisible, forKey: Self.isRightPanelVisibleKey)
        }
    }

    @Published var leftPanelWidth: CGFloat {
        didSet {
            let clamped = clampedLeftWidth(leftPanelWidth)
            if leftPanelWidth != clamped {
                leftPanelWidth = clamped
                return
            }

            userDefaults.set(Double(leftPanelWidth), forKey: Self.leftPanelWidthKey)
        }
    }

    @Published var rightPanelWidth: CGFloat {
        didSet {
            let clamped = clampedRightWidth(rightPanelWidth)
            if rightPanelWidth != clamped {
                rightPanelWidth = clamped
                return
            }

            userDefaults.set(Double(rightPanelWidth), forKey: Self.rightPanelWidthKey)
        }
    }

    let leftPanelMinimumWidth: CGFloat = 180
    let leftPanelMaximumWidth: CGFloat = 320

    let rightPanelMinimumWidth: CGFloat = 260
    let rightPanelMaximumWidth: CGFloat = 420

    let minimumCenterWidth: CGFloat = 520

    private let userDefaults: UserDefaults

    private static let isLeftPanelVisibleKey = "uiLayout.isLeftPanelVisible"
    private static let isRightPanelVisibleKey = "uiLayout.isRightPanelVisible"
    private static let leftPanelWidthKey = "uiLayout.leftPanelWidth"
    private static let rightPanelWidthKey = "uiLayout.rightPanelWidth"

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults

        let storedLeftVisible = userDefaults.object(forKey: Self.isLeftPanelVisibleKey) as? Bool
        let storedRightVisible = userDefaults.object(forKey: Self.isRightPanelVisibleKey) as? Bool

        let storedLeftWidth = userDefaults.object(forKey: Self.leftPanelWidthKey) as? Double
        let storedRightWidth = userDefaults.object(forKey: Self.rightPanelWidthKey) as? Double

        self.isLeftPanelVisible = storedLeftVisible ?? true
        self.isRightPanelVisible = storedRightVisible ?? true

        self.leftPanelWidth = CGFloat(storedLeftWidth ?? 220)
        self.rightPanelWidth = CGFloat(storedRightWidth ?? 320)

        self.leftPanelWidth = clampedLeftWidth(self.leftPanelWidth)
        self.rightPanelWidth = clampedRightWidth(self.rightPanelWidth)
    }

    func toggleLeftPanel() {
        isLeftPanelVisible.toggle()
    }

    func toggleRightPanel() {
        isRightPanelVisible.toggle()
    }

    func resetLayout() {
        isLeftPanelVisible = true
        isRightPanelVisible = true
        leftPanelWidth = 220
        rightPanelWidth = 320
    }

    func clampedLeftWidth(_ value: CGFloat) -> CGFloat {
        min(max(value, leftPanelMinimumWidth), leftPanelMaximumWidth)
    }

    func clampedRightWidth(_ value: CGFloat) -> CGFloat {
        min(max(value, rightPanelMinimumWidth), rightPanelMaximumWidth)
    }
}
