//
//  CardGetBackdropColorsUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CardGetBackdropColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: CardIntent,
        isPressed: Bool
    ) -> CardBackdropColors
}

final class CardGetBackdropColorsUseCase: CardGetBackdropColorsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: CardIntent,
        isPressed: Bool
    ) -> CardBackdropColors {
        let colors = theme.colors
        let dims = theme.dims

        let color: any ColorToken = switch intent {
        case .accent:
            colors.accent.accent
        case .alert:
            colors.feedback.alert
        case .basic:
            colors.basic.basic
        case .error:
            colors.feedback.error
        case .info:
            colors.feedback.info
        case .main, .surface:
            colors.main.main
        case .neutral:
            colors.feedback.neutral
        case .success:
            colors.feedback.success
        case .support:
            colors.support.support
        }

        return .init(
            background: colors.base.surface,
            start: color.opacity(dims.dim4),
            end: color.opacity(dims.dim2)
        )
    }
}
