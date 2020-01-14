//
//  Service.swift
//  SwiftUI-Weather
//
//  Created by Yusuf ali cezik on 14.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import Foundation

class Services {
    let apiID = "ed60fcfbd110ee65c7150605ea8aceea"
    func getWeatherData(city:String, completion: @escaping (ForeCastWeatherResponse?)->()){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily?q=\(city)&appid=ed60fcfbd110ee65c7150605ea8aceea") else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(ForeCastWeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse{
                completion(weatherResponse)
            }else{
                completion(nil)
            }
        }.resume()
    }
}
