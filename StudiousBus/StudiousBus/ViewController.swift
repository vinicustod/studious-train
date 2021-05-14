//
//  ViewController.swift
//  StudiousBus
//
//  Created by vinicius.custodio on 11/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false

        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        button.setTitle("MapView", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(self.showMapView), for: .touchUpInside)

        let secondButton = UIButton()
        view.addSubview(secondButton)

        secondButton.translatesAutoresizingMaskIntoConstraints = false

        secondButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        secondButton.setTitle("Google Maps", for: .normal)
        secondButton.setTitleColor(.red, for: .normal)
        secondButton.addTarget(self, action: #selector(self.showGoogleMaps), for: .touchUpInside)
    }


    @objc func showGoogleMaps() {
        self.navigationController?.pushViewController(GMSViewController(), animated: true)
    }

    @objc func showMapView() {
        self.navigationController?.pushViewController(MapViewController(), animated: true)
    }


}

