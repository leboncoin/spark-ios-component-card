//
//  CardUncontinuousTopCornersShape.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 04/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

/// Used by the content view only if there is not backdrop.
struct CardUncontinuousTopCornersShape: Shape {

    // MARK: - Properties

    let heightRadius: CGFloat
    let widthRadius: CGFloat

    // MARK: - Path

    func path(in rect: CGRect) -> Path {
        return CardContentRectPath.path(
            in: rect,
            heightRadius: heightRadius,
            widthRadius: widthRadius
        )
    }
}
