//
//  ViewController.swift
//  Test
//
//  Created by Afraz Siddiqui on 3/7/22.
//

import Glassfy
import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        imageView.image = UIImage(systemName: "lock")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Purchase", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    var observer: NSObjectProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        IAPManager.shared.getPermissions()

        observer = NotificationCenter.default.addObserver(forName: Notification.Name("gold"), object: nil, queue: .main) { [weak self] _ in
            self?.imageView.image = UIImage(systemName: "lock.open")
        }

        view.addSubview(imageView)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 220),
            imageView.widthAnchor.constraint(equalToConstant: 220),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 220),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        ])

        button.addTarget(self, action: #selector(purchase), for: .touchUpInside)
    }

    @objc private func purchase() {
        IAPManager.shared.getProduct { sku in
            print(sku.product.localizedTitle)
            print(sku.product.localizedDescription)
            print(sku.product.price)

            IAPManager.shared.purchase(sku: sku)
        }
    }
}

