//
//  InsightsView-ViewModel.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 24/06/22.
//

import Foundation

class InsightsViewModel: ObservableObject{
    @Published var transactions = [TransactionModel]()
    
    public func updateView(){
        transactions = ModelData.sampleTransactions.filter{$0.isPinned == false}
    }
    
    public func getTotalSpentValue(category: TransactionModel.Category) -> String{
        let categoryAmount = transactions.map({$0.category == category ? $0.amount : 0}).reduce(0, +)
        return "$\(categoryAmount.formatted().description)"
    }
}
