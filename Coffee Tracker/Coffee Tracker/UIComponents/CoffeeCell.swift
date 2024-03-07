//
//  CoffeeCell.swift
//  Coffee Tracker
//
//  Created by Palatip Jantawong on 7/3/2567 BE.
//

import SwiftUI

struct CoffeeCell: View {
    
    @State var amount: String
    @State var type: String
    @State var date: Date
    
    var body: some View {
        VStack{
            HStack {
                Text(amount)
                    .frame(width: 100)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.blue)
                VStack(alignment: .leading){
                    Text(type)
                        .font(.title2)
                    Text("\(date, style: .date)")
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                        
                }
                Spacer()
            }
        }
        .frame(width: 360, height: 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .gray, radius: 2, x: 0, y: 2)
    }
}

#Preview {
    CoffeeCell(amount: "0.0", type: "Robusta", date: Date())
}
