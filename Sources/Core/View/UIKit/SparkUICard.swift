//
//  SparkUICard.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import Combine

/// A cards display content and actions about a single subject.
///
/// A card is a block that groups related info (text, image, button). It helps show content clearly, compactly, and in a scannable way.
///
/// ## Example of usage
///
/// ```swift
/// let theme: SparkTheming.Theme = MyTheme()
/// let cardContentView = UIView() // Put what you want in the content
///
/// let card = SparkUICard(
///     theme: theme,
///     contentView: cardContentView
/// )
/// card.intent = .main
/// card.isBackdrop = true
/// card.isHighlightedStyle = true
/// card.isPadding = false
/// card.variant = .tinted
/// card.addAction(.init(handler: { [weak self] _ in
///    // Your action
/// }), for: .touchUpInside)
///
/// self.addSubview(card)
/// ```
///
/// ## TableView/CollectionView
///
/// If the card is used in a *tappable* **UITableViewCell** or **UICollectionViewCell**, you must :
/// - Remove the interaction on the card :
///     ```swift
///     self.isUserInteractionEnabled = false
///     ```
/// - Manage the highlight of the card (example with UICollectionViewDelegate):
///     ```swift
///     func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
///         if let cell = collectionView.cellForItem(at: indexPath) as? TheCollectionViewCell {
///             cell.card.isHighlighted = true
///         }
///     }
///
///     func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
///         if let cell = collectionView.cellForItem(at: indexPath) as? TheCollectionViewCell {
///             cell.card.isHighlighted = false
///         }
///     }
///     ```
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
public final class SparkUICard: UIControl {

