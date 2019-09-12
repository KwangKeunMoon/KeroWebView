//
//  SettingViewController.swift
//  KeroWeb
//
//  Created by fla.m on 09/09/2019.
//  Copyright © 2019 문광근. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlString = UserDefaults.standard.value(forKey: "startURL") as? String {
            locationTextField.text = urlString
        }
    }
    
    @IBAction func actionDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionSave(_ sender: Any) {
        UserDefaults.standard.set(self.locationTextField.text, forKey: "startURL")
        UserDefaults.standard.synchronize()
        
        let alert = UIAlertController(title: nil, message: "url-> \(locationTextField.text ?? " ")\nsaved.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
