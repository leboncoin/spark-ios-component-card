//
//  CardIntentTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard

final class CardIntentTests: XCTestCase {

    // MARK: - Tests

    func testAllCases() {
        // GIVEN / WHEN
        let expectedCases: [CardIntent] = [
            .accent,
            .alert,
            .basic,
            .error,
            .info,
            .main,
            .neutral,
            .success,
            .support,
            .surface
        ]

        // THEN
        XCTAssertEqual(CardIntent.allCases, expectedCases)
        XCTAssertEqual(CardIntent.allCases.count, 10)
    }

    func testDefaultValue() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(CardIntent.default, .surface)
    }
}
