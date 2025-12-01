//
//  ___COMPONENT_NAME___ConfigurationSnapshotTests.swift
//  SparkComponent___COMPONENT_NAME___SnapshotTests
//
//  Created by ___USERNAME___ on ___CURRENT_DATE___.
//  Copyright © ___CURRENT_YEAR___ Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponent___COMPONENT_NAME___
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

struct ___COMPONENT_NAME___ConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: ___COMPONENT_NAME___ScenarioSnapshotTests

    var intent: ___COMPONENT_NAME___Intent = .default
    // TODO: Add Others

    var modes: [ComponentSnapshotTestMode] = ComponentSnapshotTestConstants.Modes.default
    var sizes: [UIContentSizeCategory] = ComponentSnapshotTestConstants.Sizes.default

    // MARK: - Name

    var name: String {
        guard self.documentationName == nil else {
            return ""
        }

        return [
            "\(self.intent)" + "Intent",
            // TODO: Add Others
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }

    var testName: String {
        return if let documentationName {
            "___component_name____" + documentationName
        } else {
            self.scenario.rawValue
        }
    }

    var documentationName: String?
}
