//
//  WeatherInterfaceController.swift
//  WatchSample
//
//  Created by Hari Kunwar on 5/19/16.
//  Copyright © 2016 Learning. All rights reserved.
//

import WatchKit
import Foundation


class WeatherInterfaceController: WKInterfaceController {
    @IBOutlet var imageView: WKInterfaceImage!
    @IBOutlet var temperatureLabel: WKInterfaceLabel!
    @IBOutlet var weekDayLabel: WKInterfaceLabel!
    @IBOutlet var dateLabel: WKInterfaceLabel!
    
    var weatherIndex = 0
    
    var weatherForecast: WeatherForecast? {
        didSet {
            if let forecast = weatherForecast {
                var imageName = ""
                switch forecast.weatherType {
                case .Sunny:
                    imageName = "sunny"
                case .Cloudy:
                    imageName = "cloudy"
                case .Rainy:
                    imageName = "rainy"
                case .Snowy:
                    imageName = "snowy"
                }
                
                imageView.setImage(UIImage(named: imageName))
                temperatureLabel.setText(String(forecast.temperature))
                
                let formatter = NSDateFormatter()
                formatter.dateFormat = "EEEE"
                let weekDay = formatter.stringFromDate(forecast.date)
                weekDayLabel.setText(weekDay)
                
                formatter.dateFormat = "dd MMM, yyyy"
                let date = formatter.stringFromDate(forecast.date)
                dateLabel.setText(date)
            }
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let index = context as? Int {
            weatherIndex = index
        }
        
        self.weatherForecast = WeatherForecast.weatherForecasts()[weatherIndex]
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        return weatherIndex + 1
    }
    
}
