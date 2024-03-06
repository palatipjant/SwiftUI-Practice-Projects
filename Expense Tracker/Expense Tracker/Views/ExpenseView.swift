//
//  ExpenseView.swift
//  Expense Tracker
//
//  Created by Palatip Jantawong on 4/3/2567 BE.
//

import SwiftUI

struct ExpenseView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var expenses: FetchedResults<Expense>
    
    var body: some View {
        NavigationStack{
            VStack{
                ScrollView(.vertical) {
                    VStack{
                        HStack{
                            Text("Welcome!")
                                .font(.title)
                            Spacer()
                        }
                        ForEach(expenses) { expense in
                            ExpenseDetail(amount: String(expense.amount),
                                          date: expense.date!,
                                          name: expense.name!,
                                          type: expense.type ?? "Transportation")
                        }                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding()
            .navigationTitle("Expenses")
        }
    }
}

#Preview {
    ExpenseView()
}
