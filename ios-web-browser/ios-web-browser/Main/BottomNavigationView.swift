import UIKit

final class BottomNavigationView: UIView {
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()

    let backButton = UIButton()
    let forwardButton = UIButton()
    let searchButton = UIButton()
    let newTabButton = UIButton()
    let settingsButton = UIButton()

    convenience init() {
        self.init(frame: .zero)
        setupView()
    }

    private func setupView() {
        backButton.setImage(.init(systemName: "arrow.left"), for: .normal)
        forwardButton.setImage(.init(systemName: "arrow.right"), for: .normal)
        searchButton.setImage(.init(systemName: "plus"), for: .normal)
        newTabButton.setImage(.init(systemName: "plus"), for: .normal)
        settingsButton.setImage(.init(systemName: "plus"), for: .normal)

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
