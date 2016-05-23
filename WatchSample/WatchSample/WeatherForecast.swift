//
//  Weather.swift
//  WatchSample
//
//  Created by Hari Kunwar on 5/19/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import UIKit

enum Weather {
    case Sunny
    case Cloudy
    case Rainy
    case Snowy
}

enum TemperatureType {
    case Hot
    case Warm
    case Normal
    case Cold
    case Freezing
}

class WeatherForecast {
    var date: NSDate
    var weatherType: Weather
    var temperature: Int
    var temperatureType: TemperatureType
    
    init(date: NSDate, temperature: Int, weatherType: Weather) {
        self.date = date
        self.temperature = temperature
        self.weatherType = weatherType

        switch temperature {
        case let x where x > 90:
                self.temperatureType = .Hot
        case let x where 80...90 ~= x:
            self.temperatureType = .Warm
        case let x where 32...50 ~= x:
            self.temperatureType = .Cold
        case let x where x < 32:
            self.temperatureType = .Freezing
        default:
            self.temperatureType = .Normal
        }
    }
    
    convenience init(dictionary: [String: String], formatter: NSDateFormatter) {
        // Get forecast date
        var forecastDate = NSDate()
        if let dateString = dictionary["date"] {
            if let date = formatter.dateFromString(dateString) {
                forecastDate = date
            }
        }
        
        
        // Get temperature
        var temperature = 0
        if let temperatureString = dictionary["temperature"] {
            if let temp = Int(temperatureString) {
                temperature = temp
            }
        }
        
        // Get weather
        var weather: Weather = .Sunny
        if let weatherString = dictionary["weather"] {
            switch weatherString.lowercaseString {
            case "sunny":
                weather = .Sunny
            case "cloudy":
                weather = .Cloudy
            case "rainy":
                weather = .Rainy
            case "snowy":
                weather = .Snowy
            default:
                weather = .Sunny
            }
        }
        
        self.init(date: forecastDate, temperature: temperature, weatherType: weather)
    }
    
    class func weatherForecasts() -> [WeatherForecast] {
        var forecasts = [WeatherForecast]()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        
        if let path = NSBundle.mainBundle().pathForResource("weather", ofType: "json"), let data = NSData(contentsOfFile: path) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [Dictionary<String, String>]
                for dict in json {
                    let forecast = WeatherForecast(dictionary: dict, formatter: formatter)
                    forecasts.append(forecast)
                }
            } catch {
                print(error)
            }
        }
        
        return forecasts
    }
}
