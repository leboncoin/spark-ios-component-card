//
//  CardGetBorderUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CardGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        variant: CardVariant,
        isBackdrop: Bool
    ) -> CardBorder
}

final class CardGetBorderUseCase: CardGetBorderUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        variant: CardVariant,
        isBackdrop: Bool
    ) -> CardBorder {
        let radius = theme.border.radius.large
        let contentTopRadius = isBackdrop ? theme.border.radius.medium : radius

        return switch variant {
        case .outlined: .init(
            width: theme.border.width.small,
            radius: radius,
            contentTopRadius: contentTopRadius
        )

        default: .init(
            radius: radius,
            contentTopRadius: contentTopRadius
        )
        }
    }
}
