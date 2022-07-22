//
//  TransactionView.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 20/06/22.
//

import SwiftUI

struct TransactionView: View {

    @State var transaction: TransactionModel
    var transactionDelegate:TransactionProtocol
    
    var body: some View {
        VStack {
            HStack {
                Text(transaction.category.rawValue)
                    .font(.headline)
                    .foregroundColor(transaction.category.color)
                Spacer()
                Image(systemName: transaction.isPinned ? "pin.slash.fill" : "pin.fill")
                
            }
            if(!transaction.isPinned){
                HStack {
                    transaction.image
                        .resizable()
                        .frame(
                            width: 60.0,
                            height: 60.0,
                            alignment: .top
                        )
                    
                    VStack(alignment: .leading) {
                        Text(transaction.name)
                            .secondary()
                        Text(transaction.accountName)
                            .tertiary()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("$\(transaction.amount.formatted())")
                            .bold()
                            .secondary()
                        Text(transaction.date.formatted)
                            .tertiary()
                    }
                }
            }
        }
        .padding(8.0)
        .background(Color.accentColor.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
        .onTapGesture {
            transaction.isPinned.toggle()
            transactionDelegate.updateTransactionPinStatus(transaction: transaction)
        }
    }
}

#if DEBUG
struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TransactionView(transaction: ModelData.sampleTransactions[0], transactionDelegate: TransactionListViewModel())
            TransactionView(transaction: ModelData.sampleTransactions[1], transactionDelegate:  TransactionListViewModel())
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif
