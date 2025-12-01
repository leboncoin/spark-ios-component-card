//
//  Spark___COMPONENT_NAME___SnapshotTests.swift
//  SparkComponent___COMPONENT_NAME___SnapshotTests
//
//  Created by ___USERNAME___ on ___CURRENT_DATE___.
//  Copyright © ___CURRENT_YEAR___ Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponent___COMPONENT_NAME___
import SparkTheming
import SparkTheme

final class Spark___COMPONENT_NAME___SnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = ___COMPONENT_NAME___ScenarioSnapshotTests.allCases
        self.loadScenarios(scenarios)
    }

    // MARK: - Scenarios

    private func loadScenarios(_ scenarios: [___COMPONENT_NAME___ScenarioSnapshotTests]) {
        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = Spark___COMPONENT_NAME___()
                    .sparkTheme(self.theme)
                    .padding(20)
                    .background(.background)
                    .fixedSize()

                self.assertSnapshot(
                    matching: view,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName,
                    forDocumentation: scenario.isDocumentation
                )
            }
        }
    }
}
