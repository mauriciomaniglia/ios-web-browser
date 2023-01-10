final class MainViewAdapter: MainViewProtocol {
    let webViewProxy: WebViewProxy
    let mainView: MainView

    init(webViewProxy: WebViewProxy, mainView: MainView) {
        self.webViewProxy = webViewProxy
        self.mainView = mainView
    }

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

extension MainViewAdapter: WebViewProxyProtocol {
    func didLoadPage() {
        mainView.updateViewState(
            canGoBack: webViewProxy.canGoBack(),
            canGoForward: webViewProxy.canGoForward(),
            isWebViewHidden: false)
    }
}
