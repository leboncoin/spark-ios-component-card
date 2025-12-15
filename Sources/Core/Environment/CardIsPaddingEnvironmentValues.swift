//
//  CardIsPaddingEnvironmentValues.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var cardIsPadding: Bool = true
}

public extension View {

    /// Set the **padding** on the ``SparkCard``.
    ///
    /// The default value for this property is *true*.
    func sparkCardIsPadding(_ isPadding: Bool) -> some View {
        self.environment(\.cardIsPadding, isPadding)
    }
}
