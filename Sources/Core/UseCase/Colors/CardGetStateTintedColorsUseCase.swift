//
//  CardGetStateTintedColorsUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

struct CardGetStateTintedColorsUseCase: CardGetStateColorsUseCaseable {

    func execute(
        theme: any Theme,
        intent: CardIntent
    ) -> CardStateColors {
        let colors = theme.colors

        return switch intent {
        case .accent: .init(
            background: colors.accent.accentContainer,
            pressed: colors.states.accentContainerPressed
        )

        case .alert: .init(
            background: colors.feedback.alertContainer,
            pressed: colors.states.alertContainerPressed
        )

        case .basic: .init(
            background: colors.basic.basicContainer,
            pressed: colors.states.basicContainerPressed
        )

        case .error: .init(
            background: colors.feedback.errorContainer,
            pressed: colors.states.errorContainerPressed
        )

        case .info: .init(
            background: colors.feedback.infoContainer,
            pressed: colors.states.infoContainerPressed
        )

        case .main: .init(
            background: colors.main.mainContainer,
            pressed: colors.states.mainContainerPressed
        )

        case .neutral: .init(
            background: colors.feedback.neutralContainer,
            pressed: colors.states.neutralContainerPressed
        )

        case .success: .init(
            background: colors.feedback.successContainer,
            pressed: colors.states.successContainerPressed
        )

        case .support: .init(
            background: colors.support.supportContainer,
            pressed: colors.states.supportContainerPressed
        )

        case .surface: .init(
            background: colors.base.surface,
            pressed: colors.states.surfacePressed
        )
        }
    }
}
