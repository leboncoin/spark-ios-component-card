//
//  CardViewModel.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class CardViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var border = CardBorder()
    @Published private(set) var colors = CardColors()
    @Published private(set) var dim: CGFloat = 0
    @Published private(set) var padding: CGFloat = 0

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
            self.setDim()
            self.setPadding()
        }
    }

    var intent: CardIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var isBackdrop: Bool? {
        didSet {
            guard oldValue != self.isBackdrop, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
        }
    }

    var isEnabled: Bool? {
        didSet {
            guard oldValue != self.isEnabled, self.alreadyUpdateAll else { return }

            self.setDim()
        }
    }

    var isPadding: Bool? {
        didSet {
            guard oldValue != self.isPadding, self.alreadyUpdateAll else { return }

            self.setPadding()
        }
    }

    var isPressed: Bool = false {
        didSet {
            guard oldValue != self.isPressed, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var variant: CardVariant? {
        didSet {
            guard oldValue != self.variant, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
        }
    }

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any CardGetColorsUseCaseable
    private let getBorderUseCase: any CardGetBorderUseCaseable
    private let getDimUseCase: any CardGetDimUseCaseable
    private let getPaddingUseCase: any CardGetPaddingUseCaseable

    // MARK: - Initialization

    init(
        getColorsUseCase: any CardGetColorsUseCaseable = CardGetColorsUseCase(),
        getBorderUseCase: any CardGetBorderUseCaseable = CardGetBorderUseCase(),
        getDimUseCase: any CardGetDimUseCaseable = CardGetDimUseCase(),
        getPaddingUseCase: any CardGetPaddingUseCaseable = CardGetPaddingUseCase()
    ) {
        self.getColorsUseCase = getColorsUseCase
        self.getBorderUseCase = getBorderUseCase
        self.getDimUseCase = getDimUseCase
        self.getPaddingUseCase = getPaddingUseCase
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: CardIntent,
        isBackdrop: Bool,
        isEnabled: Bool,
        isPadding: Bool,
        variant: CardVariant
    ) {
        self.theme = theme
        self.intent = intent
        self.isBackdrop = isBackdrop
        self.isEnabled = isEnabled
        self.isPadding = isPadding
        self.variant = variant

        self.setBorder()
        self.setColors()
        self.setDim()
        self.setPadding()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setBorder() {
        guard let theme, let variant, let isBackdrop else { return }

        self.border = self.getBorderUseCase.execute(
            theme: theme,
            variant: variant,
            isBackdrop: isBackdrop
        )
    }
    private func setColors() {
        guard let theme, let intent, let variant, let isBackdrop else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: self.isPressed
        )
    }
    private func setDim() {
        guard let theme, let isEnabled else { return }

        self.dim = self.getDimUseCase.execute(
            theme: theme,
            isEnabled: isEnabled
        )
    }
    private func setPadding() {
        guard let theme, let isPadding else { return }

        self.padding = self.getPaddingUseCase.execute(
            theme: theme,
            isPadding: isPadding
        )
    }
}
