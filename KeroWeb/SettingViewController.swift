//
//  SettingViewController.swift
//  KeroWeb
//
//  Created by fla.m on 09/09/2019.
//  Copyright © 2019 문광근. All rights reserved.
//

import UIKit

protocol SettingViewControllerDelegate: class {
    func onSaveComplete()
}

class SettingViewController: UIViewController {
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var newWindowSwitch: UISwitch!
    
    weak var delegate: SettingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlString = UserDefaults.standard.value(forKey: "startURL") as? String {
            locationTextField.text = urlString
        }
        
        self.newWindowSwitch.isOn = false
        if let isNewWindow = UserDefaults.standard.value(forKey: "newWindow") as? String {
            self.newWindowSwitch.isOn = isNewWindow == "true" ? true : false
        }
    }
    
    @IBAction func actionDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionSave(_ sender: Any) {
        if self.locationTextField.text?.isEmpty == true {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        UserDefaults.standard.set(self.locationTextField.text, forKey: "startURL")
        UserDefaults.standard.synchronize()
        
        delegate?.onSaveComplete()
        
        let alert = UIAlertController(title: nil, message: "url-> \(locationTextField.text ?? " ")\nsaved.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func actionNewWindow(_ sender: Any) {
        UserDefaults.standard.set(self.newWindowSwitch.isOn ? "true" : "false", forKey: "newWindow")
        UserDefaults.standard.synchronize()
    }
}
