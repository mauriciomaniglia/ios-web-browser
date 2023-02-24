import UIKit

public final class SearchBarView: UIView {
    let searchTextField: UITextField = {
        let textfield = UITextField()
        textfield.clearButtonMode = .whileEditing
        textfield.placeholder = "Search or enter address"
        return textfield
    }()

    let searchBarContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemFill
        view.layer.cornerRadius = 10.0
        return view
    }()

    convenience init() {
        self.init(frame: .zero)
        setupView()
    }

    private func setupView() {
        searchBarContainer.addSubview(searchTextField)
        addSubview(searchBarContainer)
        setupConstraints()
    }

    private func setupConstraints() {
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchBarContainer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchBarContainer.heightAnchor.constraint(equalToConstant: 40.0),
            searchBarContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchBarContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            searchTextField.leadingAnchor.constraint(equalTo: searchBarContainer.leadingAnchor, constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: searchBarContainer.trailingAnchor)
        ])
    }
}
