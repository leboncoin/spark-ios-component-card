//
//  CardGetDimUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

final class CardGetDimUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase: CardGetDimUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.useCase = CardGetDimUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func testExecuteWithEnabledTrue() {
        // GIVEN
        let isEnabled = true

        // WHEN
        let dim = self.useCase.execute(
            theme: self.theme,
            isEnabled: isEnabled
        )

        // THEN
        XCTAssertEqual(dim, self.theme.dims.none)
    }

    func testExecuteWithEnabledFalse() {
        // GIVEN
        let isEnabled = false

        // WHEN
        let dim = self.useCase.execute(
            theme: self.theme,
            isEnabled: isEnabled
        )

        // THEN
        XCTAssertEqual(dim, self.theme.dims.dim3)
    }
}
