//
//  CardGetBorderUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

final class CardGetBorderUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase: CardGetBorderUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.useCase = CardGetBorderUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func testExecuteWithOutlinedVariantAndWithBackdrop() {
        // GIVEN
        let variant = CardVariant.outlined
        let isBackdrop = true

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isBackdrop: isBackdrop
        )

        // THEN
        XCTAssertEqual(border.width, self.theme.border.width.small)
        XCTAssertEqual(border.radius, self.theme.border.radius.large)
        XCTAssertEqual(border.contentTopRadius, self.theme.border.radius.medium)
    }

    func testExecuteWithOutlinedVariantAndWithoutBackdrop() {
        // GIVEN
        let variant = CardVariant.outlined
        let isBackdrop = false

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isBackdrop: isBackdrop
        )

        // THEN
        XCTAssertEqual(border.width, self.theme.border.width.small)
        XCTAssertEqual(border.radius, self.theme.border.radius.large)
        XCTAssertEqual(border.contentTopRadius, self.theme.border.radius.large)
    }

    func testExecuteWithFilledVariantAndWithBackdrop() {
        // GIVEN
        let variant = CardVariant.filled
        let isBackdrop = true

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isBackdrop: isBackdrop
        )

        // THEN
        XCTAssertEqual(border.width, 0)
        XCTAssertEqual(border.radius, self.theme.border.radius.large)
        XCTAssertEqual(border.contentTopRadius, self.theme.border.radius.medium)
    }

    func testExecuteWithFilledVariantAndWithoutBackdrop() {
        // GIVEN
        let variant = CardVariant.filled
        let isBackdrop = false

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isBackdrop: isBackdrop
        )

        // THEN
        XCTAssertEqual(border.width, 0)
        XCTAssertEqual(border.radius, self.theme.border.radius.large)
        XCTAssertEqual(border.contentTopRadius, self.theme.border.radius.large)
    }

    func testExecuteWithTintedVariantAndWithBackdrop() {
        // GIVEN
        let variant = CardVariant.tinted
        let isBackdrop = true

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isBackdrop: isBackdrop
        )

        // THEN
        XCTAssertEqual(border.width, 0)
        XCTAssertEqual(border.radius, self.theme.border.radius.large)
        XCTAssertEqual(border.contentTopRadius, self.theme.border.radius.medium)
    }

    func testExecuteWithTintedVariantAndWithoutBackdrop() {
        // GIVEN
        let variant = CardVariant.tinted
        let isBackdrop = false

        // WHEN
        let border = self.useCase.execute(
            theme: self.theme,
            variant: variant,
            isBackdrop: isBackdrop
        )

        // THEN
        XCTAssertEqual(border.width, 0)
        XCTAssertEqual(border.radius, self.theme.border.radius.large)
        XCTAssertEqual(border.contentTopRadius, self.theme.border.radius.large)
    }
}
