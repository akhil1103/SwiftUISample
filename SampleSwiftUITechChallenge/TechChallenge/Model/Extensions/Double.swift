//
//  Double.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 18/06/22.
//

import Foundation

extension Double {
    func formatted(hasDecimals: Bool = true) -> String {
        NSString(format: hasDecimals ? "%.2f" : "%.0f", self) as String
    }
}
