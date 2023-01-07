import UIKit
import WebKit

final class MainView: UIView {
    let searchBar = SearchBarView()

    let webView: WKWebView = {
        let webView = WKWebView()
        webView.isHidden = true
        return webView
    }()

    convenience init() {
        self.init(frame: .zero)        
        setupView()
    }

    private func setupView() {
        addSubview(searchBar)
        addSubview(webView)
        backgroundColor = .systemGray4
        setupConstraints()
    }

    private func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        webView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),

            webView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            webView.leadingAnchor.constraint(equalTo: leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
