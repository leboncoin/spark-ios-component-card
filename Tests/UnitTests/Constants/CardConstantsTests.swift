//
//  CardConstantsTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 02/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard

final class CardConstantsTests: XCTestCase {

    // MARK: - Properties Tests

    func testBackdropHeight() {
        // GIVEN / WHEN
        let backdropHeight = CardConstants.backdropHeight

        // THEN
        XCTAssertEqual(backdropHeight, 16.0)
    }

    func testSpacing() {
        // GIVEN / WHEN
        let backdropOffset = CardConstants.spacing

        // THEN
        XCTAssertEqual(backdropOffset, -CardConstants.backdropHeight / 2)
    }
}
