//
//  CardVariant.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

/// The variant of the card.
public enum CardVariant: CaseIterable {
    case outlined
    case filled
    case tinted

    // MARK: - Properties

    /// The default case. Equals to **.filled**.
    public static let `default`: Self = .filled
}
