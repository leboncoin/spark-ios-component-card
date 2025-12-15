//
//  CardAccessibilityIdentifierTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard

final class CardAccessibilityIdentifierTests: XCTestCase {

    // MARK: - Tests

    func testViewIdentifier() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(CardAccessibilityIdentifier.view, "spark-card-view")
    }
}
