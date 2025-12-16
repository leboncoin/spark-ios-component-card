//
//  CardBackgropColorsTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

final class CardBackgropColorsTests: XCTestCase {

    // MARK: - Tests

    func testInitialization() {
        // GIVEN / WHEN
        let colors = CardBackdropColors()

        // THEN
        XCTAssertTrue(colors.background is ColorTokenClear)
        XCTAssertTrue(colors.start is ColorTokenClear)
        XCTAssertTrue(colors.end is ColorTokenClear)
    }

    func testCustomInitialization() {
        // GIVEN
        let backgroundToken = ColorTokenGeneratedMock.orange()
        let startToken = ColorTokenGeneratedMock.red()
        let endToken = ColorTokenGeneratedMock.blue()

        // WHEN
        let colors = CardBackdropColors(
            background: backgroundToken,
            start: startToken,
            end: endToken
        )

        // THEN
        XCTAssertTrue(colors.start.equals(startToken))
        XCTAssertTrue(colors.end.equals(endToken))
    }

    func testEquatable() {
        // GIVEN
        let background1 = ColorTokenGeneratedMock.orange()
        let start1 = ColorTokenGeneratedMock.red()
        let end1 = ColorTokenGeneratedMock.blue()
        let start2 = ColorTokenGeneratedMock.red()
        let end2 = ColorTokenGeneratedMock.blue()

        let differentBackground = ColorTokenGeneratedMock.blue()
        let differentStart = ColorTokenGeneratedMock.green()
        let differentEnd = ColorTokenGeneratedMock.purple()

        let colors1 = CardBackdropColors(background: background1, start: start1, end: end1)
        let colors2 = CardBackdropColors(background: background1, start: start2, end: end2)

        let colors3 = CardBackdropColors(background: differentBackground, start: start1, end: end1)
        let colors4 = CardBackdropColors(background: background1, start: differentStart, end: end1)
        let colors5 = CardBackdropColors(background: background1, start: start1, end: differentEnd)

        // WHEN / THEN
        XCTAssertEqual(colors1, colors2)
        XCTAssertNotEqual(colors1, colors3)
        XCTAssertNotEqual(colors1, colors4)
        XCTAssertNotEqual(colors1, colors5)
    }

    func testPropertyMutation() {
        // GIVEN
        var colors = CardBackdropColors()
        let newBackground = ColorTokenGeneratedMock.yellow()
        let newStart = ColorTokenGeneratedMock.yellow()
        let newEnd = ColorTokenGeneratedMock.purple()

        // WHEN
        colors.background = newBackground
        colors.start = newStart
        colors.end = newEnd

        // THEN
        XCTAssertTrue(colors.background.equals(newBackground))
        XCTAssertTrue(colors.start.equals(newStart))
        XCTAssertTrue(colors.end.equals(newEnd))
    }
}
