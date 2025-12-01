//
//  ___COMPONENT_NAME___ScenarioSnapshotTests.swift
//  SparkComponent___COMPONENT_NAME___SnapshotTests
//
//  Created by ___USERNAME___ on ___CURRENT_DATE___.
//  Copyright © ___CURRENT_YEAR___ Leboncoin. All rights reserved.
//

@testable import SparkComponent___COMPONENT_NAME___
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum ___COMPONENT_NAME___ScenarioSnapshotTests: String, CaseIterable {
    case test1
    // TODO: Add others
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [___COMPONENT_NAME___ConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description:
    // TODO: Add description
    ///
    /// Content:
    ///  - intents: all
    // TODO: Add content
    ///  - size: default
    ///  - content: default
    ///  - isBorder: default
    ///  - mode: all
    ///  - size: default
    private func test1() -> [___COMPONENT_NAME___ConfigurationSnapshotTests] {
        let intents = ___COMPONENT_NAME___Intent.allCases

        return intents.map { intent in
                .init(
                    scenario: self,
                    intent: intent,
                    modes: Constants.Modes.all
                )
        }
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [___COMPONENT_NAME___ConfigurationSnapshotTests] {
        var items: [___COMPONENT_NAME___ConfigurationSnapshotTests] = []

        // TODO: Add

        return items
    }
}
