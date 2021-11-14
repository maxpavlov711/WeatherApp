//
//  MapViewController.swift
//  Homework22TableWeather
//
//  Created by Максим Павлов on 16.05.21.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func saveButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        NetworkManager.shared.getWeater(lat: coordinate.latitude,
                                        lot: coordinate.longitude,
                                        success: { weatherData in
                                            
                                            let mainWeather: WeatherClass = WeatherClass()
                                            guard let temp = weatherData.main?.temp else { return }
                                            guard let place = weatherData.system?.country else { return }
                                            guard let wind = weatherData.wind?.speed else { return }
                                            let city = weatherData.name 
                                            mainWeather.temperature = String(temp)
                                            mainWeather.country = place
                                            mainWeather.city = city
                                            mainWeather.wind = String(wind)
                                            RealmManager.shared.writeObject(weather: mainWeather)
                                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                    guard let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
                                            self.navigationController?.pushViewController(vc, animated: true)
//                                            let alert = UIAlertController(title: "Погода в выбранном месте", message: "Страна - \(place), Город - \(weatherData.name), Температура - \(temp)ºC, Скорость ветра - \(wind)м/cек", preferredStyle: .alert)
//                                            
//                                            
//                                            
//                                            let okAction = UIAlertAction(title: "Другое место", style: .default, handler: nil)
//                                            var saveAction = UIAlertAction(title: "Сохранить", style: .default, handler: nil)
//                                            let weatherClass = WeatherClass(country: place, city: weatherData.name, temperature: String(temp), wind: String(wind))
//                                            RealmManager.shared.writeObject(weather: weatherClass)
//                                            alert.addAction(okAction)
//                                            alert.addAction(saveAction)
//                                           
//                                            self.present(alert, animated: true)
                                        },
                                        failure: {
                                            print("Не успех")
                                        })
    }
}
