import UIKit
import core_web_browser

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var mainController: MainViewController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let mainViewController = MainViewController()
        mainViewController.delegate = self
        let navigation = UINavigationController(rootViewController: mainViewController)
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
        mainController = mainViewController
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

extension SceneDelegate: MainViewControllerDelegate {
    func sendText(_ text: String) {
        if let url = URIFixup.getURL(text) {
            mainController?.loadWebView(with: URLRequest(url: url))
        }  else {
            mainController?.loadWebView(with: URLRequest(url: SearchURLBuilder.makeURL(from: text)))
        }
    }
}

