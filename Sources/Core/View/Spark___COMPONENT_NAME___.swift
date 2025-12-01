//
//  Spark___COMPONENT_NAME___.swift
//  SparkComponent___COMPONENT_NAME___
//
//  Created by ___USERNAME___ on ___CURRENT_DATE___.
//  Copyright © ___CURRENT_YEAR___ Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

// TODO: Add title
///
// TODO: Add description
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         Spark___COMPONENT_NAME___(
//             TODO: Add impl
///         )
///         .sparkTheme(self.theme)
///         .spark___COMPONENT_NAME___Intent(.main)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - ** ___component_name___Intent** : ``spark___COMPONENT_NAME___Intent(_:)`` (View extension)
// TODO: Add other EnvironmentValues
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
// TODO: Add
///
/// ## Rendering
///
// TODO: Add
///
public struct Spark___COMPONENT_NAME___: View {

    // MARK: - Private Properties

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.___component_name___Intent) private var intent

    @StateObject private var viewModel = ___COMPONENT_NAME___ViewModel()

    // MARK: - Initialization

    /// Create a ___component_name___.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme(
    ///
    ///     var body: some View {
    ///         Spark___COMPONENT_NAME___(
    //             TODO: Add impl
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .spark___COMPONENT_NAME___Intent(.main)
    ///     }
    /// }
    ///
    /// ## Rendering
    /// ```
    ///
    /// ![___COMPONENT_NAME___ rendering.](___component_name___.png)
    public init(
    ) {
    }

    // MARK: - View

    public var body: some View {
        Text("Hello ___COMPONENT_NAME___")
            .background(self.viewModel.colors.background)
            .accessibilityIdentifier(___COMPONENT_NAME___AccessibilityIdentifier.view)
            .onAppear() {
                self.viewModel.setup(
                    theme: self.theme.value,
                    intent: self.intent
                )
            }
            .onChange(of: self.theme) { theme in
                self.viewModel.theme = theme.value
            }
            .onChange(of: self.intent) { intent in
                self.viewModel.intent = intent
            }
    }

    // MARK: - Modifier

    // TODO:
}
