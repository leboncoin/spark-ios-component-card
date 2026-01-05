//
//  CardScenarioSnapshotTests.swift
//  SparkComponentCardSnapshotTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@testable import SparkComponentCard
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheme
import UIKit
import SwiftUI

enum CardScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case test6
    case test7
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration() -> [CardConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .test3:
            return self.test3()
        case .test4:
            return self.test4()
        case .test5:
            return self.test5()
        case .test6:
            return self.test6()
        case .test7:
            return self.test7()
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: Test all intent
    ///
    /// Content:
    ///  - intent: all
    ///  - isBackdrop: default
    ///  - isHighlighted: default
    ///  - isPadding: default
    ///  - variant: default
    ///  - isElevation: default
    ///  - isDisabled: default
    ///  - mode: all
    ///  - size: default
    private func test1() -> [CardConfigurationSnapshotTests] {
        let intents = CardIntent.allCases

        return intents.map { intent in
                .init(
                    scenario: self,
                    intent: intent,
                    modes: Constants.Modes.all
                )
        }
    }

    /// Test 2
    ///
    /// Description: Test all variant and backdrop
    ///
    /// Content:
    ///  - intent: default
    ///  - isBackdrop: all
    ///  - isHighlighted: default
    ///  - isPadding: default
    ///  - variant: all
    ///  - isElevation: default
    ///  - isDisabled: default
    ///  - mode: default
    ///  - size: default
    private func test2() -> [CardConfigurationSnapshotTests] {
        let variants = CardVariant.allCases
        let isBackdrop = Bool.allCases

        return variants.flatMap { variant in
            isBackdrop.map { isBackdrop in
                    .init(
                        scenario: self,
                        intent: .main,
                        isBackdrop: isBackdrop,
                        variant: variant
                    )
            }
        }
    }

    /// Test 3
    ///
    /// Description: Test all isPadding
    ///
    /// Content:
    ///  - intent: default
    ///  - isBackdrop: default
    ///  - isHighlighted: default
    ///  - isPadding: all
    ///  - variant: default
    ///  - isElevation: default
    ///  - isDisabled: default
    ///  - mode: default
    ///  - size: default
    private func test3() -> [CardConfigurationSnapshotTests] {
        let isPadding = Bool.allCases

        return isPadding.map { isPadding in
                .init(
                    scenario: self,
                    isPadding: isPadding
                )
        }
    }

    /// Test 4
    ///
    /// Description: Test all isHighlighted
    ///
    /// Content:
    ///  - intent: default
    ///  - isBackdrop: default
    ///  - isHighlighted: all
    ///  - isPadding: default
    ///  - variant: all
    ///  - isElevation: default
    ///  - isDisabled: default
    ///  - mode: default
    ///  - size: default
    private func test4() -> [CardConfigurationSnapshotTests] {
        let variants = CardVariant.allCases
        let isHighlighted = Bool.allCases

        return variants.flatMap { variant in
            isHighlighted.map { isHighlighted in
                    .init(
                        scenario: self,
                        isHighlighted: isHighlighted,
                        variant: variant
                    )
            }
        }
    }

    /// Test 5
    ///
    /// Description: Test with isDisabled
    ///
    /// Content:
    ///  - intent: default
    ///  - isBackdrop: default
    ///  - isHighlighted: default
    ///  - isPadding: default
    ///  - variant: default
    ///  - isElevation: default
    ///  - isDisabled: all
    ///  - mode: default
    ///  - size: default
    private func test5() -> [CardConfigurationSnapshotTests] {
        let isDisabled = Bool.allCases

        return isDisabled.map { isDisabled in
                .init(
                    scenario: self,
                    intent: .main,
                    isDisabled: isDisabled
                )
        }
    }

    /// Test 6
    ///
    /// Description: Test with elevation
    ///
    /// Content:
    ///  - intent: default
    ///  - isBackdrop: default
    ///  - isHighlighted: default
    ///  - isPadding: default
    ///  - variant: default
    ///  - isElevation: all
    ///  - isDisabled: default
    ///  - mode: default
    ///  - size: default
    private func test6() -> [CardConfigurationSnapshotTests] {
        let isElevation = Bool.allCases

        return isElevation.map { isElevation in
                .init(
                    scenario: self,
                    isElevation: isElevation
                )
        }
    }

    /// Test 7
    ///
    /// Description: Test all A11Y size
    ///
    /// Content:
    ///  - intent: default
    ///  - isBackdrop: default
    ///  - isHighlighted: default
    ///  - isPadding: default
    ///  - variant: default
    ///  - isElevation: all
    ///  - isDisabled: default
    ///  - mode: default
    ///  - size: all
    private func test7() -> [CardConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                isBackdrop: true,
                sizes: Constants.Sizes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [CardConfigurationSnapshotTests] {
        var items: [CardConfigurationSnapshotTests] = []

        // Classic
        items.append(.init(
            scenario: self,
            documentationName: "_classic"
        ))

        // Backdrop
        items.append(.init(
            scenario: self,
            isBackdrop: true,
            isHighlighted: true,
            documentationName: "_with_backdrop"
        ))

        return items
    }
}
