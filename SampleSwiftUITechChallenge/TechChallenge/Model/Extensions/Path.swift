//
//  Path.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 24/06/22.
//

import SwiftUI

extension Path {
    init(offset: Double, ratio: Double, in rect: CGRect) {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: CGFloat(150.0),
            startAngle: .init(offset: offset, ratio: 0),
            endAngle: .init(offset: offset, ratio: ratio),
            clockwise: false
        )
        self = path
    }
}
