//
//  CardGetBackdropColorsUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard
@_spi(SI_SPI) @testable import SparkComponentCardTesting
@testable @_spi(SI_SPI) import SparkThemingTesting

final class CardGetBackdropColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase: CardGetBackdropColorsUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.theme = ThemeGeneratedMock.mocked()
        self.useCase = CardGetBackdropColorsUseCase()
    }

    // MARK: - Intent Tests

    func testExecuteWithAccentIntent() {
        // GIVEN
        let intent = CardIntent.accent
        let isPressed = false
        let expectedColor = self.theme.colors.accent.accent

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isPressed: isPressed
        )

        // THEN
        let expectedBackdropColors = CardBackdropColors(
            background: self.theme.colors.base.surface,
            start: expectedColor.opacity(self.theme.dims.dim4),
            end: expectedColor.opacity(self.theme.dims.dim2)
        )

        XCTAssertEqual(colors, expectedBackdropColors)
    }

    func testExecuteWithAlertIntent() {
        // GIVEN
        let intent = CardIntent.alert
        let isPressed = false
        let expectedColor = self.theme.colors.feedback.alert

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isPressed: isPressed
        )

        // THEN
        let expectedBackdropColors = CardBackdropColors(
            background: self.theme.colors.base.surface,
            start: expectedColor.opacity(self.theme.dims.dim4),
            end: expectedColor.opacity(self.theme.dims.dim2)
        )

        XCTAssertEqual(colors, expectedBackdropColors)
    }

    func testExecuteWithBasicIntent() {
        // GIVEN
        let intent = CardIntent.basic
        let isPressed = false
        let expectedColor = self.theme.colors.basic.basic

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isPressed: isPressed
        )

        // THEN
        let expectedBackdropColors = CardBackdropColors(
            background: self.theme.colors.base.surface,
            start: expectedColor.opacity(self.theme.dims.dim4),
            end: expectedColor.opacity(self.theme.dims.dim2)
        )

        XCTAssertEqual(colors, expectedBackdropColors)
    }

    func testExecuteWithErrorIntent() {
        // GIVEN
        let intent = CardIntent.error
        let isPressed = false
        let expectedColor = self.theme.colors.feedback.error

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isPressed: isPressed
        )

        // THEN
        let expectedBackdropColors = CardBackdropColors(
            background: self.theme.colors.base.surface,
            start: expectedColor.opacity(self.theme.dims.dim4),
            end: expectedColor.opacity(self.theme.dims.dim2)
        )

        XCTAssertEqual(colors, expectedBackdropColors)
    }

    func testExecuteWithInfoIntent() {
        // GIVEN
        let intent = CardIntent.info
        let isPressed = false
        let expectedColor = self.theme.colors.feedback.info

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isPressed: isPressed
        )

        // THEN
        let expectedBackdropColors = CardBackdropColors(
            background: self.theme.colors.base.surface,
            start: expectedColor.opacity(self.theme.dims.dim4),
            end: expectedColor.opacity(self.theme.dims.dim2)
        )

        XCTAssertEqual(colors, expectedBackdropColors)
    }

    func testExecuteWithMainIntent() {
        // GIVEN
        let intent = CardIntent.main
        let isPressed = false
        let expectedColor = self.theme.colors.main.main

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isPressed: isPressed
        )

        // THEN
        let expectedBackdropColors = CardBackdropColors(
            background: self.theme.colors.base.surface,
            start: expectedColor.opacity(self.theme.dims.dim4),
            end: expectedColor.opacity(self.theme.dims.dim2)
        )

        XCTAssertEqual(colors, expectedBackdropColors)
    }

    func testExecuteWithNeutralIntent() {
        // GIVEN
        let intent = CardIntent.neutral
        let isPressed = false
        let expectedColor = self.theme.colors.feedback.neutral

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isPressed: isPressed
        )

        // THEN
        let expectedBackdropColors = CardBackdropColors(
            background: self.theme.colors.base.surface,
            start: expectedColor.opacity(self.theme.dims.dim4),
            end: expectedColor.opacity(self.theme.dims.dim2)
        )

        XCTAssertEqual(colors, expectedBackdropColors)
    }

    func testExecuteWithSuccessIntent() {
        // GIVEN
        let intent = CardIntent.success
        let isPressed = false
        let expectedColor = self.theme.colors.feedback.success

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isPressed: isPressed
        )

        // THEN
        let expectedBackdropColors = CardBackdropColors(
            background: self.theme.colors.base.surface,
            start: expectedColor.opacity(self.theme.dims.dim4),
            end: expectedColor.opacity(self.theme.dims.dim2)
        )

        XCTAssertEqual(colors, expectedBackdropColors)
    }

    func testExecuteWithSupportIntent() {
        // GIVEN
        let intent = CardIntent.support
        let isPressed = false
        let expectedColor = self.theme.colors.support.support

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isPressed: isPressed
        )

        // THEN
        let expectedBackdropColors = CardBackdropColors(
            background: self.theme.colors.base.surface,
            start: expectedColor.opacity(self.theme.dims.dim4),
            end: expectedColor.opacity(self.theme.dims.dim2)
        )

        XCTAssertEqual(colors, expectedBackdropColors)
    }

    func testExecuteWithSurfaceIntent() {
        // GIVEN
        let intent = CardIntent.surface
        let isPressed = false
        let expectedColor = self.theme.colors.main.main

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isPressed: isPressed
        )

        // THEN
        let expectedBackdropColors = CardBackdropColors(
            background: self.theme.colors.base.surface,
            start: expectedColor.opacity(self.theme.dims.dim4),
            end: expectedColor.opacity(self.theme.dims.dim2)
        )

        XCTAssertEqual(colors, expectedBackdropColors)
    }

    // MARK: - Pressed State Tests

    func testExecuteWithPressedState() {
        // GIVEN
        let intent = CardIntent.accent
        let isPressed = true
        let expectedColor = self.theme.colors.accent.accent

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isPressed: isPressed
        )

        // THEN
        let expectedBackdropColors = CardBackdropColors(
            background: self.theme.colors.base.surface,
            start: expectedColor.opacity(self.theme.dims.dim4),
            end: expectedColor.opacity(self.theme.dims.dim2)
        )

        XCTAssertEqual(colors, expectedBackdropColors)
    }

    func testExecuteWithNotPressedState() {
        // GIVEN
        let intent = CardIntent.error
        let isPressed = false
        let expectedColor = self.theme.colors.feedback.error

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isPressed: isPressed
        )

        // THEN
        let expectedBackdropColors = CardBackdropColors(
            background: self.theme.colors.base.surface,
            start: expectedColor.opacity(self.theme.dims.dim4),
            end: expectedColor.opacity(self.theme.dims.dim2)
        )

        XCTAssertEqual(colors, expectedBackdropColors)
    }
}
