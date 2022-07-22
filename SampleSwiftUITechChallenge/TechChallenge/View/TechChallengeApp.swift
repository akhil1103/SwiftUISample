//
//  TechChallengeApp.swift
//  TechChallenge
//
//  Created by Akhil Mittal on 20/06/22.
//

import SwiftUI

@main
struct TechChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    TransactionListView()
                }
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }
                .navigationViewStyle(.stack)
                
                NavigationView {
                    InsightsView()
                }
                .tabItem {
                    Label("Insights", systemImage: "chart.pie.fill")
                }
                .navigationViewStyle(.stack)
            }
        }
    }
}
