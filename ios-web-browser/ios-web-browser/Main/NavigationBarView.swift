import UIKit

public final class NavigationBarView: UIView {
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()

    public let backButton = UIButton()
    public let forwardButton = UIButton()
    public let searchButton = UIButton()
    public let newTabButton = UIButton()
    public let settingsButton = UIButton()

    convenience init() {
        self.init(frame: .zero)
        setupView()
    }

    private func setupView() {
        backButton.setImage(.init(systemName: "arrow.left"), for: .normal)
        forwardButton.setImage(.init(systemName: "arrow.right"), for: .normal)
        searchButton.setImage(.init(systemName: "magnifyingglass"), for: .normal)
        newTabButton.setImage(.init(systemName: "plus"), for: .normal)
        settingsButton.setImage(.init(systemName: "ellipsis"), for: .normal)

        backButton.tintColor = .label
        forwardButton.tintColor = .label
        searchButton.tintColor = .label
        newTabButton.tintColor = .label
        settingsButton.tintColor = .label

        addSubview(buttonsStackView)

        buttonsStackView.addArrangedSubview(backButton)
        buttonsStackView.addArrangedSubview(forwardButton)
        buttonsStackView.addArrangedSubview(searchButton)
        buttonsStackView.addArrangedSubview(newTabButton)
        buttonsStackView.addArrangedSubview(settingsButton)

        setupConstraints()
    }

    private func setupConstraints() {
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),            
        ])
    }
}
