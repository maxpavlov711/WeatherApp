//
//  RealmManager.swift
//  Homework22TableWeather
//
//  Created by Максим Павлов on 15.05.21.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    let realm = try! Realm()
    
    private init() {}
    
    func writeObject(weather: WeatherClass){
        try! realm.write{
            realm.add(weather)
        }
    }
    
    func realmObject() -> [WeatherClass]{
        return Array(realm.objects(WeatherClass.self))
    }
}
