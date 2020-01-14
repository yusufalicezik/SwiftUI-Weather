//
//  CurrentTempView.swift
//  SwiftUI-Weather
//
//  Created by Yusuf ali cezik on 14.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import SwiftUI

struct CurrentTempView: View {
    @ObservedObject var forecastViewModel: ForecastViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text(self.forecastViewModel.temperature)
                    .font(.system(size: 34))
                    .foregroundColor(.white)
                .bold()
                
                Text(self.forecastViewModel.weatherDescription)
                    .foregroundColor(Color("secondary"))
            }
            
            HStack(spacing: 6){
                
                Text(self.forecastViewModel.wind)
                .bold()
                    .foregroundColor(Color("secondary"))
                
            }
        }
    }
}
