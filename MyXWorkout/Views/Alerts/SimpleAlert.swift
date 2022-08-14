//
//  SimpleAlert.swift
//  MyXWorkout
//
//  Created by Test on 08/08/22.
//

import UIKit

extension UIViewController {
    
    func alertOk(title: String, message: String?) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        present(alertController, animated: true)
    }
}
