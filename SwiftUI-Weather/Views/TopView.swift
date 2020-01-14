//
//  TopView.swift
//  SwiftUI-Weather
//
//  Created by Yusuf ali cezik on 14.01.2020.
//  Copyright © 2020 Yusuf Ali Cezik. All rights reserved.
//

import SwiftUI

let UIWidth = UIScreen.main.bounds.width
let UIHeight = UIScreen.main.bounds.height
struct TopView: View {
    @State var showField:Bool = false
    @ObservedObject var forecastViewModel:ForecastViewModel
    
    var body: some View {
        ZStack{
            ZStack(alignment: .leading){
                TextField("Enter City Name", text: self.$forecastViewModel.cityName){
                    self.forecastViewModel.searchCity()
                }.padding(.all, 10)
                    .frame(width: UIWidth - 50, height: 50)
                    .background(Color("lightBlue"))
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    .offset(x: self.showField ? 0 : (-UIWidth / 2 - 180))
                    .animation(.spring())
                
                Image(systemName: "magnifyingglass.circle.fill")
                .resizable()
                    .frame(width:40, height: 40)
                    .foregroundColor(.white)
                    .offset(x: self.showField ? (UIWidth - 90) : -20)
                    .animation(.spring())
                    .onTapGesture {
                        if self.showField == true{
                            self.fetch()
                        }
                        self.showField.toggle()
                }
            }.onAppear(perform: fetch)
        }.padding(.top, 0)
    }
    
    private func fetch(){
        self.forecastViewModel.searchCity()
    }
}
