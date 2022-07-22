//
//  RingView-ViewModel.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 24/06/22.
//

import Foundation

class RingViewModel: ObservableObject{
    @Published var transactions = [TransactionModel]()

    fileprivate typealias Category = TransactionModel.Category
    private var categoryRatios = [Int: Double]()
    private var categoryOffset = [Int: Double]()
    
    // To update view on appear
    public func updateView(){
        transactions = ModelData.sampleTransactions.filter{$0.isPinned == false}
        retrieveCategoryRatiosAndOffset()
    }
    
    //Calculation to retrieve ratio and offset for each category
    public func retrieveCategoryRatiosAndOffset(){
        // TODO: calculate ratio and offset for each category according to cummulative expense
        
        var offset = 0.0
        for categoryIndex in Category.allCases.indices {
            let totalSpent = transactions.map({$0.amount}).reduce(0, +)
            let categoryTotalSpent = transactions.map({ $0.category == Category[categoryIndex] ? $0.amount : 0}).reduce(0, +)
            let ratio = categoryTotalSpent/totalSpent
            categoryRatios[categoryIndex] = ratio
            categoryOffset[categoryIndex] = offset
            offset = offset + ratio
        }
    }
    
    //To return ratio for given category
    public func ratio(for categoryIndex: Int) -> Double {
        return categoryRatios[categoryIndex] ?? 0.0
    }
    
    //To return offset for given category
    public func offset(for categoryIndex: Int) -> Double {
        return categoryOffset[categoryIndex] ?? 0.0
    }
    
    //To return percentage for given category
    public func percentageText(for categoryIndex: Int) -> String {
        "\((ratio(for: categoryIndex) * 100).formatted(hasDecimals: false))%"
    }
}
