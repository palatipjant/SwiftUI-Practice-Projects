//
//  MainView.swift
//  clock app
//
//  Created by Palatip Jantawong on 3/3/2567 BE.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            StopWatchView()
                .tabItem { Label("Stop Watch", systemImage: "stopwatch") }
            AlarmView()
                .tabItem { Label("Alarm", systemImage: "alarm") }
            TimerView()
                .tabItem { Label("Timer", systemImage: "timer") }
        }
    }
}

#Preview {
    MainView()
}
