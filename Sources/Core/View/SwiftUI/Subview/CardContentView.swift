//
//  CardContentView.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

struct CardContentView<Content>: View where Content: View {

    // MARK: - Properties

    private let content: () -> Content

    // MARK: - Properties

    @ObservedObject private var viewModel: CardViewModel

    @Environment(\.cardIsBackdrop) private var isBackdrop

    @LimitedScaledMetric var heightRadius: CGFloat
    @LimitedScaledMetric var widthRadius: CGFloat

    // MARK: - Initialization

    init(
        viewModel: CardViewModel,
        @ViewBuilder content: @escaping () -> Content,
    ) {
        self.viewModel = viewModel
        self.content = content

        self._heightRadius = .init(value: viewModel.border.contentTopRadius, type: .radius)
        self._widthRadius = .init(value: viewModel.border.radius, type: .radius)
    }

    // MARK: - View

    var body: some View {
        self.content()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(self.viewModel.padding)
            .background(self.viewModel.colors.background)
            .contentClipShape(
                isBackdrop: self.isBackdrop,
                heightRadius: self.heightRadius,
                widthRadius: self.widthRadius
            )
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func contentClipShape(
        isBackdrop: Bool,
        heightRadius: CGFloat,
        widthRadius: CGFloat,
    ) -> some View {
        if isBackdrop {
            self.clipShape(CardUncontinuousTopCornersShape(
                heightRadius: heightRadius,
                widthRadius: widthRadius
            ))
        } else {
            self
        }
    }
}
