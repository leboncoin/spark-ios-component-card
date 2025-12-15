//
//  CardConfigurationSnapshotTests.swift
//  SparkComponentCardSnapshotTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct CardConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: CardScenarioSnapshotTests

    var intent: CardIntent = .default
    var isBackdrop: Bool = false
    var isHighlighted: Bool = false
    var isPadding: Bool = true
    var variant: CardVariant = .default
    var isElevation: Bool = false
    var isDisabled: Bool = false

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.intent)" + "Intent",
            self.isBackdrop ? "backdropped" : nil,
            self.isHighlighted ? "highlighted" : nil,
            self.isPadding ? nil : "withoutPadding",
            "\(self.variant)" + "Variant",
            self.isElevation ? "elevated" : nil,
            self.isDisabled ? "disabled" : nil
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "card_" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}
