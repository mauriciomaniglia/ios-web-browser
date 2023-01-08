import UIKit

public protocol MainViewControllerContract {
    func sendText(_ text: String)
}

public class MainViewController: UIViewController {
    public var delegate: MainViewControllerContract?
}

extension MainViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        delegate?.sendText(text)
        return true
    }
}

