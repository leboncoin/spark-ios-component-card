//
//  CardGetStateFilledColorsUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

final class CardGetStateFilledColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase: CardGetStateFilledColorsUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.useCase = CardGetStateFilledColorsUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func testExecuteWithAccentIntent() {
        // GIVEN
        let intent = CardIntent.accent

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.accent.accent))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.accentPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.accent.accent))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.accentPressed))
    }

    func testExecuteWithAlertIntent() {
        // GIVEN
        let intent = CardIntent.alert

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.feedback.alert))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.alertPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.alert))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.alertPressed))
    }

    func testExecuteWithBasicIntent() {
        // GIVEN
        let intent = CardIntent.basic

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.basic.basic))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.basicPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.basic.basic))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.basicPressed))
    }

    func testExecuteWithErrorIntent() {
        // GIVEN
        let intent = CardIntent.error

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.feedback.error))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.errorPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.error))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.errorPressed))
    }

    func testExecuteWithInfoIntent() {
        // GIVEN
        let intent = CardIntent.info

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.feedback.info))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.infoPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.info))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.infoPressed))
    }

    func testExecuteWithMainIntent() {
        // GIVEN
        let intent = CardIntent.main

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.main.main))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.mainPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.main.main))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.mainPressed))
    }

    func testExecuteWithNeutralIntent() {
        // GIVEN
        let intent = CardIntent.neutral

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.feedback.neutral))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.neutralPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.neutral))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.neutralPressed))
    }

    func testExecuteWithSuccessIntent() {
        // GIVEN
        let intent = CardIntent.success

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.feedback.success))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.successPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.success))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.successPressed))
    }

    func testExecuteWithSupportIntent() {
        // GIVEN
        let intent = CardIntent.support

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.support.support))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.supportPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.support.support))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.supportPressed))
    }

    func testExecuteWithSurfaceIntent() {
        // GIVEN
        let intent = CardIntent.surface

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.base.surface))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.surfacePressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.base.surface))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.surfacePressed))
    }
}