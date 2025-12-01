//
//  SparkUI___COMPONENT_NAME___.swift
//  SparkComponent___COMPONENT_NAME___
//
//  Created by ___USERNAME___ on ___CURRENT_DATE___.
//  Copyright © ___CURRENT_YEAR___ Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import Combine

/// TODO: Add title
///
/// TODO: Add description
///
/// Implementation example :
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
/// let ___component_name___ = SparkUI___COMPONENT_NAME___(
///     // TODO:
/// )
///
/// self.addSubview(___component_name___)
/// ```
///
/// ![___COMPONENT_NAME___ rendering.](___component_name___.png)
///
public final class SparkUI___COMPONENT_NAME___: UIView {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews:
                [
                    self.textLabel
                ])
        stackView.axis = .horizontal
        return stackView
    }()

    private var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello ___COMPONENT_NAME___"
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontForContentSizeCategory = true
        label.setContentCompressionResistancePriority(.required,
                                                      for: .vertical)
        label.setContentCompressionResistancePriority(.required,
                                                      for: .horizontal)
        return label
    }()

    // MARK: - Public Properties

    /// The spark theme of the ___component_name___.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = theme
        }
    }

    /// The intent of the ___component_name___.
    public var intent: ___COMPONENT_NAME___Intent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    // MARK: - Private Properties

    private let viewModel = ___COMPONENT_NAME___ViewModel()

    private var subscriptions = Set<AnyCancellable>()

    // TODO: If needed

    // MARK: - Initialization

    /// Creates a Spark ___component_name___.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    /// let ___component_name___ = SparkUI___COMPONENT_NAME___(
    ///     theme: theme
    /// )
    /// self.addSubview(___component_name___)
    /// ```
    ///
    /// ![___COMPONENT_NAME___ rendering.](___component_name___.png)
    ///
    /// - Parameters:
    ///   - theme: The spark theme of the ___component_name___.
    public init(theme: any Theme) {
        self.theme = theme

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Properties
        self.accessibilityIdentifier = ___COMPONENT_NAME___AccessibilityIdentifier.view

        // Add subview
        self.addSubview(self.contentStackView)

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Setup Accessibility
        self.setupAccessibility()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent
        )
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        // TODO: If Needed
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.setupViewConstraints()
        self.setupContentStackViewConstraints()

        // TODO: If Needed
    }

    private func setupViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        // TODO: If Needed
    }

    private func setupContentStackViewConstraints() {
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.contentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // Colors
        self.viewModel.$colors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self else { return }

            self.backgroundColor(colors.background)

            // TODO: If Needed
        }

        // TODO: If Needed
    }

    // MARK: - Accessibility

    private func setupAccessibility() {
        // TODO: If Needed
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // TODO: If Needed
    }
}
