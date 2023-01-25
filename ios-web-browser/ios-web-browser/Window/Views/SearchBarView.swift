import UIKit

public final class SearchBarView: UIView {
    let searchBar: UITextField = {
        let textfield = UITextField()
        textfield.clearButtonMode = .whileEditing
        textfield.placeholder = "Search or enter address"
        return textfield
    }()

    let searchBarContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        view.layer.cornerRadius = 10.0
        return view
    }()

    convenience init() {
        self.init(frame: .zero)
        setupView()
    }

    private func setupView() {
        searchBarContainer.addSubview(searchBar)
        addSubview(searchBarContainer)
        setupConstraints()
    }

    private func setupConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBarContainer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchBarContainer.heightAnchor.constraint(equalToConstant: 40.0),
            searchBarContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchBarContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            searchBar.heightAnchor.constraint(equalToConstant: 40),
            searchBar.leadingAnchor.constraint(equalTo: searchBarContainer.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: searchBarContainer.trailingAnchor)
        ])
    }
}