    // MARK: - Components

    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews:
                [
                    self.backdropView,
                    self.contentStackView
                ])
        stackView.axis = .vertical
        stackView.spacing = CardConstants.spacing
        return stackView
    }()

    private lazy var backdropView: UIView = {
        let view = UIView()
        view.addSubview(self.backdropGradiantView)
        view.isHidden = true
        view.isAccessibilityElement = false
        return view
    }()

    private lazy var backdropGradiantView: UIView = {
        let view = UIView()
        view.layer.addSublayer(self.gradiantLayer)
        return view
    }()

    private lazy var contentStackView = {
        let stackView = UIStackView()
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.addSubview(self.contentView)
        stackView.layer.mask = self.contentStackViewLayer
        return stackView
    }()

    /// The content View of the card.
    /// Default is **UIView()**
    ///
    /// Must be overridden.
    public var contentView: UIView = UIView() {
        didSet {
            // Remove all subviews except Backdrop
            self.contentStackView.removeArrangedSubviews()

            self.contentStackView.addArrangedSubview(self.contentView)

            self.layoutIfNeeded()
        }
    }

    // MARK: - Public Properties

    /// The spark theme of the card.
    public var theme: any Theme {
        didSet {
            self.viewModel.theme = theme
        }
    }

    /// The intent of the card.
    ///
    /// The default value for this property is *CardIntent.default*.
    public var intent: CardIntent = .default {
        didSet {
            self.viewModel.intent = self.intent
        }
    }

    /// Display a **backdrop** at the top of the view. Default is **false**
    ///
    /// ![Card rendering.](card_with_backdrop.png)
    public var isBackdrop: Bool = false {
        didSet {
            self.viewModel.isBackdrop = self.isBackdrop
            self.backdropView.isHidden = !self.isBackdrop
        }
    }

    /// Highlighted or not the component. It will change the style of the corner radius. Default is **false**
    public var isHighlightedStyle: Bool = false {
        didSet {
            self.updateBorderRadius()
        }
    }

    public override var isHighlighted: Bool {
        didSet {
            self.viewModel.isPressed = self.isHighlighted
        }
    }

    public override var isEnabled: Bool {
        didSet {
            self.viewModel.isEnabled = self.isEnabled
            self.accessibilityTraits(.notEnabled, condition: !self.isEnabled)
        }
    }

    /// Add a padding or not in content. Default is **true**
    public var isPadding: Bool = true {
        didSet {
            self.viewModel.isPadding = self.isPadding
        }
    }

    /// The variant of the card.
    ///
    /// The default value for this property is *CardVariant.default*.
    public var variant: CardVariant = .default {
        didSet {
            self.viewModel.variant = self.variant
        }
    }

    // MARK: - Private Properties

    private let viewModel = CardViewModel()

    @LimitedScaledUIMetric var contentStackViewHeightRadius: CGFloat
    @LimitedScaledUIMetric var contentStackViewWidthRadius: CGFloat

    private lazy var gradiantLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.masksToBounds = true
        return layer
    }()

    private var contentStackViewLayer = CAShapeLayer()

    private var hasAction: Bool {
        self.allControlEvents == .touchUpInside
    }

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Initialization

    /// Creates a Spark card.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// let theme: SparkTheming.Theme = MyTheme()
    /// let cardContentView = UIView() // Put what you want in the content
    ///
    /// let card = SparkUICard(
    ///     theme: theme,
    ///     contentView: cardContentView
    /// )
    /// card.intent = .main
    /// card.isBackdrop = true
    /// card.isHighlightedStyle = true
    /// card.isPadding = false
    /// card.variant = .tinted
    /// card.addAction(.init(handler: { [weak self] _ in
    ///    // Your action
    /// }), for: .touchUpInside)
    ///
    /// self.addSubview(card)
    /// ```
    ///
    /// - Parameters:
    ///   - theme: The spark theme of the card.
    ///   - contentView: The content view of the card.
    ///
    /// ## Rendering
    ///
    /// ![TextLink rendering.](card_classic.png)
    ///
    public init(
        theme: any Theme,
        contentView: UIView
    ) {
        self.theme = theme

        self.contentView = contentView

        self._contentStackViewHeightRadius = .init(wrappedValue: 0)
        self._contentStackViewWidthRadius = .init(wrappedValue: 0)

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - View setup

    private func setupView() {
        // Properties
        self.clipsToBounds = true
        self.accessibilityIdentifier = CardAccessibilityIdentifier.view

        // Add subview
        self.contentStackView.addArrangedSubview(self.contentView)
        self.addSubview(self.containerStackView)

        // Setup constraints
        self.setupConstraints()

        // Setup publisher subcriptions
        self.setupSubscriptions()

        // Load view model
        self.viewModel.setup(
            theme: self.theme,
            intent: self.intent,
            isBackdrop: self.isBackdrop,
            isEnabled: self.isEnabled,
            isPadding: self.isPadding,
            variant: self.variant
        )
    }

    // MARK: - Layout

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.updateBorderRadius()
        self.updateContentSuperviewRadius()
        self.updateBackdropGradiant()
    }

    // MARK: - Actions

    public override func addAction(
        _ action: UIAction,
        for controlEvents: UIControl.Event
    ) {
        super.addAction(action, for: controlEvents)
        self.updateAccessibilityButtonTrait()
    }

    public override func removeAction(
        _ action: UIAction,
        for controlEvents: UIControl.Event
    ) {
        super.removeAction(action, for: controlEvents)
        self.updateAccessibilityButtonTrait()
    }

    public override func addTarget(
        _ target: Any?,
        action: Selector,
        for controlEvents: UIControl.Event
    ) {
        super.addTarget(target, action: action, for: controlEvents)
        self.updateAccessibilityButtonTrait()
    }

    public override func removeTarget(
        _ target: Any?,
        action: Selector?,
        for controlEvents: UIControl.Event
    ) {
        super.removeTarget(target, action: action, for: controlEvents)
        self.updateAccessibilityButtonTrait()
    }

    // MARK: - Constraints

    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.setupContainerStackViewConstraints()
        self.setupBackdropViewConstraints()
        self.setupBackdropGradiantViewConstraints()
    }

    private func setupContainerStackViewConstraints() {
        self.containerStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.containerStackView,
            to: self
        )
    }

    private func setupBackdropViewConstraints() {
        self.backdropView.translatesAutoresizingMaskIntoConstraints = false

        self.backdropView.heightAnchor.constraint(equalToConstant: CardConstants.backdropHeight).isActive = true
    }

    private func setupBackdropGradiantViewConstraints() {
        self.backdropGradiantView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.backdropGradiantView,
            to: self.backdropView
        )
    }

    // MARK: - Update UI

    private func updateBorderRadius(
        _ border: CardBorder? = nil,
        colors: CardColors? = nil
    ) {
        let border = border ?? self.viewModel.border
        let colors = colors ?? self.viewModel.colors

        self.layoutIfNeeded()

        self.sparkBorderRadius(
            width: border.width,
            radius: border.radius,
            isHighlighted: self.isHighlightedStyle,
            colorToken: colors.border
        )
    }

    private func updateBackdropGradiant(
        colors: CardColors? = nil
    ) {
        let colors = colors ?? self.viewModel.colors

        guard self.isBackdrop else {
            return
        }

        // Use to remove the implicit animation
        CATransaction.begin()
        CATransaction.setDisableActions(true)

        self.gradiantLayer.frame = .init(
            x: 0,
            y: 0,
            width: self.frame.width,
            height: self.backdropGradiantView.frame.height
        )
        self.gradiantLayer.colors = [
            colors.backdrop.start.cgColor,
            colors.backdrop.end.cgColor
        ]

        CATransaction.commit()
    }

    private func updateContentPadding(_ padding: CGFloat? = nil) {
        let padding = padding ?? self.viewModel.padding

        self.contentStackView.layoutMargins = .init(all: padding)
    }

    private func updateContentSuperviewRadius() {
        self.layoutIfNeeded()

        let path = CardContentRectPath.path(
            in: self.bounds,
            heightRadius: self.contentStackViewHeightRadius,
            widthRadius: self.contentStackViewWidthRadius
        )

        self.contentStackViewLayer.frame = self.bounds
        self.contentStackViewLayer.path = path.cgPath
    }

    // MARK: - Subscribe

    private func setupSubscriptions() {
        // Border
        self.viewModel.$border.subscribe(in: &self.subscriptions) { [weak self] border in
            guard let self else { return }

            self.updateBorderRadius(border)

            self._contentStackViewHeightRadius = .init(
                wrappedValue: border.contentTopRadius,
                traitCollection: self.traitCollection
            )
            self._contentStackViewWidthRadius = .init(
                wrappedValue: border.radius,
                traitCollection: self.traitCollection
            )
            self.updateContentSuperviewRadius()
        }

        // Colors
        self.viewModel.$colors.subscribe(in: &self.subscriptions) { [weak self] colors in
            guard let self else { return }

            self.backgroundColor(colors.background)
            self.contentStackView.backgroundColor(colors.background)

            self.updateBorderRadius(colors: colors)
            self.updateBackdropGradiant(colors: colors)
        }

        // Dim
        self.viewModel.$dim.subscribe(in: &self.subscriptions) { [weak self] dim in
            guard let self else { return }

            self.alpha = dim
        }

        // Padding
        self.viewModel.$padding.subscribe(in: &self.subscriptions) { [weak self] padding in
            guard let self else { return }

            self.updateContentPadding(padding)
        }
    }

    // MARK: - Accessibility

    private func updateAccessibilityButtonTrait() {
        self.accessibilityTraits(.button, condition: self.hasAction)
    }

    // MARK: - Touches

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        if self.viewTouched(touches) {
            self.isHighlighted = true
        }
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)

        self.isHighlighted = false
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        // Card is an action and user stop to tap on view
        if self.viewTouched(touches) {
            self.isHighlighted = false

            // Haptic
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()

            // Send actions
            self.sendActions(for: .touchUpInside)
        }
    }

    private func viewTouched(_ touches: Set<UITouch>) -> Bool {
        // Card is an action and the view is tapped
        // and it is not a button on the content view
        if self.hasAction,
           let touch = touches.first,
           self.bounds.contains(touch.location(in: self)),
           !(touch.view is UIControl) || touch.view == self {

            return true
        }

        return false
    }

    // MARK: - Trait Collection

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        // Update Radius
        self._contentStackViewHeightRadius.update(traitCollection: self.traitCollection)
        self._contentStackViewWidthRadius.update(traitCollection: self.traitCollection)
        self.updateContentSuperviewRadius()
    }
}
