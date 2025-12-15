//
//  CardBackdropColors.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct CardBackdropColors: Equatable {

    // MARK: - Properties

    var background: any ColorToken = ColorTokenClear()
    var start: any ColorToken = ColorTokenClear()
    var end: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.background.equals(rhs.background) &&
        lhs.start.equals(rhs.start) &&
        lhs.end.equals(rhs.end)
    }
}
