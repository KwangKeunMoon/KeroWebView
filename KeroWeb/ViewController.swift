//
//  ViewController.swift
//  KeroWeb
//
//  Created by fla.m on 09/09/2019.
//  Copyright © 2019 문광근. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var contentView: UIView!
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationTextField.delegate = self
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        self.contentView.addSubview(webView)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[webView]|", options: [], metrics: nil, views: ["webView": self.webView!]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[webView]|", options: [], metrics: nil, views: ["webView": self.webView!]))
        if let urlString = UserDefaults.standard.value(forKey: "startURL") as? String {
            let myURL = URL(string: urlString)
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        }
    }
    
    @IBAction func actionRefresh(_ sender: Any) {
        self.webView.reload()
    }
    
    @IBAction func actionSetting(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController {
            self.present(vc, animated: true, completion: nil)
            vc.delegate = self
        }
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.webView.goBack()
    }
    
    @IBAction func actionForward(_ sender: Any) {
        self.webView.goForward()
    }
}

extension ViewController: WKUIDelegate {
    
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let urlString = webView.url?.absoluteString {
            self.locationTextField.text = urlString
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let urlString = textField.text {
            let myURL = URL(string: urlString)
            let myRequest = URLRequest(url: myURL!)
            self.webView.load(myRequest)
        }
        
        return true
    }
}

extension ViewController: SettingViewControllerDelegate {
    func refreshStartUrl() {
        if let urlString = UserDefaults.standard.value(forKey: "startURL") as? String {
            let myURL = URL(string: urlString)
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        }
    }
}
