//
//  ViewModifiers.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 18/06/22.
//

import SwiftUI

extension Text {
    func primary() -> some View {
        self
            .bold()
            .font(.body)
            .foregroundColor(.accentColor)
    }
    
    func secondary() -> some View {
        self
            .font(.body)
            .foregroundColor(.accentColor)
    }
    
    func tertiary() -> some View {
        self
            .font(.caption)
            .foregroundColor(.accentColor)
            .opacity(0.8)
    }
    
    func percentage() -> some View {
        self
            .font(.title2)
            .bold()
            .foregroundColor(Color(UIColor.label))
    }
    
    func category() -> some View{
        self
            .font(.title2)
            .bold()
            .foregroundColor(.white)
            .frame(minWidth: 50)
            .padding()
    }
}
