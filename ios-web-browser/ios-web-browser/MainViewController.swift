//
//  MainViewController.swift
//  ios-web-browser
//
//  Created by Mauricio Cesar on 05/09/22.
//

import UIKit
import WebKit

class MainViewController: UIViewController {
    let webView = WKWebView()
    
    let searchBar: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "type something here"
        textfield.backgroundColor = .blue
        return textfield
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(searchBar)
        view.addSubview(webView)
        
        webView.uiDelegate = self
        searchBar.delegate = self
        
        view.backgroundColor = .white
        title = "My Web Browser"
        
        setupConstraints()
    }

    private func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50.0),
            
            webView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MainViewController: WKUIDelegate {
    
}

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let myURL = URL(string:"http:tesla.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        return true
    }
}

