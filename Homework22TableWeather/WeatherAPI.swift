//
//  WeatherAPI.swift
//  Homework22TableWeather
//
//  Created by Максим Павлов on 17.05.21.
//

import Foundation
import Moya

enum WeatherAPI {
    case getWeather(lat: Double, lon: Double)
}

extension WeatherAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/")!
    }
    
    var path: String {
        return "/data/2.5/weather"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        Data()
    }
    
    var parametrs: [String: Any]? {
        var params = [String: Any]()
        switch self {
        case .getWeather(let lat, let lon):
            params["lat"] = lat
            params["lon"] = lon
            params["appid"] = "5783752d7f28ef61891d4254f4fe85ff"
            params["units"] = "metric"
            params["lang"] = "ru"
        }
        
        return params
    }
    
    var task: Task {
        guard let params = parametrs else {
            return .requestPlain
        }
        return .requestParameters(parameters: params, encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
    }
}
