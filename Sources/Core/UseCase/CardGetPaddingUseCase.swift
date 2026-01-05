//
//  CardGetPaddingUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol CardGetPaddingUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        isPadding: Bool
    ) -> CGFloat
}

final class CardGetPaddingUseCase: CardGetPaddingUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        isPadding: Bool
    ) -> CGFloat {
        return isPadding ? theme.layout.spacing.large : .zero
    }
}
