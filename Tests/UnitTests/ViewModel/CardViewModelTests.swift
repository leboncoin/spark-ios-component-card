//
//  CardViewModelTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest

@testable import SparkComponentCard
@_spi(SI_SPI) @testable import SparkComponentCardTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming

final class CardViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        XCTAssertNil(viewModel.theme)
        XCTAssertNil(viewModel.intent)
        XCTAssertNil(viewModel.isBackdrop)
        XCTAssertNil(viewModel.isEnabled)
        XCTAssertNil(viewModel.isPadding)
        XCTAssertNil(viewModel.variant)
        XCTAssertFalse(viewModel.isPressed)

        XCTAssertEqualToExpected(
            on: stub,
            otherBorder: CardBorder(),
            otherColors: CardColors(),
            otherDim: .zero,
            otherPadding: .zero
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getPaddingUseCase: true
        )
    }

    // MARK: - Setup

    func test_setup_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CardGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenVariant: stub.givenVariant,
            givenIsBackdrop: stub.givenIsBackdrop,
            expectedReturnValue: stub.expectedBorder
        )
        CardGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsBackdrop: stub.givenIsBackdrop,
            givenIsPressed: viewModel.isPressed,
            expectedReturnValue: stub.expectedColors
        )
        CardGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
        CardGetPaddingUseCaseableMockTest.XCTAssert(
            stub.getPaddingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsPadding: stub.givenIsPadding,
            expectedReturnValue: stub.expectedPadding
        )
    }

    // MARK: - Property Changes

    func test_themeChanged_shouldUpdateDependentProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = newTheme

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CardGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenVariant: stub.givenVariant,
            givenIsBackdrop: stub.givenIsBackdrop,
            expectedReturnValue: stub.expectedBorder
        )
        CardGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsBackdrop: stub.givenIsBackdrop,
            givenIsPressed: viewModel.isPressed,
            expectedReturnValue: stub.expectedColors
        )
        CardGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
        CardGetPaddingUseCaseableMockTest.XCTAssert(
            stub.getPaddingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsPadding: stub.givenIsPadding,
            expectedReturnValue: stub.expectedPadding
        )
    }

    func test_intentChanged_shouldUpdateColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent: CardIntent = .alert

        // WHEN
        viewModel.intent = newIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CardGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            givenVariant: stub.givenVariant,
            givenIsBackdrop: stub.givenIsBackdrop,
            givenIsPressed: viewModel.isPressed,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getDimUseCase: true,
            getPaddingUseCase: true
        )
    }

    func test_isBackdropChanged_shouldUpdateColorOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsBackdrop = !stub.givenIsBackdrop

        // WHEN
        viewModel.isBackdrop = newIsBackdrop

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CardGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenVariant: stub.givenVariant,
            givenIsBackdrop: newIsBackdrop,
            expectedReturnValue: stub.expectedBorder
        )

        CardGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsBackdrop: newIsBackdrop,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getDimUseCase: true,
            getPaddingUseCase: true
        )
    }

    func test_isEnabledChanged_shouldUpdateDimOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsEnabled = !stub.givenIsEnabled

        // WHEN
        viewModel.isEnabled = newIsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CardGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: newIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getPaddingUseCase: true
        )
    }

    func test_isPaddingChanged_shouldUpdatePaddingOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsPadding = !stub.givenIsPadding

        // WHEN
        viewModel.isPadding = newIsPadding

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CardGetPaddingUseCaseableMockTest.XCTAssert(
            stub.getPaddingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsPadding: newIsPadding,
            expectedReturnValue: stub.expectedPadding
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true
        )
    }

    func test_isPressedChanged_shouldUpdateColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsPressed = !viewModel.isPressed

        // WHEN
        viewModel.isPressed = newIsPressed

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CardGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsBackdrop: stub.givenIsBackdrop,
            givenIsPressed: newIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getDimUseCase: true,
            getPaddingUseCase: true
        )
    }

    func test_variantChanged_shouldUpdateBorderAndColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newVariant: CardVariant = .filled

        // WHEN
        viewModel.variant = newVariant

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CardGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenVariant: newVariant,
            givenIsBackdrop: stub.givenIsBackdrop,
            expectedReturnValue: stub.expectedBorder
        )
        CardGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: newVariant,
            givenIsBackdrop: stub.givenIsBackdrop,
            givenIsPressed: viewModel.isPressed,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getDimUseCase: true,
            getPaddingUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let theme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = theme
        viewModel.intent = stub.givenIntent.otherRandom
        viewModel.isBackdrop = false
        viewModel.isEnabled = false
        viewModel.isPadding = false
        viewModel.variant = stub.givenVariant.otherRandom
        viewModel.isPressed = !stub.givenIsPressed

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherBorder: CardBorder(),
            otherColors: CardColors(),
            otherDim: .zero,
            otherPadding: .zero
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getPaddingUseCase: true
        )
    }

    func test_propertiesChanged_withoutValueChange_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.intent = stub.givenIntent
        viewModel.isBackdrop = stub.givenIsBackdrop
        viewModel.isEnabled = stub.givenIsEnabled
        viewModel.isPadding = stub.givenIsPadding
        viewModel.isPressed = stub.givenIsPressed
        viewModel.variant = stub.givenVariant

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getPaddingUseCase: true
        )
    }

    func test_propertiesChanged_forNil_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = nil
        viewModel.intent = nil
        viewModel.isBackdrop = nil
        viewModel.isEnabled = nil
        viewModel.isPadding = nil
        viewModel.variant = nil

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getPaddingUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: CardIntent = .accent
    let givenIsBackdrop = true
    let givenIsEnabled = true
    let givenIsPadding = true
    let givenIsPressed = false
    let givenVariant: CardVariant = .outlined

    // MARK: - Expected

    let expectedBorder = CardBorder(width: 2, radius: 8)
    let expectedColors = CardColors(
        background: ColorTokenGeneratedMock.blue(),
        border: ColorTokenGeneratedMock.red()
    )
    let expectedDim: CGFloat = 0.5
    let expectedPadding: CGFloat = 12

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: CardGetColorsUseCaseableGeneratedMock
    let getBorderUseCaseMock: CardGetBorderUseCaseableGeneratedMock
    let getDimUseCaseMock: CardGetDimUseCaseableGeneratedMock
    let getPaddingUseCaseMock: CardGetPaddingUseCaseableGeneratedMock

    // MARK: - View Model

    let viewModel: CardViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = CardGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentAndVariantAndIsBackdropAndIsPressedReturnValue = self.expectedColors

        let getBorderUseCaseMock = CardGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeAndVariantAndIsBackdropReturnValue = self.expectedBorder

        let getDimUseCaseMock = CardGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getPaddingUseCaseMock = CardGetPaddingUseCaseableGeneratedMock()
        getPaddingUseCaseMock.executeWithThemeAndIsPaddingReturnValue = self.expectedPadding

        self.viewModel = CardViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getBorderUseCase: getBorderUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getPaddingUseCase: getPaddingUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getBorderUseCaseMock = getBorderUseCaseMock
        self.getDimUseCaseMock = getDimUseCaseMock
        self.getPaddingUseCaseMock = getPaddingUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getBorderUseCaseMock.reset()
        self.getDimUseCaseMock.reset()
        self.getPaddingUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension CardViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            isBackdrop: stub.givenIsBackdrop,
            isEnabled: stub.givenIsEnabled,
            isPadding: stub.givenIsPadding,
            variant: stub.givenVariant
        )
    }
}

