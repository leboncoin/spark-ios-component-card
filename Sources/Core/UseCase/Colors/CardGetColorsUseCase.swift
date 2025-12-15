//
//  CardGetColorsUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CardGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: CardIntent,
        variant: CardVariant,
        isBackdrop: Bool,
        isPressed: Bool
    ) -> CardColors
}

final class CardGetColorsUseCase: CardGetColorsUseCaseable {

    // MARK: - Properties

    private let getBackdropColorsUseCase: CardGetBackdropColorsUseCaseable
    private let getStateFilledColorsUseCase: CardGetStateColorsUseCaseable
    private let getStateOutlinedColorsUseCase: CardGetStateColorsUseCaseable
    private let getStateTintedColorsUseCase: CardGetStateColorsUseCaseable

    // MARK: - Initialization

    init(
        getBackdropColorsUseCase: CardGetBackdropColorsUseCaseable = CardGetBackdropColorsUseCase(),
        getStateFilledColorsUseCase: CardGetStateColorsUseCaseable = CardGetStateFilledColorsUseCase(),
        getStateOutlinedColorsUseCase: CardGetStateColorsUseCaseable = CardGetStateOutlinedColorsUseCase(),
        getStateTintedColorsUseCase: CardGetStateColorsUseCaseable = CardGetStateTintedColorsUseCase()
    ) {
        self.getBackdropColorsUseCase = getBackdropColorsUseCase
        self.getStateFilledColorsUseCase = getStateFilledColorsUseCase
        self.getStateOutlinedColorsUseCase = getStateOutlinedColorsUseCase
        self.getStateTintedColorsUseCase = getStateTintedColorsUseCase
    }

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: CardIntent,
        variant: CardVariant,
        isBackdrop: Bool,
        isPressed: Bool
    ) -> CardColors {
        let colors = theme.colors

        let stateColors = switch variant {
        case .filled:
            self.getStateFilledColorsUseCase.execute(
                theme: theme,
                intent: intent
            )
        case .outlined:
            self.getStateOutlinedColorsUseCase.execute(
                theme: theme,
                intent: intent
            )
        case .tinted:
            self.getStateTintedColorsUseCase.execute(
                theme: theme,
                intent: intent
            )
        }

        let dimBackground = colors.base.surface

        let backdrop = self.getBackdropColorsUseCase.execute(
            theme: theme,
            intent: intent,
            isPressed: isPressed
        )

        return if isPressed {
            .init(
                background: isBackdrop ? colors.states.surfacePressed : stateColors.pressedBackground,
                dimBackground: dimBackground,
                border: stateColors.pressedBorder,
                backdrop: backdrop
            )
        } else {
            .init(
                background: isBackdrop ? colors.base.surface : stateColors.background,
                dimBackground: dimBackground,
                border: stateColors.border,
                backdrop: backdrop
            )
        }
    }
}
