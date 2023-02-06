import UIKit
import core_web_browser

final class WindowComposer {
    static func makeScreen() -> UIViewController {
        let windowView = WindowView()
        let windowViewController = UIViewController()
        let webViewProxy = WebViewProxy(webView: windowView.webView)
        let presenter = WindowPresenter()
        let windowViewAdapter = WindowViewAdapter(webViewProxy: webViewProxy, presenter: presenter)

        windowViewController.view = windowView
        windowView.delegate = windowViewAdapter
        webViewProxy.delegate = windowViewAdapter
        presenter.didUpdatePresentableModel = windowView.updateViews

        presenter.didStartNewWindow()

        return windowViewController
    }
}
