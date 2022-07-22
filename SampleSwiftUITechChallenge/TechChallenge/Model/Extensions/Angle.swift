//
//  Angle.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 21/06/22.
//

import SwiftUI

extension Angle {
    init(offset: Double, ratio: Double) {
        self = .degrees(360 * offset - 90 + 360 * ratio)
    }
}
