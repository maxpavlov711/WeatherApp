//
//  NetworkManager.swift
//  Homework22TableWeather
//
//  Created by Максим Павлов on 17.05.21.
//

import Foundation
import Moya
import Moya_ObjectMapper

class NetworkManager {
    static let shared = NetworkManager()
    private let provider = MoyaProvider<WeatherAPI>(plugins: [NetworkLoggerPlugin()])
    private init() {}
    
    func getWeater(lat: Double, lot: Double, success: @escaping (WeatherData) -> Void, failure: @escaping () -> Void) {
        provider.request(.getWeather(lat: lat, lon: lot)) { (result) in
            switch result {
            case let .success(response):
                guard let weather = try? response.mapObject(WeatherData.self) else {
                    failure()
                    return
                }
                success(weather)
            case .failure(let error):
                failure()
            }
        }
    }
}
