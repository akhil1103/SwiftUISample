//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 21/06/22.
//

import SwiftUI

struct InsightsView: View {
    @StateObject private var viewModel = InsightsViewModel()
    
    var body: some View {

        List {
            RingView()
                .scaledToFit()
                .padding(20)
            ForEach(TransactionModel.Category.allCases) { category in
                if(category != .all){
                    HStack {
                        Text(category.rawValue)
                            .font(.headline)
                            .foregroundColor(category.color)
                        Spacer()
                        Text(viewModel.getTotalSpentValue(category: category))
                            .bold()
                            .secondary()
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Insights")
        
        .onAppear(perform: {
            viewModel.updateView()
        })
    }
}

#if DEBUG
struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView()
    }
}
#endif
