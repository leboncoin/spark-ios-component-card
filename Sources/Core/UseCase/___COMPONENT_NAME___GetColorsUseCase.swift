//
//  ___COMPONENT_NAME___GetColorsUseCase.swift
//  SparkComponent___COMPONENT_NAME___
//
//  Created by ___USERNAME___ on ___CURRENT_DATE___.
//  Copyright © ___CURRENT_YEAR___ Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ___COMPONENT_NAME___GetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, intent: ___COMPONENT_NAME___Intent) -> ___COMPONENT_NAME___Colors
}

final class ___COMPONENT_NAME___GetColorsUseCase: ___COMPONENT_NAME___GetColorsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, intent: ___COMPONENT_NAME___Intent) -> ___COMPONENT_NAME___Colors {
        // TODO:
        return .init(background: theme.colors.main.main)
    }
}
