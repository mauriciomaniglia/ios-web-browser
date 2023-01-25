import core_web_browser

final class WindowViewAdapter {
    let webViewProxy: WebViewProxy
    let windowView: WindowView

    init(webViewProxy: WebViewProxy, windowView: WindowView) {
        self.webViewProxy = webViewProxy
        self.windowView = windowView
    }
}

extension WindowViewAdapter: WindowViewProtocol {
    func sendText(_ text: String) {
        webViewProxy.sendText(text)
    }

    func didTapBackButton() {
        webViewProxy.didTapBackButton()
    }

    func didTapForwardButton() {
        webViewProxy.didTapForwardButton()
    }
}

extension WindowViewAdapter: WebViewProxyProtocol {
    func didLoadPage() {
        windowView.updateViewState(
            canGoBack: webViewProxy.canGoBack(),
            canGoForward: webViewProxy.canGoForward(),
            isWebViewHidden: false)
    }
}
