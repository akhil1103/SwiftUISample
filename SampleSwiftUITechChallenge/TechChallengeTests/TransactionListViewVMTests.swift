//
//  TransactionListViewVMTests.swift
//  TechChallengeTests
//
//  Created by Akhil Mittal on 25/06/22.
//

import Foundation
import XCTest

@testable import TechChallenge
import CoreData

class TransactionListViewVMTests: XCTestCase{
    private var sut: TransactionListViewModel!
    
    override func setUpWithError() throws {
        sut = TransactionListViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    /* Test cases for filter transactions to selected category*/
    //Positive use case
    func test_AllTransactions_returnsAllTransaction() {
        let actualList = sut.getCategoryTransactions(category: TransactionModel.Category.all)
        let expectedList = ModelData.sampleTransactions
        XCTAssertEqual(actualList, expectedList)
    }
    
    func test_FoodTransactions_returnsFoodTransaction() {
        let actualList = sut.getCategoryTransactions(category: TransactionModel.Category.food)
        let expectedList = ModelData.sampleTransactions.filter{$0.category == .food}
        XCTAssertEqual(actualList, expectedList)
    }
    
    //Negative use case
    func test_TravelTransactions_returnsShoppingTransaction() {
        let actualList = sut.getCategoryTransactions(category: TransactionModel.Category.travel)
        let expectedList = ModelData.sampleTransactions.filter{$0.category == .shopping}
        XCTAssertNotEqual(actualList, expectedList)
    }
    
    /* Test cases to calculate total sum for transactions w.r.t selected category with/without pinned transactions*/

    func test_TotalSpent_All(){
        sut.selectedCategory = .all
        let actualTotal = sut.getTotalSpentValue()
        let expectedTotal = ModelData.sampleTransactions.map({$0.amount}).reduce(0, +)
        XCTAssertEqual(actualTotal, expectedTotal)
    }
    
    func test_TotalSpent_All_WithOnePinnedTrans(){
        sut.selectedCategory = .all
        ModelData.sampleTransactions[0].isPinned = true
        let actualTotal = sut.getTotalSpentValue()
        let expectedTotal = ModelData.sampleTransactions.map({$0.amount}).reduce(0, +)
        XCTAssertNotEqual(actualTotal, expectedTotal)        
    }
    
    func test_TotalSpent_All_WithOnePinnedTransYes(){
        sut.selectedCategory = .all
        ModelData.sampleTransactions[0].isPinned = true
        let actualTotal = sut.getTotalSpentValue()
        let transaction = ModelData.sampleTransactions.filter{$0.isPinned == false}
        let expectedTotal = transaction.map({$0.amount}).reduce(0, +)
        XCTAssertEqual(actualTotal, expectedTotal)
    }
    
    
    func test_TotalSpent_Food(){
        sut.selectedCategory = .food
        let actualTotal = sut.getTotalSpentValue()
        
        let foodTransactions = ModelData.sampleTransactions.filter{$0.category == .food}
        let expectedTotal = foodTransactions.map({$0.amount}).reduce(0, +)
        XCTAssertEqual(actualTotal, expectedTotal)
    }
    
}
