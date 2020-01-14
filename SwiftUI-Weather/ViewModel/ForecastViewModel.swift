//
//  ForecastViewModel.swift
//  SwiftUI-Weather
//
//  Created by Yusuf ali cezik on 14.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import Combine
import SwiftUI

class ForecastViewModel: ObservableObject {
    var weatherService:Services!
    var cityName:String = "Boston"
    
    @Published var weatherForecast = ForeCastWeatherResponse()
    
    init(){
        self.weatherService = Services()
    }
    
    var currentCity: String {
        if let city = self.weatherForecast.city?.name{
            return city
        }else{
            return ""
        }
    }
    
    var currentCountry : String {
        if let country = self.weatherForecast.city?.country{
            return country
        }else{
            return ""
        }
    }
    
    var temperature : String {
        if let temp = self.weatherForecast.list?.first?.temp?.day{
            let formattedString = String(format: "%.0f", temp)
            return formattedString + "°"
         }else{
             return ""
         }
     }
    
    var weatherDay:String{
        if let day = self.weatherForecast.list?.first?.dt{
            let formattedDay = Helper().timeConverter(timeStamp: day, isDay: false)
            return formattedDay
        }else{
            return ""
        }
    }
    
    var weatherDescription:String{
        if let description = self.weatherForecast.list?.first?.weather?.first?.description{
            let formattedDesc = description.capitalized(with: .current)
             return formattedDesc
         }else{
             return ""
         }
     }
    
    
    var maxSpeed:String{
        if let max = self.weatherForecast.list?.first?.temp?.max{
            let formattedMax = String(format: "%.0f", (max))
            return formattedMax + "°"
         }else{
             return ""
         }
     }
    
    var wind:String{
        if let wind = self.weatherForecast.list?.first?.speed{
               let formattedMax = String(format: "%.1f", (wind))
               return formattedMax + "mi/h"
            }else{
                return ""
            }
        }
    
    
    func searchCity(){
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeatherForecast(by: city)
        }
    }
    
    func fetchWeatherForecast(by city:String){
        self.weatherService.getWeatherData(city: city) { (forecast) in
            if let forecast = forecast{
                DispatchQueue.main.async {
                    self.weatherForecast = forecast
                }
            }
        }
    }
    
    func getForecastList()->[MainForecastParams]{
        if let mList = self.weatherForecast.list{
            return mList
        }else{
            return []
        }
    }
}

