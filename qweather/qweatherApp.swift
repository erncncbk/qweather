//
//  qweatherApp.swift
//  qweather
//
//  Created by Erencan on 10.03.2022.
//

import SwiftUI

@main
struct qweatherApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: viewModel)
        }
    }
}
