//
//  CardVariantTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard

final class CardVariantTests: XCTestCase {

    func testAllCases() {
        // GIVEN / WHEN
        let expectedCases: [CardVariant] = [
            .outlined,
            .filled,
            .tinted
        ]

        XCTAssertEqual(CardVariant.allCases, expectedCases)
        XCTAssertEqual(CardVariant.allCases.count, 3)
    }

    func testDefaultValue() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(CardVariant.default, .filled)
    }
}
