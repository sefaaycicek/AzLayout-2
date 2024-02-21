//
//  BaseViewController.swift
//  AzLayout
//
//  Created by Sefa Aycicek on 21.02.2024.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showAlert(title: String, message: String, actions : ((_ alertController : UIAlertController)->())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let actions = actions {
            actions(alertController)
        }
        
        present(alertController, animated: true)
    }

}
