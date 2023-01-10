import WebKit
import core_web_browser

protocol WebViewProxyProtocol {
    func didLoadPage()
}

final class WebViewProxy: NSObject {
    let webView: WKWebView
    var delegate: WebViewProxyProtocol?

    init(webView: WKWebView) {
        self.webView = webView
        super.init()
        self.webView.navigationDelegate = self
    }

    func sendText(_ text: String) {
        webView.isHidden = false
        webView.load(URLRequest(url: SearchURLBuilder.makeURL(from: text)))
    }

    func didTapBackButton() {
        webView.goBack()
    }

    func didTapForwardButton() {
        webView.goForward()
    }

    func canGoBack() -> Bool {
        webView.canGoBack
    }

    func canGoForward() -> Bool {
        webView.canGoForward
    }
}

extension WebViewProxy: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        delegate?.didLoadPage()
    }
}
