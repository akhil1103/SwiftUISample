//
//  RingView.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 21/06/22.
//

import SwiftUI

struct RingView: View {
    @StateObject private var viewModel = RingViewModel()
    
    var body: some View {
        ZStack {
            ForEach(TransactionModel.Category.allCases.indices) { categoryIndex in
                if(viewModel.ratio(for: categoryIndex) > 0) {
                PartialCircleShape(
                    offset: viewModel.offset(for: categoryIndex),
                    ratio: viewModel.ratio(for: categoryIndex)
                )
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [(TransactionModel.Category[categoryIndex]?.color ?? .black).unsaturated, TransactionModel.Category[categoryIndex]?.color ?? .black]),
                        center: .center,
                        startAngle: .init(
                            offset: viewModel.offset(for: categoryIndex),
                            ratio: 0
                        ),
                        endAngle: .init(
                            offset: viewModel.offset(for: categoryIndex),
                            ratio: viewModel.ratio(for: categoryIndex)
                        )
                    ),
                    style: StrokeStyle(lineWidth: 28.0, lineCap: .butt)
                )
                .overlay(
                    PercentageText(
                        offset: viewModel.offset(for: categoryIndex),
                        ratio: viewModel.ratio(for: categoryIndex),
                        text: viewModel.percentageText(for: categoryIndex)
                    )
                )
                }
            }
        }.onAppear(perform: {
            viewModel.updateView()
        })
    }
}

extension RingView {
    struct PartialCircleShape: Shape {
        let offset: Double
        let ratio: Double
        
        func path(in rect: CGRect) -> Path {
            Path(offset: offset, ratio: ratio, in: rect)
        }
    }
    
    struct PercentageText: View {
        let offset: Double
        let ratio: Double
        let text: String
        
        private func position(for geometry: GeometryProxy) -> CGPoint {
            let rect = geometry.frame(in: .local)
            let path = Path(offset: offset, ratio: ratio / 2.0, in: rect)
            return path.currentPoint ?? .zero
        }
        
        var body: some View {
            GeometryReader { geometry in
                Text(text)
                    .percentage()
                    .position(position(for: geometry))
            }
        }
    }
}

#if DEBUG
struct RingView_Previews: PreviewProvider {
    static var sampleRing: some View {
        ZStack {
            RingView.PartialCircleShape(offset: 0.0, ratio: 0.15)
                .stroke(
                    Color.red,
                    style: StrokeStyle(lineWidth: 28.0, lineCap: .butt)
                )
            
            RingView.PartialCircleShape(offset: 0.15, ratio: 0.5)
                .stroke(
                    Color.green,
                    style: StrokeStyle(lineWidth: 28.0, lineCap: .butt)
                )
                
            RingView.PartialCircleShape(offset: 0.65, ratio: 0.35)
                .stroke(
                    Color.blue,
                    style: StrokeStyle(lineWidth: 28.0, lineCap: .butt)
                )
        }
    }
    
    static var previews: some View {
        VStack {
            sampleRing
                .scaledToFit()
            
            RingView()
                .scaledToFit()
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif
