//
//  AddCoffeeView.swift
//  Coffee Tracker
//
//  Created by Palatip Jantawong on 7/3/2567 BE.
//

import SwiftUI

struct AddCoffeeView: View {
    
    @State private var amount = ""
    @State private var type = ""
    
    let categories = ["Arabica", "Robusta", "Excelsa", "Liberica"]
    
    @Binding var isShowingAdd: Bool
    
    @Environment(\.managedObjectContext) var manageObjContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Amount", text: $amount)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    
                Text("Type")
                    .padding()
                
                Picker("PickerType", selection: $type) {
                    ForEach(categories, id:\.self) { type in
                        Text(type).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Button(action: {
                    let coffee = Coffee(context: manageObjContext)
                    coffee.id = UUID()
                    coffee.amount = amount
                    coffee.type = type
                    coffee.date = Date()
                    
                    do {
                        try manageObjContext.save()
                        print("save success")
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error: \(nsError)")
                    }
                    
                    isShowingAdd.toggle()
                }, label: {
                    Rectangle()
                        .frame(width: 350, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        .overlay {
                            Text("Add Intake")
                                .foregroundStyle(.white)
                        }
                }).padding(.vertical, 30)
                Spacer()
            }
            .navigationTitle("Add Coffee Intake")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Done")
                    })
                }
            })
            .padding(.top, 30)
        }
    }
}

#Preview {
    AddCoffeeView(isShowingAdd: .constant(true))
}
