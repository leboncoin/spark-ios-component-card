//
//  ___COMPONENT_NAME___Colors.swift
//  SparkComponent___COMPONENT_NAME___
//
//  Created by ___USERNAME___ on ___CURRENT_DATE___.
//  Copyright © ___CURRENT_YEAR___ Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct ___COMPONENT_NAME___Colors: Equatable {

    // MARK: - Properties

    var background: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.background.equals(rhs.background)
    }
}
