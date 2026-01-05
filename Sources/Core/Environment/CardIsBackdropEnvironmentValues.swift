//
//  CardIsBackdropEnvironmentValues.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var cardIsBackdrop: Bool = false
}

public extension View {

    /// Display a **backdrop** at the top of the ``SparkCard``.
    ///
    /// The default value for this property is *false*.
    func sparkCardIsBackdrop(_ isBackdrop: Bool) -> some View {
        self.environment(\.cardIsBackdrop, isBackdrop)
    }
}
