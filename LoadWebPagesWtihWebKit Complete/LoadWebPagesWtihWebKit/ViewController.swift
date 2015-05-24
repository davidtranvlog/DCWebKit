//
//  ViewController.swift
//  LoadWebPagesWtihWebKit
//
//  Created by Duc Tran on 5/6/15.
//  Copyright (c) 2015 Duc Tran. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate
{
    var webView: WKWebView!
    
    let featuredURL = "http://www.developerinspirus.io"
    let tutorialsURL = "http://www.developerinspirus.io/tutorials"
    let coursesURL = "http://www.developerinspirus.io/courses/"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        // create an instance of web view
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        
        webView.navigationDelegate = self
        
        view.addSubview(webView)
        
        webViewLoadURL(featuredURL)
    }
    
    func webViewLoadURL(urlString: String)
    {
        if let url = NSURL(string: urlString) {
            let urlRequest = NSURLRequest(URL: url)
            
            webView.loadRequest(urlRequest)
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // MARK: - Target Action
   
    @IBAction func menuChanged(sender: UISegmentedControl)
    {
        let selectedIndex = sender.selectedSegmentIndex
        
        switch selectedIndex
        {
        case 0: webViewLoadURL(featuredURL)
        case 1: webViewLoadURL(tutorialsURL)
        case 2: webViewLoadURL(coursesURL)
        default: break
        }
    }
    
    
    // MARK: - WKNavigationDelegate
    
    // gets called when the webview starts loading
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    // gets called when the webview finishes loading
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    
    

}





















