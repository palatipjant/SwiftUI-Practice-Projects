//
//  TimerView.swift
//  clock app
//
//  Created by Palatip Jantawong on 3/3/2567 BE.
//

import SwiftUI

struct TimerView: View {
    
    @State private var selectedHours = 0
    @State private var selectedMinutes = 0
    @State private var selectedSeconds = 0
    @State private var showPicker = true
    @State private var remainingTime = TimeInterval(0)
    @State private var timerRunning = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            if showPicker {
                HStack{
                    Picker("Hours", selection: $selectedHours) {
                        ForEach(0..<24) { i in
                            Text("\(i)h")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                    
                    Picker("Minutes", selection: $selectedMinutes) {
                        ForEach(0..<60) { i in
                            Text("\(i)m")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                    
                    Picker("Seconds", selection: $selectedSeconds) {
                        ForEach(0..<60) { i in
                            Text("\(i)s")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                }
                .padding()
                
                HStack{
                    Button(action: {
                        showPicker = true
                        timerRunning = false
                    }, label: {
                        Circle()
                            .foregroundStyle(.gray)
                            .frame(width: 90, height: 90)
                            .overlay {
                                Text("Cancel")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .bold()
                            }
                    }).padding()
                    
                    Spacer()
                    
                    Button(action: {
                        remainingTime = TimeInterval(selectedHours*60*60 + selectedMinutes*60 + selectedSeconds)
                        showPicker = false
                        timerRunning = true
                    }, label: {
                        Circle()
                            .foregroundStyle(.green)
                            .frame(width: 90, height: 90)
                            .overlay {
                                Text("Start")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .bold()
                            }
                    }).padding()
                }
            } else {
                
                ProgressView(value: calculateProgress())
                
                Text(timeString(time: remainingTime))
                    .font(.largeTitle)
                    .padding()
                    .padding(.bottom, 25)
                
                HStack{
                    Button(action: {
                        showPicker = true
                        timerRunning = false
                    }, label: {
                        Circle()
                            .foregroundStyle(.gray)
                            .frame(width: 90, height: 90)
                            .overlay{
                                Text("Cancel")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .bold()
                            }
                    }).padding()
                    
                    Spacer()
                    
                    Button(action: {
                        timerRunning.toggle()
                    }, label: {
                        Circle()
                            .foregroundStyle(timerRunning ? .green : .red)
                            .frame(width: 90, height: 90)
                            .overlay{
                                Text(timerRunning ? "Pause" : "Resume")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .bold()
                            }
                    }).padding()
                }
            }
        }
        .preferredColorScheme(.dark)
        .onReceive(timer, perform: { _ in
            if timerRunning {
                remainingTime -= 1
                if remainingTime == 0{
                    timerRunning = false
                    showPicker = true
                }
            }
        })
    }
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    func calculateProgress() -> Double{
        let progress = 1 - remainingTime / Double(selectedHours * 3600 + selectedMinutes * 60 + selectedSeconds)
        return progress
    }
}

#Preview {
    TimerView()
}
