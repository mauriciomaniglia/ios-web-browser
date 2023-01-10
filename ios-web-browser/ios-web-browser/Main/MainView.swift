import UIKit
import WebKit

public protocol MainViewProtocol {
    func sendText(_ text: String)
    func didTapBackButton()
    func didTapForwardButton()
}

public final class MainView: UIView {
    public var delegate: MainViewProtocol?

    internal let searchBar = SearchBarView()

    internal let webView: WKWebView = {
        let webView = WKWebView()
        webView.isHidden = true
        return webView
    }()

    internal let bottomNavigationView = BottomNavigationView()

    convenience init() {
        self.init(frame: .zero)        
        setupView()
    }

    func updateViewState(canGoBack: Bool, canGoForward: Bool, isWebViewHidden: Bool) {
        bottomNavigationView.backButton.isEnabled = canGoBack
        bottomNavigationView.forwardButton.isEnabled = canGoForward
        webView.isHidden = isWebViewHidden
    }

    private func setupView() {
        searchBar.searchBar.delegate = self
        bottomNavigationView.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        bottomNavigationView.forwardButton.addTarget(self, action: #selector(didTapForwardButton), for: .touchUpInside)

        addSubview(searchBar)
        addSubview(webView)
        addSubview(bottomNavigationView)

        backgroundColor = .systemGray4
        setupConstraints()
    }

    private func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        webView.translatesAutoresizingMaskIntoConstraints = false
        bottomNavigationView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),

            webView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            webView.leadingAnchor.constraint(equalTo: leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: trailingAnchor),

            bottomNavigationView.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 10),
            bottomNavigationView.heightAnchor.constraint(equalToConstant: 70),
            bottomNavigationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomNavigationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomNavigationView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    @objc private func didTapBackButton() {
        delegate?.didTapBackButton()
    }

    @objc private func didTapForwardButton() {
        delegate?.didTapForwardButton()
    }
}

extension MainView: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        delegate?.sendText(text)
        return true
    }
}
