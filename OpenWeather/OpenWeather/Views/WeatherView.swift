//
//  WeatherView.swift
//  OpenWeather
//
//  Created by Palatip Jantawong on 10/3/2567 BE.
//

import SwiftUI

struct WeatherView: View {
    
    @State var weather: WeatherResponse
    @State private var isAnimating = false
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .leading){
                VStack{
                    // search bar functionallity
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("\(weather.name), \(weather.sys.country)")
                            .foregroundStyle(.black)
                            .bold()
                            .font(.title)
                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                            .foregroundStyle(.black)
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                    
                    Spacer()
                    
                    VStack{
                        HStack{
                            VStack(spacing: 20, content: {
                                Image(systemName: weather.conditionName)
                                    .foregroundStyle(.black)
                                    .font(.system(size: 40))
                                Text(weather.weather[0].description.capitalized)
                            })
                            .frame(width: 150, alignment: .leading)
                            Spacer()
                            Text(weather.main.temp.roundDouble() + "°")
                                .font(.system(size: 100))
                                .bold()
                                .padding()
                                .foregroundStyle(.black)
                        }
                        Image("londonimage")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .frame(maxWidth: .infinity, maxHeight: 250)
                            .ignoresSafeArea()
                            .opacity(isAnimating ? 1 : 0)
                            .offset(y: isAnimating ? 0 : 40)
                            .animation(.easeOut, value: isAnimating)
                        
                        Spacer()
                        
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Spacer()
                    Divider()
                    VStack(alignment: .leading, spacing: 20, content: {
                        Text("Weather now")
                            .bold()
                            .padding(.bottom)
                            .foregroundStyle(.black)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                WeatherRow(logo: "thermometer", 
                                           name: "Min temp",
                                           value: weather.main.tempMin.roundDouble() + "°")
                                WeatherRow(logo: "thermometer",
                                           name: "Max temp",
                                           value: weather.main.tempMax.roundDouble() + "°")
                                WeatherRow(logo: "wind",
                                           name: "Wind Speed",
                                           value: weather.wind.speed.roundDouble() + "m/s")
                                WeatherRow(logo: "humidity",
                                           name: "Humidity",
                                           value: weather.main.humidity.roundDouble() + "%")
                            }
                        }
                        Spacer()
                    })
                    .frame(maxWidth: .infinity, maxHeight: 125, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                }
            }
            .onAppear{
                isAnimating = true
            }
            .ignoresSafeArea(edges: .bottom)
            .background(.white)
            
        }
    }
}
