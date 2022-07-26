//
//  TransactionModel+UI.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 18/06/22.
//

import SwiftUI

extension TransactionModel {
    var image: Image {
        guard
            let provider = provider,
            let uiImage = UIImage(named: provider.rawValue)
        else {
            return Image(systemName: "questionmark.circle.fill")
        }
        
        return Image(uiImage: uiImage)
    }
}

extension TransactionModel.Category {
    var color: Color {
        switch self {
        case .all:
            return .black
        case .food:
            return .green
        case .health:
            return .pink
        case .entertainment:
            return .orange
        case .shopping:
            return .blue
        case .travel:
            return .purple
        }
    }
}
