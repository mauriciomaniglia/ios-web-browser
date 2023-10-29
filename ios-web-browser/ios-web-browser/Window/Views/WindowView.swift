import UIKit
import core_web_browser

public final class WindowView: UIView {
    public var delegate: WindowViewContract?
    public let searchBar = SearchBarView()
    public let webView: UIView
    public let bottomNavigationView = NavigationBarView()

    public init(webView: UIView) {
        self.webView = webView
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateViews(_ presentableModel: WindowPresentableModel) {
        bottomNavigationView.backButton.isEnabled = presentableModel.canGoBack
        bottomNavigationView.forwardButton.isEnabled = presentableModel.canGoForward
        webView.isHidden = !presentableModel.showWebView
        searchBar.showLoadingProgress(presentableModel.progressBar)
    }

    private func setupView() {
        searchBar.searchTextField.delegate = self
        bottomNavigationView.backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        bottomNavigationView.forwardButton.addTarget(self, action: #selector(didTapForwardButton), for: .touchUpInside)

        addSubview(searchBar)
        addSubview(webView)
        addSubview(bottomNavigationView)

        backgroundColor = .systemBackground
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

extension WindowView: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text, !text.isEmpty else { return false }
        delegate?.didRequestSearch(text)
        return true
    }
}
