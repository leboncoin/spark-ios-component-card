//
//  CardGetStateOutlinedColorsUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

final class CardGetStateOutlinedColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase: CardGetStateOutlinedColorsUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.useCase = CardGetStateOutlinedColorsUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func testExecuteWithAccentIntent() {
        // GIVEN
        let intent = CardIntent.accent

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.accent.accent))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.accent.accent))
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.base.surface))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.accent.accent.opacity(self.theme.dims.dim5)))
    }

    func testExecuteWithAlertIntent() {
        // GIVEN
        let intent = CardIntent.alert

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.alert))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.feedback.alert))
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.base.surface))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.feedback.alert.opacity(self.theme.dims.dim5)))
    }

    func testExecuteWithBasicIntent() {
        // GIVEN
        let intent = CardIntent.basic

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.basic.basic))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.basic.basic))
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.base.surface))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.basic.basic.opacity(self.theme.dims.dim5)))
    }

    func testExecuteWithErrorIntent() {
        // GIVEN
        let intent = CardIntent.error

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.error))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.feedback.error))
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.base.surface))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.feedback.error.opacity(self.theme.dims.dim5)))
    }

    func testExecuteWithMainIntent() {
        // GIVEN
        let intent = CardIntent.main

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.main.main))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.main.main))
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.base.surface))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.main.main.opacity(self.theme.dims.dim5)))
    }

    func testExecuteWithInfoIntent() {
        // GIVEN
        let intent = CardIntent.info

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.info))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.feedback.info))
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.base.surface))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.feedback.info.opacity(self.theme.dims.dim5)))
    }

    func testExecuteWithNeutralIntent() {
        // GIVEN
        let intent = CardIntent.neutral

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.neutral))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.feedback.neutral))
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.base.surface))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.feedback.neutral.opacity(self.theme.dims.dim5)))
    }

    func testExecuteWithSuccessIntent() {
        // GIVEN
        let intent = CardIntent.success

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.success))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.feedback.success))
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.base.surface))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.feedback.success.opacity(self.theme.dims.dim5)))
    }

    func testExecuteWithSupportIntent() {
        // GIVEN
        let intent = CardIntent.support

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.support.support))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.support.support))
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.base.surface))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.support.support.opacity(self.theme.dims.dim5)))
    }

    func testExecuteWithSurfaceIntent() {
        // GIVEN
        let intent = CardIntent.surface

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.base.outline))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.base.outline))
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.base.surface))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim5)))
    }
}