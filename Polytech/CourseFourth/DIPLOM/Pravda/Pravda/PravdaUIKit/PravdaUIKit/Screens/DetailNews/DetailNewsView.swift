//
//  DetailNewsView.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 05.08.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import Models

public protocol DetailNewsViewProtocol: UIView {
	func setItem(_ detailNews: NewsItem)
	func getNavigationLargeTitleDisplayMode() -> UINavigationItem.LargeTitleDisplayMode
	func getNavigationFavoriteButtonItem(isNewsFavorite: Bool) -> UIBarButtonItem
	func getFavoriteButtonTitle(isNewsFavorite: Bool) -> String
	func getFavoriteButtonImage(isNewsFavorite: Bool) -> UIImage
}

public final class DetailNewsView: UIView {

	// MARK: Properties

	private weak var detailNewsViewController: DetailNewsViewControllerProtocol?

	private var sharedConstraints: [NSLayoutConstraint] = []
	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []

	private enum Constants: CGFloat {
		case contentVerticalDistance = 19
		case timePublicationVerticalDistance = 10
		case upperBlockCompactVerticalDistance = 26
		case upperBlockRegularVerticalDistance = 12
		case timePublicationLabelHeight = 15
		case readOriginalStoryViewHeight = 115
		case regularImageViewHeight = 150
		case regularImageViewWidth = 200
	}

	// MARK: Views

	private let scrollView = UIScrollView()
	private let headerImageView = HeaderImageView(cornerRadius: 0.0)
	private let titleLabel = TitleLabel(numberOfLines: 0)
	private let timePublicationLabel = TimePublicationLabel(fontSize: .medium, weight: .semibold)
	private let textLabel = textLabelInit()
	private let readOriginalStoryView: ReadOriginalStoryViewProtocol

	// MARK: Life Cycle

	public init(viewController: DetailNewsViewControllerProtocol & SafariViewControllerDelegate) {
		self.detailNewsViewController = viewController
		readOriginalStoryView = ReadOriginalStoryView(safariViewController: viewController)
		super.init(frame: .zero)

		setupViewAppearances()
		setupViewsLayout()
		changeViewsLayoutIfNeeded(traitCollection: traitCollection)
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: Changes Cycle

	public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)

		guard traitCollection.horizontalSizeClass != previousTraitCollection?.horizontalSizeClass ||
			traitCollection.verticalSizeClass != previousTraitCollection?.verticalSizeClass else { return }
		changeViewsLayoutIfNeeded(traitCollection: traitCollection)
	}
}

// MARK: View Interface

extension DetailNewsView: DetailNewsViewProtocol {
	public func setItem(_ detailNews: NewsItem) {
		headerImageView.image = Assets.getImage(named: detailNews.image)
		titleLabel.text = detailNews.title
		timePublicationLabel.text = detailNews.timePublication
		textLabel.text = detailNews.text
		readOriginalStoryView.setLink(detailNews.link)
	}

	public func getNavigationLargeTitleDisplayMode() -> UINavigationItem.LargeTitleDisplayMode {
		return .never
	}

	public func getNavigationFavoriteButtonItem(isNewsFavorite: Bool) -> UIBarButtonItem {
		return UIBarButtonItem(
			image: getFavoriteButtonImage(isNewsFavorite: isNewsFavorite),
			style: .done,
			target: detailNewsViewController,
			action: #selector(detailNewsViewController?.tapOnNavigationFavoriteButtonItem(_:)))
	}

	public func getFavoriteButtonTitle(isNewsFavorite: Bool) -> String {
		if isNewsFavorite {
			return Strings.unfavorite.rawValue
		} else {
			return Strings.favorite.rawValue
		}
	}

	public func getFavoriteButtonImage(isNewsFavorite: Bool) -> UIImage {
		if isNewsFavorite {
			return Assets.bookmarkFill.systemImage
		} else {
			return Assets.bookmark.systemImage
		}
	}
}

// MARK: Views Appearances

private extension DetailNewsView {
	func setupViewAppearances() {
		self.backgroundColor = .systemBackground
	}

	static func textLabelInit() -> UILabel {
		let textLabel = UILabel()
		textLabel.backgroundColor = .systemBackground
		textLabel.font = .systemFont(ofSize: 17.0, weight: .regular)
		textLabel.numberOfLines = 0
		return textLabel
	}
}

// MARK: Views Layout

private extension DetailNewsView {
	func setupViewsLayout() {
		setupSharedViewsLayout()
		configureCompactViewsLayout()
		configureRegularViewsLayout()
	}

	func changeViewsLayoutIfNeeded(traitCollection: UITraitCollection) {
		switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
		case (.compact, .regular):
			NSLayoutConstraint.deactivate(regularConstraints)
			NSLayoutConstraint.activate(compactConstraints)
		default:
			NSLayoutConstraint.deactivate(compactConstraints)
			NSLayoutConstraint.activate(regularConstraints)
		}
	}
}

// MARK: Shared Layout

