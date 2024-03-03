//
//  AddAlarmView.swift
//  clock app
//
//  Created by Palatip Jantawong on 3/3/2567 BE.
//

import SwiftUI

struct AddAlarmView: View {
    
    @Binding var alarms: [Alarm]
    @State private var date = Date()
    @State private var label = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                DatePicker("Select Time", 
                           selection: $date,
                           displayedComponents: [.hourAndMinute])
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                
                GroupBox {
                    TextField("Label", text: $label)
                        .multilineTextAlignment(.center)
                }.padding()
                
                Spacer()
            }
            .padding(.top, 50)
            .preferredColorScheme(.dark)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        alarms.append(Alarm(time: date, label: label, isOn: true))
                        dismiss()
                        
                    }, label: {
                        Text("Save")
                            .font(.title3)
                            .foregroundStyle(.orange)
                            .bold()
                    })
                }
            }
        }
    }
}

#Preview {
    AddAlarmView(alarms: Binding.constant([Alarm]()))
}
