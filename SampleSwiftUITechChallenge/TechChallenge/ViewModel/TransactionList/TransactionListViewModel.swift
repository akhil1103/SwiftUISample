//
//  TransactionListView-ViewModel.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 24/06/22.
//

import Foundation

class TransactionListViewModel: ObservableObject{
    @Published var transactions = ModelData.sampleTransactions
    @Published var selectedCategory = TransactionModel.Category.all
    @Published var totalSum: Double = 0.0
    
    //To update sum total
    public func updateSumToView(){
        totalSum = getTotalSpentValue()
    }
    
    //To update category and sum upon change of the category
    public func updateCategorizedTransaction(category: TransactionModel.Category) {
        transactions = getCategoryTransactions(category: category)
        totalSum = getTotalSpentValue()
    }
    
    //To retrieve filtered transactions for specific category
    public func getCategoryTransactions(category: TransactionModel.Category) -> [TransactionModel]{
        selectedCategory = category
        return category == .all ? ModelData.sampleTransactions : ModelData.sampleTransactions.filter{ $0.category == category}
    }
    
    //To retrive total sum value based of category selected by the user and eliminated pinned transactions if any
    public func getTotalSpentValue() -> Double{
        var displayedTransactions:[TransactionModel]
        if(selectedCategory == .all){
            displayedTransactions = ModelData.sampleTransactions.filter{$0.isPinned == false}
        }else{
            displayedTransactions = ModelData.sampleTransactions.filter{ $0.category == selectedCategory && $0.isPinned == false}
        }
        return displayedTransactions.map({$0.amount}).reduce(0, +)
    }
    
}


extension TransactionListViewModel: TransactionProtocol{
    public func updateTransactionPinStatus(transaction: TransactionModel) {
        if let index = ModelData.sampleTransactions.firstIndex(where: {$0.id == transaction.id}){
            ModelData.sampleTransactions[index].isPinned = transaction.isPinned
        }
        updateSumToView()
    }
}