private extension DetailNewsView {
	func setupSharedViewsLayout() {
		setupScrollViewSharedLayout()
		setupImageViewSharedLayout()
		setupTitleLabelSharedLayout()
		setupTimePublicationLabelSharedLayout()
		setupTextLabelSharedLayout()
		setupReadOriginalStoryViewLayout()

		NSLayoutConstraint.activate(sharedConstraints)
	}

	func setupScrollViewSharedLayout() {
		addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
		])
	}

	func setupImageViewSharedLayout() {
		scrollView.addSubview(headerImageView)
		headerImageView.translatesAutoresizingMaskIntoConstraints = false
	}

	func setupTitleLabelSharedLayout() {
		scrollView.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			titleLabel.trailingAnchor.constraint(
				equalTo: self.trailingAnchor, constant: -Constants.contentVerticalDistance.rawValue)
		])
	}

	func setupTimePublicationLabelSharedLayout() {
		scrollView.addSubview(timePublicationLabel)
		timePublicationLabel.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			timePublicationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			timePublicationLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			timePublicationLabel.heightAnchor.constraint(equalToConstant: Constants.timePublicationLabelHeight.rawValue)
		])
	}

	func setupTextLabelSharedLayout() {
		scrollView.addSubview(textLabel)
		textLabel.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			textLabel.leadingAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constants.contentVerticalDistance.rawValue),
			textLabel.trailingAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.contentVerticalDistance.rawValue)
		])
	}

	func setupReadOriginalStoryViewLayout() {
		scrollView.addSubview(readOriginalStoryView)
		readOriginalStoryView.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			readOriginalStoryView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			readOriginalStoryView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			readOriginalStoryView.topAnchor.constraint(equalTo: textLabel.bottomAnchor),
			readOriginalStoryView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			readOriginalStoryView.heightAnchor.constraint(
				equalToConstant: Constants.readOriginalStoryViewHeight.rawValue)
		])
	}
}

// MARK: Compact Layout

private extension DetailNewsView {
	func configureCompactViewsLayout() {
		setupImageViewCompactLayout()
		setupTitleLabelCompactLayout()
		setupTextLabelCompactLayout()
		setupTimePublicationLabelCompactLayout()
	}

	func setupImageViewCompactLayout() {
		compactConstraints.append(contentsOf: [
			headerImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			headerImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			headerImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			// Aspect ratio height 3, weight 4
			headerImageView.heightAnchor.constraint(equalTo: headerImageView.widthAnchor, multiplier: 3/4)
		])
	}

	func setupTitleLabelCompactLayout() {
		compactConstraints.append(contentsOf: [
			titleLabel.leadingAnchor.constraint(
				equalTo: self.leadingAnchor, constant: Constants.contentVerticalDistance.rawValue),
			titleLabel.topAnchor.constraint(
				equalTo: headerImageView.bottomAnchor,
				constant: Constants.upperBlockCompactVerticalDistance.rawValue)
		])
	}

	func setupTimePublicationLabelCompactLayout() {
		compactConstraints.append(contentsOf: [
			timePublicationLabel.topAnchor.constraint(
				equalTo: titleLabel.bottomAnchor, constant: Constants.timePublicationVerticalDistance.rawValue)
		])
	}

	func setupTextLabelCompactLayout() {
		compactConstraints.append(contentsOf: [
			textLabel.topAnchor.constraint(
				equalTo: timePublicationLabel.bottomAnchor,
				constant: Constants.upperBlockCompactVerticalDistance.rawValue)
		])
	}
}

// MARK: Regular Layout

private extension DetailNewsView {
	func configureRegularViewsLayout() {
		setupImageViewRegularLayout()
		setupTitleLabelRegularLayout()
		setupTextLabelRegularLayout()
		setupTimePublicationLabelRegularLayout()
	}

	func setupImageViewRegularLayout() {
		regularConstraints.append(contentsOf: [
			headerImageView.leadingAnchor.constraint(
				equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constants.contentVerticalDistance.rawValue),
			headerImageView.topAnchor.constraint(
				equalTo: scrollView.topAnchor, constant: Constants.upperBlockRegularVerticalDistance.rawValue),
			headerImageView.heightAnchor.constraint(equalToConstant: Constants.regularImageViewHeight.rawValue),
			headerImageView.widthAnchor.constraint(equalToConstant: Constants.regularImageViewWidth.rawValue)
		])
	}

	func setupTitleLabelRegularLayout() {
		regularConstraints.append(contentsOf: [
			titleLabel.leadingAnchor.constraint(
				equalTo: headerImageView.trailingAnchor, constant: Constants.contentVerticalDistance.rawValue),
			titleLabel.topAnchor.constraint(equalTo: headerImageView.topAnchor)
		])
	}

	func setupTimePublicationLabelRegularLayout() {
		regularConstraints.append(contentsOf: [
			timePublicationLabel.topAnchor.constraint(
				greaterThanOrEqualTo: titleLabel.bottomAnchor,
				constant: Constants.timePublicationVerticalDistance.rawValue),
			timePublicationLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor)
		])
	}

	func setupTextLabelRegularLayout() {
		regularConstraints.append(contentsOf: [
			textLabel.topAnchor.constraint(
				equalTo: headerImageView.bottomAnchor,
				constant: Constants.upperBlockRegularVerticalDistance.rawValue)
		])
	}
}
