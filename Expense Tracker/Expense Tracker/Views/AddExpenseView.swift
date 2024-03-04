//
//  AddExoense.swift
//  Expense Tracker
//
//  Created by Palatip Jantawong on 4/3/2567 BE.
//

import SwiftUI

struct AddExpenseView: View {
    
    @Environment(\.managedObjectContext) var manageObjContext
    
    @State private var name = ""
    @State private var amount = ""
    @State private var isExpenseAdded = false
    @State private var selectedCategiry: String? = nil
    
    let categories = ["Food", " Housing", "Transport", "Entertainment", "Utillities"]
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                TextField("Name of Expense", text: $name)
                    .padding()
                    .foregroundStyle(.secondary)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                TextField("Amount", text: $amount)
                    .padding()
                    .foregroundStyle(.secondary)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16,  content: {
                    ForEach(categories[0...2], id:\.self) { category in
                        Button(action: {
                            selectedCategiry = category
                        }, label: {
                            Text(category)
                                .foregroundStyle(selectedCategiry == category ? .white : .black)
                                .bold()
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(selectedCategiry == category ? .blue : .white)
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
                            selectedCategiry = category
                        }, label: {
                            Text(category)
                                .foregroundStyle(selectedCategiry == category ? .white : .black)
                                .bold()
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(selectedCategiry == category ? .blue : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        })
                    }
                })
                Button {
                    let expense = Expense(context: manageObjContext)
                    expense.amount = Double(amount) ?? 0
                    expense.date = Date()
                    expense.id = UUID()
                    expense.name = name
                    expense.type = selectedCategiry
                    
                    do {
                        try manageObjContext.save()
                        print("Data saved Successfully!")
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError)")
                    }
                    
                    isExpenseAdded = true
                    
                } label: {
                    Text("Add Expense")
                        .foregroundStyle(.white)
                        .bold()
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                }.padding()
                Spacer()

            }
            .padding(.horizontal)
            .navigationTitle("Add Expense")
            .alert("Expense Added", isPresented: $isExpenseAdded) {
                Button {
                    isExpenseAdded = false
                    name = ""
                    amount = ""
                    selectedCategiry = nil
                } label: {
                    Text("Ok")
                }

            }
        }
    }
}

#Preview {
    AddExpenseView()
}
