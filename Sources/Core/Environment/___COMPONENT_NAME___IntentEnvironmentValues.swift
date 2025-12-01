//
//  ___COMPONENT_NAME___IntentEnvironmentValues.swift
//  SparkComponent___COMPONENT_NAME___
//
//  Created by ___USERNAME___ on ___CURRENT_DATE___.
//  Copyright © ___CURRENT_YEAR___ Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var ___component_name___Intent: ___COMPONENT_NAME___Intent = .default
}

public extension View {

    /// Set the **intent** on the ``Spark___COMPONENT_NAME___``.
    ///
    /// The default value for this property is *___COMPONENT_NAME___Intent.default*.
    func spark___COMPONENT_NAME___Intent(_ intent: ___COMPONENT_NAME___Intent) -> some View {
        self.environment(\.___component_name___Intent, intent)
    }
}
