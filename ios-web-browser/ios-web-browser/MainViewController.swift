import UIKit
import WebKit

public protocol MainViewControllerDelegate {
    func sendText(_ text: String)
}

public class MainViewController: UIViewController {
    public var delegate: MainViewControllerDelegate?

    let webView = WKWebView()
    
    let searchBar: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "type something here"
        textfield.backgroundColor = .blue
        return textfield
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(searchBar)
        view.addSubview(webView)

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

extension MainViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        delegate?.sendText(text)
        return true
    }
}

