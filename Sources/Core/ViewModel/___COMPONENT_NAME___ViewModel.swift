//
//  ___COMPONENT_NAME___ViewModel.swift
//  SparkComponent___COMPONENT_NAME___
//
//  Created by ___USERNAME___ on ___CURRENT_DATE___.
//  Copyright © ___CURRENT_YEAR___ Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// sourcery: AutoPublisherTest, AutoViewModelStub
final class ___COMPONENT_NAME___ViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var colors = ___COMPONENT_NAME___Colors()
    // TODO: Add other Published value

    // MARK: - Properties

    var theme: (any Theme)? {
        didSet {
            guard !oldValue.equals(self.theme), self.alreadyUpdateAll else { return }

            self.setColors()
            // TODO: Call setter
        }
    }

    var intent: ___COMPONENT_NAME___Intent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    // TODO: Add other value

    // MARK: - Private properties

    private var alreadyUpdateAll = false

    // MARK: - Use Case Properties

    private let getColorsUseCase: any ___COMPONENT_NAME___GetColorsUseCaseable

    // TODO: Add your UseCase here

    // MARK: - Initialization

    init(
         getColorsUseCase: any ___COMPONENT_NAME___GetColorsUseCaseable = ___COMPONENT_NAME___GetColorsUseCase(),
         // TODO: Add other UseCase here like :
    ) {
         self.getColorsUseCase = getColorsUseCase
        // TODO: Set ohter UseCase here like :
    }

    // MARK: - Setup

    func setup(
        theme: any Theme,
        intent: ___COMPONENT_NAME___Intent
        // TODO: Add others parameters if needed
    ) {
        self.theme = theme
        self.intent = intent
        // TODO: Set the others parameters here

         self.setColors()
        // TODO: Call all needed private setter

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    // TODO: Add setter like :
    private func setColors() {
        guard let theme, let intent else { return }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            intent: intent
        )
    }
}
