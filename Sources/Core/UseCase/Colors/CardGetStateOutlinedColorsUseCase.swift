//
//  CardGetStateOutlinedColorsUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

struct CardGetStateOutlinedColorsUseCase: CardGetStateColorsUseCaseable {

    func execute(
        theme: any Theme,
        intent: CardIntent
    ) -> CardStateColors {
        let colors = theme.colors
        let opacity = theme.dims.dim5

        return switch intent {
        case .accent: .init(
            border: colors.accent.accent,
            pressedBorder: colors.accent.accent,
            background: colors.base.surface,
            pressedBackground: colors.accent.accent.opacity(opacity)
        )

        case .alert: .init(
            border: colors.feedback.alert,
            pressedBorder: colors.feedback.alert,
            background: colors.base.surface,
            pressedBackground: colors.feedback.alert.opacity(opacity)
        )

        case .basic: .init(
            border: colors.basic.basic,
            pressedBorder: colors.basic.basic,
            background: colors.base.surface,
            pressedBackground: colors.basic.basic.opacity(opacity)
        )

        case .error: .init(
            border: colors.feedback.error,
            pressedBorder: colors.feedback.error,
            background: colors.base.surface,
            pressedBackground: colors.feedback.error.opacity(opacity)
        )

        case .main: .init(
            border: colors.main.main,
            pressedBorder: colors.main.main,
            background: colors.base.surface,
            pressedBackground: colors.main.main.opacity(opacity)
        )

        case .info: .init(
            border: colors.feedback.info,
            pressedBorder: colors.feedback.info,
            background: colors.base.surface,
            pressedBackground: colors.feedback.info.opacity(opacity)
        )

        case .neutral: .init(
            border: colors.feedback.neutral,
            pressedBorder: colors.feedback.neutral,
            background: colors.base.surface,
            pressedBackground: colors.feedback.neutral.opacity(opacity)
        )

        case .success: .init(
            border: colors.feedback.success,
            pressedBorder: colors.feedback.success,
            background: colors.base.surface,
            pressedBackground: colors.feedback.success.opacity(opacity)
        )

        case .support: .init(
            border: colors.support.support,
            pressedBorder: colors.support.support,
            background: colors.base.surface,
            pressedBackground: colors.support.support.opacity(opacity)
        )

        case .surface: .init(
            border: colors.base.outline,
            pressedBorder: colors.base.outline,
            background: colors.base.surface,
            pressedBackground: colors.base.onSurface.opacity(opacity)
        )
        }
    }
}
