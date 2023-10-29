import UIKit
import core_web_browser

final class WindowComposer {
    static func makeScreen() -> UIViewController {
        let windowViewController = UIViewController()
        let webViewProxy = WebViewProxy()
        let windowView = WindowView(webView: webViewProxy.webView)
        let presenter = WindowPresenter()
        let windowViewAdapter = WindowViewAdapter(webView: webViewProxy, presenter: presenter)

        windowViewController.view = windowView
        windowView.delegate = windowViewAdapter
        webViewProxy.delegate = windowViewAdapter
        presenter.didUpdatePresentableModel = windowView.updateViews

        presenter.didStartNewWindow()

        return windowViewController
    }
}
