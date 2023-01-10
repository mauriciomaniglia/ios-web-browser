import UIKit

final class MainComposer {
    static func makeScreen() -> UIViewController {
        let mainView = MainView()
        let mainViewController = UIViewController()
        let webViewProxy = WebViewProxy(webView: mainView.webView)
        let mainViewAdapter = MainViewAdapter(webViewProxy: webViewProxy, mainView: mainView)

        mainViewController.view = mainView
        mainView.delegate = mainViewAdapter
        webViewProxy.delegate = mainViewAdapter

        return mainViewController
    }
}
