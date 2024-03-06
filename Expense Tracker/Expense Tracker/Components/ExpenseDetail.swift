//
//  ExpenseDetail.swift
//  Expense Tracker
//
//  Created by Palatip Jantawong on 6/3/2567 BE.
//

import SwiftUI

struct ExpenseDetail: View {
    
    var amount: String
    var date: Date
    var name: String
    var type: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 350, height: 75)
                .foregroundStyle(.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            HStack(spacing: 16, content: {
                VStack(alignment: .leading, spacing: 4, content: {
                    Text(name)
                        .foregroundStyle(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(type)
                        .font(.system(size: 15))
                        .bold()
                        .foregroundStyle(.teal)
                    Text(date, style: .date)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }).padding()
                Spacer()
                
                Text("$\(amount)")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.red)
                    .padding()
            }).padding(.horizontal, 16)
        }
    }
}

#Preview {
    ExpenseDetail(amount: "1234", date: Date(), name: "Test Expense", type: "Food")
}
