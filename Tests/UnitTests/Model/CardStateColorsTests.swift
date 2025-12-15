//
//  CardStateColorsTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

final class CardStateColorsTests: XCTestCase {

    // MARK: - Tests

    func testDefaultInitialization() {
        // GIVEN / WHEN
        let stateColors = CardStateColors()

        // THEN
        XCTAssertTrue(stateColors.border is ColorTokenClear)
        XCTAssertTrue(stateColors.pressedBorder is ColorTokenClear)
        XCTAssertTrue(stateColors.background is ColorTokenClear)
        XCTAssertTrue(stateColors.pressedBackground is ColorTokenClear)
    }

    func testFullInitialization() {
        // GIVEN
        let borderToken = ColorTokenGeneratedMock.red()
        let pressedBorderToken = ColorTokenGeneratedMock.red()
        let backgroundToken = ColorTokenGeneratedMock.blue()
        let pressedBackgroundToken = ColorTokenGeneratedMock.blue()

        // WHEN
        let stateColors = CardStateColors(
            border: borderToken,
            pressedBorder: pressedBorderToken,
            background: backgroundToken,
            pressedBackground: pressedBackgroundToken
        )

        // THEN
        XCTAssertTrue(stateColors.border.equals(borderToken))
        XCTAssertTrue(stateColors.pressedBorder.equals(pressedBorderToken))
        XCTAssertTrue(stateColors.background.equals(backgroundToken))
        XCTAssertTrue(stateColors.pressedBackground.equals(pressedBackgroundToken))
    }

    func testConvenienceInitialization() {
        // GIVEN
        let backgroundToken = ColorTokenGeneratedMock.green()
        let pressedToken = ColorTokenGeneratedMock.green()

        // WHEN
        let stateColors = CardStateColors(
            background: backgroundToken,
            pressed: pressedToken
        )

        // THEN
        XCTAssertTrue(stateColors.border.equals(backgroundToken))
        XCTAssertTrue(stateColors.pressedBorder.equals(pressedToken))
        XCTAssertTrue(stateColors.background.equals(backgroundToken))
        XCTAssertTrue(stateColors.pressedBackground.equals(pressedToken))
    }

    func testEquatable() {
        // GIVEN
        let borderToken1 = ColorTokenGeneratedMock.red()
        let pressedBorderToken1 = ColorTokenGeneratedMock.red()
        let backgroundToken1 = ColorTokenGeneratedMock.blue()
        let pressedBackgroundToken1 = ColorTokenGeneratedMock.blue()

        let borderToken2 = ColorTokenGeneratedMock.red()
        let pressedBorderToken2 = ColorTokenGeneratedMock.red()
        let backgroundToken2 = ColorTokenGeneratedMock.blue()
        let pressedBackgroundToken2 = ColorTokenGeneratedMock.blue()

        let differentBorderToken = ColorTokenGeneratedMock.green()

        let stateColors1 = CardStateColors(
            border: borderToken1,
            pressedBorder: pressedBorderToken1,
            background: backgroundToken1,
            pressedBackground: pressedBackgroundToken1
        )

        let stateColors2 = CardStateColors(
            border: borderToken2,
            pressedBorder: pressedBorderToken2,
            background: backgroundToken2,
            pressedBackground: pressedBackgroundToken2
        )

        let stateColors3 = CardStateColors(
            border: differentBorderToken,
            pressedBorder: pressedBorderToken1,
            background: backgroundToken1,
            pressedBackground: pressedBackgroundToken1
        )

        // WHEN / THEN
        XCTAssertEqual(stateColors1, stateColors2)
        XCTAssertNotEqual(stateColors1, stateColors3)
    }

    func testEqualityWithDifferentProperties() {
        // GIVEN
        let borderToken = ColorTokenGeneratedMock.red()
        let pressedBorderToken = ColorTokenGeneratedMock.red()
        let backgroundToken = ColorTokenGeneratedMock.blue()
        let pressedBackgroundToken = ColorTokenGeneratedMock.blue()
        let differentToken = ColorTokenGeneratedMock.yellow()

        let baseStateColors = CardStateColors(
            border: borderToken,
            pressedBorder: pressedBorderToken,
            background: backgroundToken,
            pressedBackground: pressedBackgroundToken
        )

        let differentPressedBorder = CardStateColors(
            border: borderToken,
            pressedBorder: differentToken,
            background: backgroundToken,
            pressedBackground: pressedBackgroundToken
        )

        let differentBackground = CardStateColors(
            border: borderToken,
            pressedBorder: pressedBorderToken,
            background: differentToken,
            pressedBackground: pressedBackgroundToken
        )

        let differentPressedBackground = CardStateColors(
            border: borderToken,
            pressedBorder: pressedBorderToken,
            background: backgroundToken,
            pressedBackground: differentToken
        )

        // WHEN / THEN
        XCTAssertNotEqual(baseStateColors, differentPressedBorder)
        XCTAssertNotEqual(baseStateColors, differentBackground)
        XCTAssertNotEqual(baseStateColors, differentPressedBackground)
    }

    func testPropertyMutation() {
        // GIVEN
        var stateColors = CardStateColors()
        let newBorderToken = ColorTokenGeneratedMock.purple()
        let newPressedBorderToken = ColorTokenGeneratedMock.random()
        let newBackgroundToken = ColorTokenGeneratedMock.orange()
        let newPressedBackgroundToken = ColorTokenGeneratedMock.random()

        // WHEN
        stateColors.border = newBorderToken
        stateColors.pressedBorder = newPressedBorderToken
        stateColors.background = newBackgroundToken
        stateColors.pressedBackground = newPressedBackgroundToken

        // THEN
        XCTAssertTrue(stateColors.border.equals(newBorderToken))
        XCTAssertTrue(stateColors.pressedBorder.equals(newPressedBorderToken))
        XCTAssertTrue(stateColors.background.equals(newBackgroundToken))
        XCTAssertTrue(stateColors.pressedBackground.equals(newPressedBackgroundToken))
    }
}
