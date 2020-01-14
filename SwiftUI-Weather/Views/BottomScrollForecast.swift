//
//  BottomScrollForecast.swift
//  SwiftUI-Weather
//
//  Created by Yusuf ali cezik on 14.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import SwiftUI

struct BottomScrollForecast: View {
    let forecastData : MainForecastParams
    var body: some View {
        ZStack{
            ZStack(alignment: .topLeading){
                Text(String(Helper().timeConverter(timeStamp: forecastData.dt!, isDay: true)))
                    .foregroundColor(Color("icons"))
            }.offset(y: -60)
            
            HStack{
                Image(systemName: Helper().showWeatherIcon(item: forecastData))
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color("secondary"))
                    .background(RoundedRectangle(cornerRadius: 60)
                        .frame(width: 90, height: 90)
                        .foregroundColor(Color("gradient2")))
                    .padding(.all, 20)
                    .offset(x: -20)
                
                
                VStack(alignment: .leading, spacing: 5){
                    Text(String(format: "%.0f",
                                (forecastData.temp?.min)!) + "C")
                        .foregroundColor(.gray)
                    
                    Image(systemName: "arrow.down")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                    
                    
                    HStack{
                        Text(String(format: "%.0f",
                                    (forecastData.temp?.max)!) + "C")
                            .foregroundColor(.gray)
                        
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                    
                    Text("Win: \(String(format: "%.1f", forecastData.speed!)) mi/h")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
            }
        }.frame(width: 200, height: 170)
            .background(Color.white)
            .cornerRadius(30)
            .padding(.leading, 15)
    }
}
