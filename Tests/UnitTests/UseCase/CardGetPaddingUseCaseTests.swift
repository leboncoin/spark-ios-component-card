//
//  CardGetPaddingUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

final class CardGetPaddingUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase: CardGetPaddingUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.useCase = CardGetPaddingUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func testExecuteWithPaddingTrue() {
        // GIVEN
        let isPadding = true

        // WHEN
        let padding = self.useCase.execute(
            theme: self.theme,
            isPadding: isPadding
        )

        // THEN
        XCTAssertEqual(padding, self.theme.layout.spacing.large)
    }

    func testExecuteWithPaddingFalse() {
        // GIVEN
        let isPadding = false

        // WHEN
        let padding = self.useCase.execute(
            theme: self.theme,
            isPadding: isPadding
        )

        // THEN
        XCTAssertEqual(padding, .zero)
    }
}
