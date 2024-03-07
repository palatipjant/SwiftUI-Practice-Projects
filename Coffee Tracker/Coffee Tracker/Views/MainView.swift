//
//  MainView.swift
//  Coffee Tracker
//
//  Created by Palatip Jantawong on 7/3/2567 BE.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.managedObjectContext) var manageObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var coffee: FetchedResults<Coffee>
    
    @State var isShowingAdd = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(coffee) { coffee in
                    CoffeeCell(amount: coffee.amount ?? "0.0", type: coffee.type ?? "NIL", date: coffee.date ?? Date())
                        .contextMenu(ContextMenu(menuItems: {
                            Button(action: {
                                manageObjContext.delete(coffee)
                            }, label: {
                                Label("Delete", systemImage: "trash")
                            })
                        }))
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        manageObjContext.delete(coffee[index])
                    }
                    try! manageObjContext.save()
                })
            }
            .listStyle(.plain)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingAdd = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
        }.sheet(isPresented: $isShowingAdd, content: {
            AddCoffeeView(isShowingAdd: $isShowingAdd)
        })
    }
}

#Preview {
    MainView()
}
