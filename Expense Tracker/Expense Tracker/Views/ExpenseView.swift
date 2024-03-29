//
//  ExpenseView.swift
//  Expense Tracker
//
//  Created by Palatip Jantawong on 4/3/2567 BE.
//

import SwiftUI

struct ExpenseView: View {
    
    @AppStorage("darkMode") var isDarkMode = false

    @Environment(\.managedObjectContext) private var manageObjContext
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
                            NavigationLink(destination: EditExpenseView(expense: expense)) {
                                ExpenseDetail(amount: String(expense.amount),
                                              date: expense.date!,
                                              name: expense.name!,
                                              type: expense.type ?? "Transportation")
                            }
                            .contextMenu(ContextMenu(menuItems: {
                                Button {
                                    deleteExpense(expense: expense)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }))
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding()
            .navigationTitle("Expenses")
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    func deleteExpense(expense: Expense) {
        withAnimation {
            manageObjContext.delete(expense)
            do {
                try manageObjContext.save()
                print("Data saved Successfully!")
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError)")
            }
        }
    }
}

#Preview {
    ExpenseView()
}
