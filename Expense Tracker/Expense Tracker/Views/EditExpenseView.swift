//
//  EditExpenseView.swift
//  Expense Tracker
//
//  Created by Palatip Jantawong on 4/3/2567 BE.
//

import SwiftUI

struct EditExpenseView: View {
    
    @AppStorage("darkMode") var isDarkMode = false

    @Environment(\.managedObjectContext) var manageObjContext
    @Environment(\.dismiss) var dismiss
    var expense: FetchedResults<Expense>.Element
    
    @State private var name = ""
    @State private var amount = ""
    @State private var selectedCategory: String? = nil
    
    let categories = ["Food", " Housing", "Transport", "Entertainment", "Utillities"]
    
    init(expense: FetchedResults<Expense>.Element) {
        self.expense = expense
        _name = State(initialValue: expense.name ?? "")
        _amount = State(initialValue: String(expense.amount))
        _selectedCategory = State(initialValue: expense.type)
    }
    
    var body: some View {
        VStack(spacing: 20){
                TextField("Name of Expense", text: $name)
                    .padding()
                    .foregroundStyle(.secondary)
                    .background(isDarkMode ? .black : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .padding(.top)
                TextField("Amount", text: $amount)
                    .padding()
                    .foregroundStyle(.secondary)
                    .background(isDarkMode ? .black : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    .padding(.top)
                
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16,  content: {
                    ForEach(categories[0...2], id:\.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }, label: {
                            Text(category)
                                .foregroundStyle(selectedCategory == category ? .white : .black)
                                .bold()
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(selectedCategory == category ? .blue : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        })
                    }
                })
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16,  content: {
                    ForEach(categories[3...4], id:\.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }, label: {
                            Text(category)
                                .foregroundStyle(selectedCategory == category ? .white : .black)
                                .bold()
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(selectedCategory == category ? .blue : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        })
                    }
                })
                
                Button {
                    expense.amount = Double(amount) ?? 0
                    expense.date = Date()
                    expense.id = UUID()
                    expense.name = name
                    expense.type = selectedCategory
                    
                    do {
                        try manageObjContext.save()
                        print("Data saved Successfully!")
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError)")
                    }
                    
                    dismiss()
                } label: {
                    Text("Save!")
                        .foregroundStyle(.white)
                        .bold()
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                }.padding()
            Spacer()
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Expense")
        .padding(.horizontal)
    }
}
