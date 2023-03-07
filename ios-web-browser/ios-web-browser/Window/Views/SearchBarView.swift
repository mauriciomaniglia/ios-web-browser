import UIKit

public final class SearchBarView: UIView {
    let searchTextField: UITextField = {
        let textfield = UITextField()
        textfield.clearButtonMode = .whileEditing
        textfield.placeholder = "Search or enter address"
        return textfield
    }()

    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.isHidden = true
        return progressView
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

    func showLoadingProgress(_ value: Double?) {
        if let currentProgress = value {
            progressView.isHidden = false
            progressView.setProgress(Float(currentProgress), animated: true)

            if currentProgress == 1.0 {
                progressView.isHidden = true
            }
        } else {
            progressView.isHidden = true
        }
    }

    private func setupView() {
        searchBarContainer.addSubview(searchTextField)
        searchBarContainer.addSubview(progressView)
        addSubview(searchBarContainer)
        setupConstraints()
    }

    private func setupConstraints() {
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchBarContainer.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchBarContainer.heightAnchor.constraint(equalToConstant: 40.0),
            searchBarContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchBarContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            searchTextField.leadingAnchor.constraint(equalTo: searchBarContainer.leadingAnchor, constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: searchBarContainer.trailingAnchor),

            progressView.heightAnchor.constraint(equalToConstant: 2),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
