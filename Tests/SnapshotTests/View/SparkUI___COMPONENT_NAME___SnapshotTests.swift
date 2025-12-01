//
//  SparkUI___COMPONENT_NAME___SnapshotTests.swift
//  SparkComponent___COMPONENT_NAME___SnapshotTests
//
//  Created by ___USERNAME___ on ___CURRENT_DATE___.
//  Copyright © ___CURRENT_YEAR___ Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import SparkComponent___COMPONENT_NAME___
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming
import SparkTheme

final class SparkUI___COMPONENT_NAME___SnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = ___COMPONENT_NAME___ScenarioSnapshotTests.allCases.filter {
            $0 != .documentation
        }

        for scenario in scenarios {
            let configurations = scenario.configuration()
            for configuration in configurations {
                let ___component_name___ = SparkUI___COMPONENT_NAME___(theme: self.theme)
                ___component_name___.intent = configuration.intent

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                backgroundView.addSubview(___component_name___)

                NSLayoutConstraint.stickEdges(
                    from: ___component_name___,
                    to: backgroundView,
                    insets: .init(all: 20)
                )

                self.assertSnapshot(
                    matching: backgroundView,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName
                )
            }
        }
    }
}
