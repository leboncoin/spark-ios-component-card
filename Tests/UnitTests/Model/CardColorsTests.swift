//
//  CardColorsTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

final class CardColorsTests: XCTestCase {

    // MARK: - Tests

    func testInitialization() {
        // GIVEN / WHEN
        let colors = CardColors()

        // THEN
        XCTAssertTrue(colors.background is ColorTokenClear)
        XCTAssertTrue(colors.dimBackground is ColorTokenClear)
        XCTAssertTrue(colors.border is ColorTokenClear)
        XCTAssertEqual(colors.backdrop, CardBackdropColors())
    }

    func testCustomInitialization() {
        // GIVEN
        let backgroundToken = ColorTokenGeneratedMock.red()
        let dimBackgroundToken = ColorTokenGeneratedMock.yellow()
        let borderToken = ColorTokenGeneratedMock.blue()
        let backdrop = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )

        // WHEN
        let colors = CardColors(
            background: backgroundToken,
            dimBackground: dimBackgroundToken,
            border: borderToken,
            backdrop: backdrop
        )

        // THEN
        XCTAssertTrue(colors.background.equals(backgroundToken))
        XCTAssertTrue(colors.dimBackground.equals(dimBackgroundToken))
        XCTAssertTrue(colors.border.equals(borderToken))
        XCTAssertEqual(colors.backdrop, backdrop)
    }

    func testEquatable() {
        // GIVEN
        let backgroundToken1 = ColorTokenGeneratedMock.red()
        let dimBackgroundToken1 = ColorTokenGeneratedMock.purple()
        let borderToken1 = ColorTokenGeneratedMock.blue()
        let backdrop1 = CardBackdropColors(
            start: ColorTokenGeneratedMock.green(),
            end: ColorTokenGeneratedMock.red()
        )

        let backgroundToken2 = ColorTokenGeneratedMock.red()
        let dimBackgroundToken2 = ColorTokenGeneratedMock.purple()
        let borderToken2 = ColorTokenGeneratedMock.blue()
        let backdrop2 = CardBackdropColors(
            start: ColorTokenGeneratedMock.green(),
            end: ColorTokenGeneratedMock.red()
        )

        let differentBackgroundToken = ColorTokenGeneratedMock.green()
        let differentDimBackgroundToken = ColorTokenGeneratedMock.yellow()
        let differentBorder = ColorTokenGeneratedMock.green()
        let differentBackdrop = CardBackdropColors(
            start: ColorTokenGeneratedMock.yellow(),
            end: ColorTokenGeneratedMock.yellow()
        )

        let colors1 = CardColors(background: backgroundToken1, dimBackground: dimBackgroundToken1, border: borderToken1, backdrop: backdrop1)
        let colors2 = CardColors(background: backgroundToken2, dimBackground: dimBackgroundToken2, border: borderToken2, backdrop: backdrop2)

        let colors3 = CardColors(background: differentBackgroundToken, dimBackground: dimBackgroundToken1, border: borderToken1, backdrop: backdrop1)
        let colors4 = CardColors(background: backgroundToken1, dimBackground: differentDimBackgroundToken, border: borderToken1, backdrop: backdrop1)
        let colors5 = CardColors(background: backgroundToken1, dimBackground: dimBackgroundToken1, border: differentBorder, backdrop: backdrop1)
        let colors6 = CardColors(background: backgroundToken1, dimBackground: dimBackgroundToken1, border: borderToken1, backdrop: differentBackdrop)

        // WHEN / THEN
        XCTAssertEqual(colors1, colors2)
        XCTAssertNotEqual(colors1, colors3)
        XCTAssertNotEqual(colors1, colors4)
        XCTAssertNotEqual(colors1, colors5)
        XCTAssertNotEqual(colors1, colors6)
    }

    func testPropertyMutation() {
        // GIVEN
        var colors = CardColors()
        let newBackgroundToken = ColorTokenGeneratedMock.yellow()
        let newDimBackgroundToken = ColorTokenGeneratedMock.red()
        let newBorderToken = ColorTokenGeneratedMock.purple()
        let newBackdrop = CardBackdropColors(
            start: ColorTokenGeneratedMock.yellow(),
            end: ColorTokenGeneratedMock.yellow()
        )

        // WHEN
        colors.background = newBackgroundToken
        colors.dimBackground = newDimBackgroundToken
        colors.border = newBorderToken
        colors.backdrop = newBackdrop

        // THEN
        XCTAssertTrue(colors.background.equals(newBackgroundToken))
        XCTAssertTrue(colors.dimBackground.equals(newDimBackgroundToken))
        XCTAssertTrue(colors.border.equals(newBorderToken))
        XCTAssertEqual(colors.backdrop, newBackdrop)
    }
}
