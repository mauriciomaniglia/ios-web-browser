import UIKit

final class MainComposer {
    static func makeScreen() -> UIViewController {
        let mainView = MainView()
        let mainViewController = MainViewController()
        let mainViewControllerDelegate = MainViewControllerDelegate(webView: mainView.webView)

        mainViewController.view = mainView
        mainViewController.delegate = mainViewControllerDelegate
        mainView.searchBar.searchBar.delegate = mainViewController

        return mainViewController
    }
}
