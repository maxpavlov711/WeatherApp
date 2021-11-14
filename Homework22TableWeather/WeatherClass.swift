//
//  Weather.swift
//  Homework22TableWeather
//
//  Created by Максим Павлов on 16.05.21.
//

import Foundation
import RealmSwift

class WeatherClass: Object {
    @objc dynamic var country: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var temperature: String = ""
    @objc dynamic var wind: String = ""
    
    convenience init(country: String, city: String, temperature: String, wind: String) {
        
        self.init()
        self.country = country
        self.city = city
        self.temperature = temperature
        self.wind = wind
        
    }
}
