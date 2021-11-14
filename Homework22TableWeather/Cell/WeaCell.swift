//
//  WeaCell.swift
//  Homework22TableWeather
//
//  Created by Максим Павлов on 18.05.21.
//

import UIKit

class WeaCell: UITableViewCell {
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(weather: WeatherClass){
        countryLabel.text = "\(weather.country)"
        cityLabel.text = "\(weather.city)"
        temperatureLabel.text = "\(weather.temperature)"
        speedLabel.text = "\(weather.wind)"
    }

    
}
