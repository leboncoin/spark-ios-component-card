//
//  CardGetStateTintedColorsUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

final class CardGetStateTintedColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase: CardGetStateTintedColorsUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.useCase = CardGetStateTintedColorsUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func testExecuteWithAccentIntent() {
        // GIVEN
        let intent = CardIntent.accent

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.accent.accentContainer))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.accentContainerPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.accent.accentContainer))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.accentContainerPressed))
    }

    func testExecuteWithAlertIntent() {
        // GIVEN
        let intent = CardIntent.alert

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.feedback.alertContainer))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.alertContainerPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.alertContainer))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.alertContainerPressed))
    }

    func testExecuteWithBasicIntent() {
        // GIVEN
        let intent = CardIntent.basic

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.basic.basicContainer))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.basicContainerPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.basic.basicContainer))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.basicContainerPressed))
    }

    func testExecuteWithErrorIntent() {
        // GIVEN
        let intent = CardIntent.error

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.feedback.errorContainer))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.errorContainerPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.errorContainer))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.errorContainerPressed))
    }

    func testExecuteWithInfoIntent() {
        // GIVEN
        let intent = CardIntent.info

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.feedback.infoContainer))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.infoContainerPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.infoContainer))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.infoContainerPressed))
    }

    func testExecuteWithMainIntent() {
        // GIVEN
        let intent = CardIntent.main

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.main.mainContainer))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.mainContainerPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.main.mainContainer))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.mainContainerPressed))
    }

    func testExecuteWithNeutralIntent() {
        // GIVEN
        let intent = CardIntent.neutral

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.feedback.neutralContainer))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.neutralContainerPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.neutralContainer))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.neutralContainerPressed))
    }

    func testExecuteWithSuccessIntent() {
        // GIVEN
        let intent = CardIntent.success

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.feedback.successContainer))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.successContainerPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.feedback.successContainer))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.successContainerPressed))
    }

    func testExecuteWithSupportIntent() {
        // GIVEN
        let intent = CardIntent.support

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(stateColors.background.equals(self.theme.colors.support.supportContainer))
        XCTAssertTrue(stateColors.pressedBackground.equals(self.theme.colors.states.supportContainerPressed))
        XCTAssertTrue(stateColors.border.equals(self.theme.colors.support.supportContainer))
        XCTAssertTrue(stateColors.pressedBorder.equals(self.theme.colors.states.supportContainerPressed))
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