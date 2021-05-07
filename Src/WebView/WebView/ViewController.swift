//
//  ViewController.swift
//  WebView
//
//  Created by Kaan Aslan on 22.03.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        webView.navigationDelegate = self
        let urlRequest = URLRequest(url: URL(string: "https://stackoverflow.com")!)
       webView.load(urlRequest)
        
        
       // let url: URL? = Bundle.main.url(forResource: "test", withExtension: "html")
       // webView.loadFileURL(url!, allowingReadAccessTo: url!)
        
        //webView.loadHTMLString("<html><head><title>Test</title></head><body><h1>This is a test</h1><p>Yes this is a test</p></body>", baseURL: nil)
    }
    
    @IBAction func goBackButtonClicked(_ sender: Any)
    {
        webView.goBack()
    }
    
    @IBAction func goForwardButtonClicked(_ sender: Any)
    {
        webView.goForward()
    }
    
    func webView(_ webView: WKWebView, didFinish finished: WKNavigation!)
    {
        print("ok")
    }
}

