//
//  AllWebViewController.swift
//  KeroWeb
//
//  Created by fla.m on 28/10/2019.
//  Copyright © 2019 문광근. All rights reserved.
//

import UIKit
import WebKit

class AllWebViewController: UIViewController {
    var webView: WKWebView!
    var startUrl: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.insertSubview(webView, at: 0)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[webView]|", options: [], metrics: nil, views: ["webView": self.webView!]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[webView]|", options: [], metrics: nil, views: ["webView": self.webView!]))
        
        let myURL = URL(string: startUrl)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    @IBAction func actionDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
