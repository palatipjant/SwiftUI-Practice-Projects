//
//  MainView.swift
//  Expense Tracker
//
//  Created by Palatip Jantawong on 4/3/2567 BE.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ExpenseView().tabItem { Label("Expense", systemImage: "dollarsign") }
            AddExpenseView().tabItem { Label("Add Expense", systemImage: "plus") }
            SettingsView().tabItem { Label("Settings", systemImage: "gear") }
        }
    }
}

#Preview {
    MainView()
}
