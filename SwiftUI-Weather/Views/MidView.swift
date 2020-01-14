//
//  MidView.swift
//  SwiftUI-Weather
//
//  Created by Yusuf ali cezik on 14.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import SwiftUI

struct MidView: View {
    @ObservedObject var forecastViewModel:ForecastViewModel
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("\(forecastViewModel.currentCity), \(self.forecastViewModel.currentCountry)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
                
                Text(self.forecastViewModel.weatherDay)
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                .bold()
            }
            Spacer()
        }
    }
}