private func XCTAssertNotCalled(
    on stub: Stub,
    getBorderUseCase: Bool = false,
    getColorsUseCase: Bool = false,
    getDimUseCase: Bool = false,
    getPaddingUseCase: Bool = false
) {
    CardGetBorderUseCaseableMockTest.XCTCalled(
        stub.getBorderUseCaseMock,
        executeWithThemeAndVariantAndIsBackdropCalled: !getBorderUseCase
    )
    CardGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentAndVariantAndIsBackdropAndIsPressedCalled: !getColorsUseCase
    )
    CardGetDimUseCaseableMockTest.XCTCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase
    )
    CardGetPaddingUseCaseableMockTest.XCTCalled(
        stub.getPaddingUseCaseMock,
        executeWithThemeAndIsPaddingCalled: !getPaddingUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherBorder: CardBorder? = nil,
    otherColors: CardColors? = nil,
    otherDim: CGFloat? = nil,
    otherPadding: CGFloat? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.border,
        otherBorder ?? stub.expectedBorder,
        "Wrong border value"
    )

    XCTAssertEqual(
        viewModel.colors,
        otherColors ?? stub.expectedColors,
        "Wrong colors value"
    )

    XCTAssertEqual(
        viewModel.dim,
        otherDim ?? stub.expectedDim,
        "Wrong dim value"
    )

    XCTAssertEqual(
        viewModel.padding,
        otherPadding ?? stub.expectedPadding,
        "Wrong padding value"
    )
}
