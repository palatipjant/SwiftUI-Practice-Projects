//
//  AlarmView.swift
//  clock app
//
//  Created by Palatip Jantawong on 3/3/2567 BE.
//

import SwiftUI

struct AlarmView: View {
    
    @State private var alarms: [Alarm] = []
    @State private var showAddAlarmView = false
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(alarms) { alarm in
                    HStack{
                        VStack(alignment: .leading){
                            Text(alarm.time, style: .time)
                                .font(.largeTitle)
                                .foregroundStyle(alarm.isOn ? .white : .gray)
                            Text(alarm.label)
                                .foregroundStyle(alarm.isOn ? .white : .gray)
                        }
                        
                        Spacer()
                        
                        Toggle("", isOn: Binding<Bool>(get: {
                            alarm.isOn
                        }, set: { newValue in
                            if let index = alarms.firstIndex(of: alarm) {
                                alarms[index].isOn = newValue
                                
                            }
                        }))
                    }
                    .swipeActions(edge: .leading){
                        Button(action: {
                            if let index = alarms.firstIndex(of: alarm){
                                alarms.remove(at: index)
                            }
                        }, label: {
                            Image(systemName: "trash")
                        })
                    }
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            if let index = alarms.firstIndex(of: alarm) {
                                alarms[index].isOn.toggle()
                            }
                        }, label: {
                            Label(alarm.isOn ? "Turn Off" : "Turn On", systemImage: alarm.isOn ? "bell.slash.fill" : "bell.fill")
                        })
                        Button(action: {
                            if let index = alarms.firstIndex(of: alarm){
                                alarms.remove(at: index)
                            }
                        }, label: {
                            Label("Delete", systemImage: "trash ")
                        })
                    }))
                }
            }
            .navigationTitle("Alarm")
            .preferredColorScheme(.dark)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showAddAlarmView.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.orange)
                    })
                }
            }
            .sheet(isPresented: $showAddAlarmView, content: {
                AddAlarmView(alarms: $alarms)
            })
        }
    }
}

struct Alarm: Identifiable, Equatable{
    var id = UUID()
    var time: Date
    var label = ""
    var isOn: Bool
}

#Preview {
    AlarmView()
}
