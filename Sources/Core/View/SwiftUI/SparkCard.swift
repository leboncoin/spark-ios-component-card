//
//  SparkCard.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

/// A cards display content and actions about a single subject.
///
/// A card is a block that groups related info (text, image, button). It helps show content clearly, compactly, and in a scannable way.
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkCard(
///             content: {
///                 VStack(alignment: .leading) {
///                     HStack {
///                         Image(systemName: "info.circle")
///                         Text("Welcome on Card")
///                     }
///
///                     Text("Nam eu sapien finibus, auctor purusan varius, sagittis turpis. Sed ipsum elit, lacinia id porta ut, bibendum at risus.")
///                         .multilineTextAlignment(.leading)
///                 }
///             }
///             action: {
///                 // Your optional action
///             }
///         )
///         .sparkTheme(self.theme)
///         .sparkCardIntent(.success)
///         .sparkCardIsHighlighted(true)
///         .sparkCardIsBackdrop(true)
///         .sparkCardIsPadding(true)
///         .sparkCardVariant(.tinted)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **intent**: ``sparkCardIntent(_:)``(View extension)
/// - **isHighlighted**: ``sparkCardIsHighlighted(_:)``(View extension)
/// - **isBackdrop**: ``sparkCardIsBackdrop(_:)``(View extension)
/// - **isPadding**: ``sparkCardIsPadding(_:)``(View extension)
/// - **variant**: ``sparkCardVariant(_:)``(View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// You need to manage yourself the accessibility of the component because Spark doesn't know the context of the content.
///
/// If an action is provided, the card will be treated as a button.
///
/// ## Rendering
///
/// - Classic card:
/// ![Card rendering.](card_classic.png)
///
/// - With a backdrop:
/// ![Card rendering.](card_with_backdrop.png)
///
public struct SparkCard<Content>: View where Content: View {

    // MARK: - Properties

    private let content: () -> Content
    private var action: (() -> Void)?

    @Environment(\.theme) private var theme
    @Environment(\.cardIntent) private var intent
    @Environment(\.cardIsHighlighted) private var isHighlighted
    @Environment(\.cardIsBackdrop) private var isBackdrop
    @Environment(\.cardIsPadding) private var isPadding
    @Environment(\.cardVariant) private var variant
    @Environment(\.isEnabled) private var isEnabled

    @StateObject private var viewModel = CardViewModel()

    @State private var feedbackID: UUID = UUID()

    // MARK: - Initialization

    /// Create a card.
    ///
    /// - Parameters:
    ///   - content: The content of the card..
    ///   - action: The action on tap. *Optional*. Default is **nil**.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkCard(
    ///             content: {
    ///                 VStack(alignment: .leading) {
    ///                     HStack {
    ///                         Image(systemName: "info.circle")
    ///                         Text("Welcome on Card")
    ///                     }
    ///
    ///                     Text("Nam eu sapien finibus, auctor purusan varius, sagittis turpis. Sed ipsum elit, lacinia id porta ut, bibendum at risus.")
    ///                         .multilineTextAlignment(.leading)
    ///                 }
    ///             }
    ///             action: {
    ///                 // Your optional action
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkCardIntent(.success)
    ///         .sparkCardIsHighlighted(true)
    ///         .sparkCardIsBackdrop(true)
    ///         .sparkCardIsPadding(true)
    ///         .sparkCardVariant(.tinted)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![TextLink rendering.](card_classic.png)
    /// 
    public init(
        @ViewBuilder content: @escaping () -> Content,
        action: (() -> Void)? = nil
    ) {
        self.content = content
        self.action = action
    }

    // MARK: - View

    public var body: some View {
        Group {
            if let action {
                Button(action: {
                    action()
                    self.feedbackID = .init()
                }, label: self.mainContent)
                .buttonStyle(PressedButtonStyle(isPressed: self.$viewModel.isPressed))
            } else {
                self.mainContent()
            }
        }
        .accessibilityIdentifier(CardAccessibilityIdentifier.view)
        .accessibilityElement(children: .contain)
        .sparkSensoryFeedback(.selection, trigger: self.feedbackID)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                intent: self.intent,
                isBackdrop: self.isBackdrop,
                isEnabled: self.isEnabled,
                isPadding: self.isPadding,
                variant: self.variant
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.isBackdrop) { isBackdrop in
            self.viewModel.isBackdrop = isBackdrop
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
        .onChange(of: self.isPadding) { isPadding in
            self.viewModel.isPadding = isPadding
        }
        .onChange(of: self.variant) { variant in
            self.viewModel.variant = variant
        }
    }

    private func mainContent() -> some View {
        ZStack(alignment: .center) {
            VStack(alignment: .leading, spacing: CardConstants.spacing) {
                // Backdrop
                if self.isBackdrop {
                    ZStack {
                        Rectangle()
                            .fill(self.viewModel.colors.backdrop.background)

                        Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: .init(colors: self.viewModel.colors.backdrop.colors),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    }
                    .frame(height: CardConstants.backdropHeight)
                    .accessibilityHidden(true)
                }

                // Content
                CardContentView(
                    viewModel: self.viewModel,
                    content: self.content
                )
            }
            .background(self.viewModel.colors.background)
            .sparkBorder(
                width: self.viewModel.border.width,
                radius: self.viewModel.border.radius,
                isHighlighted: self.isHighlighted,
                colorToken: self.viewModel.colors.border
            )
            .dimmedOverlay(self.viewModel.dim) {
                self.viewModel.colors.dimBackground.color
                    .sparkCornerRadius(
                        self.viewModel.border.radius,
                        isHighlighted: self.isHighlighted
                    )
            }
        }
    }
}

// MARK: - Extension

private extension CardBackdropColors {

    var colors: [Color] {
        return [self.start, self.end].map { $0.color }
    }
}
