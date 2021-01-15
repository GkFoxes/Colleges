//
//  ReadOriginalStoryView.swift
//  PravdaUIKit
//
//  Created by Матвеенко Дмитрий Владимирович on 14.08.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

protocol ReadOriginalStoryViewProtocol: UIView {
	func setLink(_ link: String?)
}

public final class ReadOriginalStoryView: UIView {

	// MARK: Properties

	private weak var safariViewController: SafariViewControllerDelegate?
	private var link: String?

	private enum Constants: CGFloat {
		case suggestionLabelCenterXConstant = -10
		case linkLabelTopAnchorConstant = 2
		case linkLabelWidthConstant = 200
	}

	// MARK: Views

	private let suggestionLabel = suggestionLabelInit()
	private let linkLabel = linkLabelInit()
	private let tapOnViewButton = UIButton()

	// MARK: Life Cycle

	public init(safariViewController: SafariViewControllerDelegate) {
		self.safariViewController = safariViewController
		super.init(frame: .zero)

		setupViewsLayout()
		setupActions()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: View Interface

extension ReadOriginalStoryView: ReadOriginalStoryViewProtocol {
	public func setLink(_ link: String?) {
		self.link = link

		if let link = link, !link.isEmpty {
			linkLabel.text = link
		} else {
			linkLabel.text = Strings.fullStoryNotAvailable.rawValue
		}
	}
}

// MARK: Views Appearances

private extension ReadOriginalStoryView {
	static func suggestionLabelInit() -> UILabel {
		let suggestionLabel = UILabel()
		suggestionLabel.backgroundColor = .systemBackground
		suggestionLabel.text = Strings.readFullStory.rawValue
		suggestionLabel.font = .systemFont(ofSize: 16.0, weight: .medium)
		return suggestionLabel
	}

	static func linkLabelInit() -> UILabel {
		let linkLabel = UILabel()
		linkLabel.backgroundColor = .systemBackground
		linkLabel.font = .systemFont(ofSize: 11.0, weight: .medium)
		linkLabel.textColor = UIColor.systemPink
		return linkLabel
	}
}

// MARK: Views Layout

private extension ReadOriginalStoryView {
	func setupViewsLayout() {
		setupSuggestionLabelLayout()
		setupLinkLabelLayout()
		setupTapOnViewButtonLayout()
	}

	func setupSuggestionLabelLayout() {
		self.addSubview(suggestionLabel)
		suggestionLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			suggestionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			suggestionLabel.centerYAnchor.constraint(
				equalTo: self.centerYAnchor, constant: Constants.suggestionLabelCenterXConstant.rawValue)
		])
	}

	func setupLinkLabelLayout() {
		self.addSubview(linkLabel)
		linkLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			linkLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			linkLabel.topAnchor.constraint(
				equalTo: suggestionLabel.bottomAnchor, constant: Constants.linkLabelTopAnchorConstant.rawValue),
			linkLabel.widthAnchor.constraint(equalToConstant: Constants.linkLabelWidthConstant.rawValue)
		])
	}

	func setupTapOnViewButtonLayout() {
		self.addSubview(tapOnViewButton)
		tapOnViewButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			tapOnViewButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			tapOnViewButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			tapOnViewButton.topAnchor.constraint(equalTo: self.topAnchor),
			tapOnViewButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}
}

// MARK: Button Actions

private extension ReadOriginalStoryView {
	func setupActions() {
		tapOnViewButton.addTarget(self, action: #selector(tapOnViewAction), for: .touchUpInside)
	}

	@objc func tapOnViewAction(_ sender: UIButton) {
		guard let safariViewController = safariViewController else { assertionFailure(); return }
		safariViewController.presentUrl(linkString: link)
	}
}
