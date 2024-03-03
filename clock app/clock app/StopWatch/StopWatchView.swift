//
//  StopWatchView.swift
//  clock app
//
//  Created by Palatip Jantawong on 2/3/2567 BE.
//

import SwiftUI

struct StopWatchView: View {
    
    @State private var time = 0.0
    @State private var isRunning = false
    let timer = Timer.publish(every: 0.1,
                              on: .main,
                              in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(time, specifier: "%.1f")")
                .foregroundStyle(.white)
                .font(.system(size: 50))
                .padding()
            
            HStack{
                Button(action: {
                    time = 0.0
                    isRunning = false
                }, label: {
                    Circle()
                        .frame(width: 90, height: 90)
                        .foregroundStyle(.gray)
                        .overlay {
                            Text("Reset")
                                .foregroundStyle(.white)
                                .bold()
                        }
                })
                .padding()
                
                Spacer()
                
                Button(action: {
                    isRunning.toggle()
                }, label: {
                    Circle()
                        .frame(width: 90, height: 90)
                        .foregroundStyle(isRunning ? .red : .green)
                        .overlay{
                            Text(isRunning ? "Stop" : "Start")
                                .foregroundStyle(.white)
                                .bold()
                        }
                }).padding()
            }
        }
        .preferredColorScheme(.dark)
        .onReceive(timer) { _ in
            if isRunning == true {
                time += 0.1
            }
        }
    }
}

#Preview {
    StopWatchView()
}
