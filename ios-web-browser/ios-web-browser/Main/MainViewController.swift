import UIKit

public protocol MainViewControllerContract {
    func sendText(_ text: String)
}

public class MainViewController: UIViewController {
    public var delegate: MainViewControllerContract?
    private let mainView = MainView()

    public override func viewDidLoad() {
        super.viewDidLoad()        
        setupView()
    }

    public func loadWebView(with request: URLRequest) {
        mainView.webView.load(request)
    }

    private func setupView() {
        navigationController?.navigationBar.isHidden = true
        mainView.searchBar.searchBar.delegate = self
        view = mainView
    }
}

extension MainViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        mainView.webView.isHidden = false
        delegate?.sendText(text)
        return true
    }
}

