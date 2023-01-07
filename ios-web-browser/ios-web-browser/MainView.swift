import UIKit
import WebKit

final class MainView: UIView {
    let webView = WKWebView()

    let searchBar: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Search or enter address"
        return textfield
    }()

    convenience init() {
        self.init(frame: .zero)
        backgroundColor = .green
        setupView()
    }

    private func setupView() {
        addSubview(searchBar)
        addSubview(webView)
        backgroundColor = .white
        setupConstraints()
    }

    private func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        webView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50.0),

            webView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
