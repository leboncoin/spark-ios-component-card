//
//  CardGetColorsUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentCard
@_spi(SI_SPI) @testable import SparkComponentCardTesting
@testable @_spi(SI_SPI) import SparkThemingTesting

final class CardGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase: CardGetColorsUseCase!
    private var theme: ThemeGeneratedMock!

    private var mockBackdropUseCase: CardGetBackdropColorsUseCaseableGeneratedMock!
    private var mockFilledUseCase: CardGetStateColorsUseCaseableGeneratedMock!
    private var mockOutlinedUseCase: CardGetStateColorsUseCaseableGeneratedMock!
    private var mockTintedUseCase: CardGetStateColorsUseCaseableGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.theme = ThemeGeneratedMock.mocked()

        self.mockBackdropUseCase = CardGetBackdropColorsUseCaseableGeneratedMock()
        self.mockFilledUseCase = CardGetStateColorsUseCaseableGeneratedMock()
        self.mockOutlinedUseCase = CardGetStateColorsUseCaseableGeneratedMock()
        self.mockTintedUseCase = CardGetStateColorsUseCaseableGeneratedMock()

        self.useCase = CardGetColorsUseCase(
            getBackdropColorsUseCase: self.mockBackdropUseCase,
            getStateFilledColorsUseCase: self.mockFilledUseCase,
            getStateOutlinedColorsUseCase: self.mockOutlinedUseCase,
            getStateTintedColorsUseCase: self.mockTintedUseCase
        )
    }

    // MARK: - Filled Variant Tests

    func testExecuteWithFilledVariantAndNotPressedAndWithBackdrop() {
        // GIVEN
        let variant = CardVariant.filled
        let intent = CardIntent.accent
        let isBackdrop = true
        let isPressed = false

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random()
        )
        self.mockFilledUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let mockBackdropColors = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )
        self.mockBackdropUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = mockBackdropColors

        let expectedColors = CardColors(
            background: self.theme.colors.base.surface,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.border,
            backdrop: mockBackdropColors
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: isPressed
        )

        // THEN
        CardGetBackdropColorsUseCaseableMockTest.XCTAssert(
            self.mockBackdropUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsPressed: isPressed,
            expectedReturnValue: mockBackdropColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTAssert(
            self.mockFilledUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockOutlinedUseCase,
            executeWithThemeAndIntentCalled: false
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockTintedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(colors, expectedColors)
    }

    func testExecuteWithFilledVariantAndNotPressedAndWithoutBackdrop() {
        // GIVEN
        let variant = CardVariant.filled
        let intent = CardIntent.accent
        let isBackdrop = false
        let isPressed = false

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random()
        )
        self.mockFilledUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let mockBackdropColors = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )
        self.mockBackdropUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = mockBackdropColors

        let expectedColors = CardColors(
            background: mockStateColors.background,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.border,
            backdrop: mockBackdropColors
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: isPressed
        )

        // THEN
        CardGetBackdropColorsUseCaseableMockTest.XCTAssert(
            self.mockBackdropUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsPressed: isPressed,
            expectedReturnValue: mockBackdropColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTAssert(
            self.mockFilledUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockOutlinedUseCase,
            executeWithThemeAndIntentCalled: false
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockTintedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(colors, expectedColors)
    }

    func testExecuteWithFilledVariantAndPressedAndWithBackdrop() {
        // GIVEN
        let variant = CardVariant.filled
        let intent = CardIntent.main
        let isBackdrop = true
        let isPressed = true

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random()
        )
        self.mockFilledUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let mockBackdropColors = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )
        self.mockBackdropUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = mockBackdropColors

        let expectedColors = CardColors(
            background: self.theme.colors.states.surfacePressed,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.pressedBorder,
            backdrop: mockBackdropColors
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: isPressed
        )

        // THEN
        CardGetBackdropColorsUseCaseableMockTest.XCTAssert(
            self.mockBackdropUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsPressed: isPressed,
            expectedReturnValue: mockBackdropColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTAssert(
            self.mockFilledUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockOutlinedUseCase,
            executeWithThemeAndIntentCalled: false
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockTintedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(colors, expectedColors)
    }

    func testExecuteWithFilledVariantAndPressedAndWithoutBackdrop() {
        // GIVEN
        let variant = CardVariant.filled
        let intent = CardIntent.main
        let isBackdrop = false
        let isPressed = true

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random()
        )
        self.mockFilledUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let mockBackdropColors = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )
        self.mockBackdropUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = mockBackdropColors

        let expectedColors = CardColors(
            background: mockStateColors.pressedBackground,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.pressedBorder,
            backdrop: mockBackdropColors
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: isPressed
        )

        // THEN
        CardGetBackdropColorsUseCaseableMockTest.XCTAssert(
            self.mockBackdropUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsPressed: isPressed,
            expectedReturnValue: mockBackdropColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTAssert(
            self.mockFilledUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )

        XCTAssertEqual(colors, expectedColors)
    }

    // MARK: - Outlined Variant Tests

    func testExecuteWithOutlinedVariantAndNotPressedAndWithBackdrop() {
        // GIVEN
        let variant = CardVariant.outlined
        let intent = CardIntent.error
        let isBackdrop = true
        let isPressed = false

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random()
        )
        self.mockOutlinedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let mockBackdropColors = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )
        self.mockBackdropUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = mockBackdropColors

        let expectedColors = CardColors(
            background: self.theme.colors.base.surface,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.border,
            backdrop: mockBackdropColors
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: isPressed
        )

        // THEN
        CardGetBackdropColorsUseCaseableMockTest.XCTAssert(
            self.mockBackdropUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsPressed: isPressed,
            expectedReturnValue: mockBackdropColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTAssert(
            self.mockOutlinedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockFilledUseCase,
            executeWithThemeAndIntentCalled: false
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockTintedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(colors, expectedColors)
    }

    func testExecuteWithOutlinedVariantAndNotPressedAndWithoutBackdrop() {
        // GIVEN
        let variant = CardVariant.outlined
        let intent = CardIntent.error
        let isBackdrop = false
        let isPressed = false

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random()
        )
        self.mockOutlinedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let mockBackdropColors = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )
        self.mockBackdropUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = mockBackdropColors

        let expectedColors = CardColors(
            background: mockStateColors.background,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.border,
            backdrop: mockBackdropColors
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: isPressed
        )

        // THEN
        CardGetBackdropColorsUseCaseableMockTest.XCTAssert(
            self.mockBackdropUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsPressed: isPressed,
            expectedReturnValue: mockBackdropColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTAssert(
            self.mockOutlinedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockFilledUseCase,
            executeWithThemeAndIntentCalled: false
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockTintedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(colors, expectedColors)
    }

    func testExecuteWithOutlinedVariantAndPressedAndWithoutBackdrop() {
        // GIVEN
        let variant = CardVariant.outlined
        let intent = CardIntent.info
        let isBackdrop = false
        let isPressed = true

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random()
        )
        self.mockOutlinedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let mockBackdropColors = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )
        self.mockBackdropUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = mockBackdropColors

        let expectedColors = CardColors(
            background: mockStateColors.pressedBackground,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.pressedBorder,
            backdrop: mockBackdropColors
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: isPressed
        )

        // THEN
        CardGetBackdropColorsUseCaseableMockTest.XCTAssert(
            self.mockBackdropUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsPressed: isPressed,
            expectedReturnValue: mockBackdropColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTAssert(
            self.mockOutlinedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockFilledUseCase,
            executeWithThemeAndIntentCalled: false
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockTintedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(colors, expectedColors)
    }

    func testExecuteWithOutlinedVariantAndPressedAndWithBackdrop() {
        // GIVEN
        let variant = CardVariant.outlined
        let intent = CardIntent.info
        let isBackdrop = true
        let isPressed = true

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random()
        )
        self.mockOutlinedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let mockBackdropColors = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )
        self.mockBackdropUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = mockBackdropColors

        let expectedColors = CardColors(
            background: self.theme.colors.states.surfacePressed,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.pressedBorder,
            backdrop: mockBackdropColors
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: isPressed
        )

        // THEN
        CardGetBackdropColorsUseCaseableMockTest.XCTAssert(
            self.mockBackdropUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsPressed: isPressed,
            expectedReturnValue: mockBackdropColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTAssert(
            self.mockOutlinedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockFilledUseCase,
            executeWithThemeAndIntentCalled: false
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockTintedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(colors, expectedColors)
    }

    // MARK: - Tinted Variant Tests

    func testExecuteWithTintedVariantAndNotPressedAndWithBackdrop() {
        // GIVEN
        let variant = CardVariant.tinted
        let intent = CardIntent.neutral
        let isBackdrop = true
        let isPressed = false

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random()
        )
        self.mockTintedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let mockBackdropColors = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )
        self.mockBackdropUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = mockBackdropColors

        let expectedColors = CardColors(
            background: self.theme.colors.base.surface,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.border,
            backdrop: mockBackdropColors
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: isPressed
        )

        // THEN
        CardGetBackdropColorsUseCaseableMockTest.XCTAssert(
            self.mockBackdropUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsPressed: isPressed,
            expectedReturnValue: mockBackdropColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTAssert(
            self.mockTintedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockFilledUseCase,
            executeWithThemeAndIntentCalled: false
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockOutlinedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(colors, expectedColors)
    }

    func testExecuteWithTintedVariantAndNotPressedAndWithoutBackdrop() {
        // GIVEN
        let variant = CardVariant.tinted
        let intent = CardIntent.neutral
        let isBackdrop = false
        let isPressed = false

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random()
        )
        self.mockTintedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let mockBackdropColors = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )
        self.mockBackdropUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = mockBackdropColors

        let expectedColors = CardColors(
            background: mockStateColors.background,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.border,
            backdrop: mockBackdropColors
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: isPressed
        )

        // THEN
        CardGetBackdropColorsUseCaseableMockTest.XCTAssert(
            self.mockBackdropUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsPressed: isPressed,
            expectedReturnValue: mockBackdropColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTAssert(
            self.mockTintedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockFilledUseCase,
            executeWithThemeAndIntentCalled: false
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockOutlinedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(colors, expectedColors)
    }

    func testExecuteWithTintedVariantAndPressedAndWithBackdrop() {
        // GIVEN
        let variant = CardVariant.tinted
        let intent = CardIntent.success
        let isBackdrop = true
        let isPressed = true

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random()
        )
        self.mockTintedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let mockBackdropColors = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )
        self.mockBackdropUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = mockBackdropColors

        let expectedColors = CardColors(
            background: self.theme.colors.states.surfacePressed,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.pressedBorder,
            backdrop: mockBackdropColors
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: isPressed
        )

        // THEN
        CardGetBackdropColorsUseCaseableMockTest.XCTAssert(
            self.mockBackdropUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsPressed: isPressed,
            expectedReturnValue: mockBackdropColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTAssert(
            self.mockTintedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockFilledUseCase,
            executeWithThemeAndIntentCalled: false
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockOutlinedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(colors, expectedColors)
    }

    func testExecuteWithTintedVariantAndPressedAndWithoutBackdrop() {
        // GIVEN
        let variant = CardVariant.tinted
        let intent = CardIntent.success
        let isBackdrop = false
        let isPressed = true

        let mockStateColors = CardStateColors(
            background: ColorTokenGeneratedMock.random(),
            pressed: ColorTokenGeneratedMock.random()
        )
        self.mockTintedUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let mockBackdropColors = CardBackdropColors(
            start: ColorTokenGeneratedMock.random(),
            end: ColorTokenGeneratedMock.random()
        )
        self.mockBackdropUseCase.executeWithThemeAndIntentAndIsPressedReturnValue = mockBackdropColors

        let expectedColors = CardColors(
            background: mockStateColors.pressedBackground,
            dimBackground: self.theme.colors.base.surface,
            border: mockStateColors.pressedBorder,
            backdrop: mockBackdropColors
        )

        // WHEN
        let colors = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            variant: variant,
            isBackdrop: isBackdrop,
            isPressed: isPressed
        )

        // THEN
        CardGetBackdropColorsUseCaseableMockTest.XCTAssert(
            self.mockBackdropUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            givenIsPressed: isPressed,
            expectedReturnValue: mockBackdropColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTAssert(
            self.mockTintedUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: intent,
            expectedReturnValue: mockStateColors
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockFilledUseCase,
            executeWithThemeAndIntentCalled: false
        )
        CardGetStateColorsUseCaseableMockTest.XCTCalled(
            self.mockOutlinedUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(colors, expectedColors)
    }
}
