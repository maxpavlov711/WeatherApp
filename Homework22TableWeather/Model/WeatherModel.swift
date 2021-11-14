//
//  WeatherModel.swift
//  Homework22TableWeather
//
//  Created by Максим Павлов on 17.05.21.
//

import Foundation
import ObjectMapper

class WeatherData: Mappable {

    var coord: Coord?
    var weather: [Weather]?
    var main: Main?
    var wind: Wind?
    var clouds: Clouds?
    var system: System?
    var base = ""
    var visibility = 0
    var name = ""
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        coord         <- map["coord"]
        weather       <- map["weather"]
        main          <- map["main"]
        wind          <- map["wind"]
        clouds        <- map["clouds"]
        system        <- map["sys"]
        base          <- map["base"]
        visibility    <- map["visibility"]
        name          <- map["name"]
    }
}

class Coord: Mappable {
    var lat: Double = 0
    var lot: Double = 0
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        lat           <- map["lat"]
        lot           <- map["lot"]
    }
}

class Weather: Mappable {
    var id = 0
    var main = ""
    var description = ""
    var icon = ""
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id            <- map["id"]
        main          <- map["main"]
        description   <- map["description"]
        icon          <- map["icon"]
    }
}

class Main: Mappable {
    var temp = 0.0
    var feelsLike = 0.0
    var tempMin = 0.0
    var tempMax = 0.0
    var pressure = 0
    var humidity = 0
    var seaLavel = 0
    var grndLevel = 0
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        temp                 <- map["temp"]
        feelsLike            <- map["feels_like"]
        tempMin              <- map["temp_min"]
        tempMax              <- map["temp_max"]
        pressure             <- map["pressure"]
        humidity             <- map["humidity"]
        seaLavel             <- map["sea_level"]
        grndLevel            <- map["grnd_level"]
    }
}

class Wind: Mappable {
    var speed = 0.0
    var deg = 0
    var gusr = 0.0
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        speed            <- map["speed"]
        deg              <- map["deg"]
        gusr             <- map["gusr"]
    }
}

class Clouds: Mappable {
    var all = 0
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        all        <- map["all"]
    }
}

class System: Mappable {
    var country = ""
    var sunrise = ""
    var sunset = ""
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        country   <- map["country"]
        sunrise   <- map["sunrise"]
        sunset    <- map["sunset"]
    }
}



