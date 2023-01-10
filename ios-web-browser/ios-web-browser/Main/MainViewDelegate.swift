import WebKit
import core_web_browser

final class MainViewDelegate: MainViewProtocol {
    let webView: WKWebView

    init(webView: WKWebView) {
        self.webView = webView
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
}