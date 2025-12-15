//
//  CardGetStateFilledColorsUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

struct CardGetStateFilledColorsUseCase: CardGetStateColorsUseCaseable {

    func execute(
        theme: any Theme,
        intent: CardIntent
    ) -> CardStateColors {
        let colors = theme.colors

        return switch intent {
        case .accent: .init(
            background: colors.accent.accent,
            pressed: colors.states.accentPressed
        )

        case .alert: .init(
            background: colors.feedback.alert,
            pressed: colors.states.alertPressed
        )

        case .basic: .init(
            background: colors.basic.basic,
            pressed: colors.states.basicPressed
        )

        case .error: .init(
            background: colors.feedback.error,
            pressed: colors.states.errorPressed
        )

        case .info: .init(
            background: colors.feedback.info,
            pressed: colors.states.infoPressed
        )

        case .main: .init(
            background: colors.main.main,
            pressed: colors.states.mainPressed
        )

        case .neutral: .init(
            background: colors.feedback.neutral,
            pressed: colors.states.neutralPressed
        )

        case .success: .init(
            background: colors.feedback.success,
            pressed: colors.states.successPressed
        )

        case .support: .init(
            background: colors.support.support,
            pressed: colors.states.supportPressed
        )

        case .surface: .init(
            background: colors.base.surface,
            pressed: colors.states.surfacePressed
        )
        }
    }
}
