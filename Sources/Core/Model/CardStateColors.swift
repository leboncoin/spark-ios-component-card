//
//  CardStateColors.swift
//  SparkComponentChip
//
//  Created by michael.zimmermann on 08.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct CardStateColors: Equatable {

    // MARK: - Properties

    var border: any ColorToken = ColorTokenClear()
    var pressedBorder: any ColorToken = ColorTokenClear()
    var background: any ColorToken = ColorTokenClear()
    var pressedBackground: any ColorToken = ColorTokenClear()

    // MARK: - Initialization

    init() {
    }

    init(
        border: any ColorToken,
        pressedBorder: any ColorToken,
        background: any ColorToken,
        pressedBackground: any ColorToken
    ) {
        self.border = border
        self.pressedBorder = pressedBorder
        self.background = background
        self.pressedBackground = pressedBackground
    }

    init(
        background: any ColorToken,
        pressed: any ColorToken,
    ) {
        self.border = background
        self.pressedBorder = pressed
        self.background = background
        self.pressedBackground = pressed
    }

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.border.equals(rhs.border) &&
        lhs.pressedBorder.equals(rhs.pressedBorder) &&
        lhs.background.equals(rhs.background) &&
        lhs.pressedBackground.equals(rhs.pressedBackground)
    }
}
