//
//  CardContentRectPath.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 04/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

struct CardContentRectPath {

    static func path(
        in rect: CGRect,
        heightRadius: CGFloat,
        widthRadius: CGFloat
    ) -> Path {
        var path = Path()

        let w = rect.width
        let h = rect.height

        // Horizontal and vertical radius
        let rx: CGFloat = widthRadius
        let ry: CGFloat = heightRadius

        // Start at the bottom left
        path.move(to: CGPoint(x: 0, y: h))

        // Left edge
        path.addLine(to: CGPoint(x: 0, y: ry))

        // Elliptical top-left corner
        path.addQuadCurve(
            to: CGPoint(x: rx, y: 0),
            control: CGPoint(x: 0, y: 0)
        )

        // High edge
        path.addLine(to: CGPoint(x: w - rx, y: 0))

        // Elliptical upper right corner
        path.addQuadCurve(
            to: CGPoint(x: w, y: ry),
            control: CGPoint(x: w, y: 0)
        )

        // Right edge + bottom
        path.addLine(to: CGPoint(x: w, y: h))
        path.addLine(to: CGPoint(x: 0, y: h))

        return path
    }
}
