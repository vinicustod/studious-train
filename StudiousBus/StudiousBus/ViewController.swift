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
        print("Loaded view")
    }

    @objc func showMapView() {
        self.navigationController?.pushViewController(MapViewController(), animated: true)
    }


}

