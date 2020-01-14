//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Yusuf ali cezik on 14.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var showView:Bool = false
    @ObservedObject var forecastViewModel: ForecastViewModel
    
    init(){
        self.forecastViewModel = ForecastViewModel()
    }
    
    var body: some View {
        ZStack{
            BackSplash()
            VStack(alignment: .leading){
                TopView(showField: self.showView, forecastViewModel: self.forecastViewModel)
                MidView(forecastViewModel: self.forecastViewModel)
            }
            
            VStack(alignment: .center, spacing: 8){
                Image(systemName: Helper().showWeatherIcon(item: forecastViewModel.weatherForecast))
                    .resizable()
                    .frame(width: 160, height: 160, alignment: .center)
                    .foregroundColor(.white)
                
                CurrentTempView(forecastViewModel: self.forecastViewModel)
                
                Text("7-Day Weather Forecast")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.all, 20)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(self.forecastViewModel.getForecastList(), id: \.dt){ forecast in
                            BottomScrollForecast(forecastData: forecast)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
