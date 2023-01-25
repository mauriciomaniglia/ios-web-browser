import UIKit
import core_web_browser

final class WindowComposer {
    static func makeScreen() -> UIViewController {
        let windowView = WindowView()
        let windowViewController = UIViewController()
        let webViewProxy = WebViewProxy(webView: windowView.webView)
        let windowViewAdapter = WindowViewAdapter(webViewProxy: webViewProxy, windowView: windowView)

        windowViewController.view = windowView
        windowView.delegate = windowViewAdapter
        webViewProxy.delegate = windowViewAdapter

        return windowViewController
    }
}
