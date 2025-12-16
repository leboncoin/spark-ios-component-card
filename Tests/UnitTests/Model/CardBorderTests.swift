//
//  CardBorderTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard

final class CardBorderTests: XCTestCase {

    // MARK: - Tests

    func testInitialization() {
        // GIVEN / WHEN
        let border = CardBorder()

        // THEN
        XCTAssertEqual(border.width, 0)
        XCTAssertEqual(border.radius, 0)
        XCTAssertEqual(border.contentTopRadius, 0)
    }

    func testCustomInitialization() {
        // GIVEN
        let width: CGFloat = 2.0
        let radius: CGFloat = 8.0
        let contentTopRadius: CGFloat = 4.0

        // WHEN
        let border = CardBorder(width: width, radius: radius, contentTopRadius: contentTopRadius)

        // THEN
        XCTAssertEqual(border.width, width)
        XCTAssertEqual(border.radius, radius)
        XCTAssertEqual(border.contentTopRadius, contentTopRadius)
    }

    func testEquatable() {
        // GIVEN
        let border1 = CardBorder(width: 1.0, radius: 4.0, contentTopRadius: 2.0)
        let border2 = CardBorder(width: 1.0, radius: 4.0, contentTopRadius: 2.0)
        let border3 = CardBorder(width: 2.0, radius: 4.0, contentTopRadius: 2.0)
        let border4 = CardBorder(width: 1.0, radius: 2.0, contentTopRadius: 2.0)
        let border5 = CardBorder(width: 1.0, radius: 4.0, contentTopRadius: 3.0)

        // WHEN / THEN
        XCTAssertEqual(border1, border2)
        XCTAssertNotEqual(border1, border3)
        XCTAssertNotEqual(border1, border4)
        XCTAssertNotEqual(border1, border5)
    }

    func testPropertyMutation() {
        // GIVEN
        var border = CardBorder()

        // WHEN
        border.width = 3.0
        border.radius = 12.0
        border.contentTopRadius = 6.0

        // THEN
        XCTAssertEqual(border.width, 3.0)
        XCTAssertEqual(border.radius, 12.0)
        XCTAssertEqual(border.contentTopRadius, 6.0)
    }
}
