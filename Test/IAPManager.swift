//
//  IAPManager.swift
//  Test
//
//  Created by Afraz Siddiqui on 3/7/22.
//

import Foundation
import Glassfy

final class IAPManager {
    static let shared = IAPManager()

    private init() {}

    enum Product: String {
        case gold

        var sku: String {
            return rawValue
        }
    }

    func configure() {
        Glassfy.initialize(apiKey: "YOUR API KEY HERE")
    }

    func getProduct(completion: @escaping (Glassfy.Sku) -> Void) {
        Glassfy.sku(id: Product.gold.rawValue) { sku, error in
            guard let sku = sku, error == nil else {
                return
            }
            completion(sku)
        }
    }

    func purchase(sku: Glassfy.Sku) {
        Glassfy.purchase(sku: sku) { transaction, error in
            guard let t = transaction, error == nil else {
                return
            }

            if t.permissions[Product.gold.rawValue]?.isValid == true {
                NotificationCenter.default.post(
                    name: Notification.Name("gold"),
                    object: nil
                )
            }
        }
    }

    func getPermissions() {
        Glassfy.permissions { permissions, error in
            guard let permissions = permissions, error == nil else {
                return
            }

            if permissions[Product.gold.rawValue]?.isValid == true {
                NotificationCenter.default.post(
                    name: Notification.Name("gold"),
                    object: nil
                )
            }
        }
    }

    func restorePurchases() {
        Glassfy.restorePurchases { permissions, error in
            guard let permissions = permissions, error == nil else {
                return
            }

            if permissions[Product.gold.rawValue]?.isValid == true {
                NotificationCenter.default.post(
                    name: Notification.Name("gold"),
                    object: nil
                )
            }
        }
    }
}
