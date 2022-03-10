//
//  ContentView.swift
//  qweather
//
//  Created by Erencan on 10.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityText: "Izmir , TR")
                
                MainViewStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 5: 13)
                HStack(spacing:15){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 16)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 15)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 12)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 10)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sunset.fill", temperature: 6)
                    WeatherDayView(dayOfWeek: "SAN", imageName: "snow", temperature: 8)

                }
                Spacer()

                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek:String
    var imageName:String
    var temperature:Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16,weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray: Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint:  .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityText: String
    var body: some View {
        Text(cityText)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .frame(width: 150, height: 50,alignment: .top).padding()
    }
}

struct MainViewStatusView:View{
    var imageName:String
    var temperature:Int
    var body: some View {
        VStack(spacing:5){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 150, height: 150, alignment: .top)
            Text("\(temperature)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom,30)
    }
   
}

