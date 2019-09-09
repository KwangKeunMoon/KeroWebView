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
    }
    
    @IBAction func actionDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionSave(_ sender: Any) {
        UserDefaults.standard.set(self.locationTextField.text, forKey: "startURL")
        UserDefaults.standard.synchronize()
    }
}
