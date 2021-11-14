//
//  ViewController.swift
//  Homework22TableWeather
//
//  Created by Максим Павлов on 15.05.21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var weather: [WeatherClass] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        tableView.dataSource = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        weather = RealmManager.shared.realmObject()
        tableView.reloadData()
    }

    func registerCell() {
        let nib = UINib(nibName: String(describing: WeaCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String( describing: WeaCell.self))
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: String(describing: MapViewController.self))
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WeaCell.self), for: indexPath)
        guard let weatherCell = cell as? WeaCell else { return cell }
        weatherCell.setupCell(weather: weather[indexPath.row])
        return weatherCell
    }
}


