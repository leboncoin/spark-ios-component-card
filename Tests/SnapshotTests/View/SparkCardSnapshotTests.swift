//
//  SparkCardSnapshotTests.swift
//  SparkComponentCardSnapshotTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentCard
import SparkTheming
import SparkTheme

final class SparkCardSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = CardScenarioSnapshotTests.allCases
        self.loadScenarios(scenarios)
    }

    // MARK: - Scenarios

    private func loadScenarios(_ scenarios: [CardScenarioSnapshotTests]) {
        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = SparkCard(content: {
                    Content()
                })
                    .sparkTheme(self.theme)
                    .sparkCardIntent(configuration.intent)
                    .sparkCardIsBackdrop(configuration.isBackdrop)
                    .sparkCardIsHighlighted(configuration.isHighlighted)
                    .sparkCardIsPadding(configuration.isPadding)
                    .sparkCardVariant(configuration.variant)
                    .shadow(configuration, theme: self.theme)
                    .disabled(configuration.isDisabled)
                    .frame(
                        width: CardConstantsSnapshotsTests.size.width,
                        height: CardConstantsSnapshotsTests.size.height
                    )
                    .padding(20)
                    .background(.gray)
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

private struct Content: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "internaldrive")

                    Text("Welcome on Card")
                }

                Text("Nam eu sapien finibus, auctor purusan varius, sagittis turpis.")
                    .multilineTextAlignment(.leading)
            }

            Spacer()

            Button("Button", systemImage: "checkmark") {
            }
        }
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func shadow(
        _ configuration: CardConfigurationSnapshotTests,
        theme: any Theme
    ) -> some View {
        if configuration.isElevation {
            self.shadow(theme.elevation.dropShadow.medium)
        } else {
            self
        }
    }
}
