//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 19/06/22.
//

import SwiftUI

struct TransactionListView: View {
    @StateObject var viewModel = TransactionListViewModel()
    
    var body: some View {
        VStack{
            //Transaction Category view
            ScrollView (.horizontal, showsIndicators: false){
                HStack{
                    
                    ForEach(TransactionModel.Category.allCases){ category in
                        Button(action:{
                            viewModel.updateCategorizedTransaction(category: category)
                        }) {
                            Text(category.id)
                                .category()
                        }
                        .background(category.color)
                        .clipShape(Capsule())
                    }
                }
                .padding()
            }
            .background(Color.accentColor.opacity(0.8))
            
            //Transaction View
            List {
                ForEach(viewModel.transactions) { transaction in
                    TransactionView(transaction: transaction, transactionDelegate: viewModel)
                }
            }
            .animation(.easeIn)
            .listStyle(PlainListStyle())
            
            //Transaction summary View
            VStack{
                VStack {
                    HStack() {
                        Spacer()
                        Text(viewModel.selectedCategory.id)
                            .foregroundColor(viewModel.selectedCategory.color)
                            .font(.headline)
                    }
                    
                    HStack() {
                        Text("Total spent")
                            .secondary()
                        Spacer()
                        Text("$\(viewModel.totalSum.formatted())")
                            .bold()
                            .secondary()
                    }
                }.padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.accentColor, lineWidth: 2)
                    )
            }
            .padding(.leading, 8.0)
            .padding(.trailing, 8.0)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Transactions")
        .onAppear(perform: {
            viewModel.updateSumToView()
        })
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}
#endif
