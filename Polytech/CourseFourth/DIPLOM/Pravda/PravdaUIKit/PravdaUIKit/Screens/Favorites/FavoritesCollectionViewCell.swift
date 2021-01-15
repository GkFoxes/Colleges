//
//  FavoritesCollectionViewCell.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 23.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

protocol FavoritesCollectionViewCellProtocol: ListViewCellProtocol, UICollectionViewCell {
	static func getHeight() -> CGFloat
	func setupContent(fillImage: UIImage?, source: String, title: String)
}

final class FavoritesCollectionViewCell: UICollectionViewCell {

	// MARK: Properties

	private enum Constants: CGFloat {
		case labelsHorizontalDistance = 12
		case labelsVerticalDistance = 10
		case sourceLabelHeight = 14
	}

	// MARK: Views

	private let fillImageView = RoundShadowImageView()
	private let sourceLabel = SourceLabel(fontSize: .medium, backgroundColor: .clear, isShadowNeeded: true)
	private let titleLabel = TitleLabel(fontSize: .large, backgroundColor: .clear, isShadowNeeded: true)

	// MARK: Life Cycle

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViewsLayout()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: Cell Interface

extension FavoritesCollectionViewCell: FavoritesCollectionViewCellProtocol {
	static var reuseIdentifier: String {
		return String(describing: FavoritesCollectionViewCell.self)
	}

	static func getHeight() -> CGFloat {
		return 412
	}

	func setupContent(fillImage: UIImage?, source: String, title: String) {
		fillImageView.image = fillImage
		sourceLabel.text = source
		titleLabel.text = title
	}
}

// MARK: Views Layout

private extension FavoritesCollectionViewCell {
	func setupViewsLayout() {
		setupFillImageViewLayout()
		setupSourceLabelLayout()
		setupTitleLabelLayout()
	}

	func setupFillImageViewLayout() {
		contentView.addSubview(fillImageView)
		fillImageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			fillImageView.leadingAnchor.constraint(
				equalTo: contentView.leadingAnchor, constant: FavoritesLayout.safeInterDistance.rawValue),
			fillImageView.trailingAnchor.constraint(
				equalTo: contentView.trailingAnchor, constant: -FavoritesLayout.safeInterDistance.rawValue),
			fillImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			fillImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}

	func setupSourceLabelLayout() {
		contentView.addSubview(sourceLabel)
		sourceLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			sourceLabel.leadingAnchor.constraint(
				equalTo: fillImageView.leadingAnchor, constant: Constants.labelsHorizontalDistance.rawValue),
			sourceLabel.trailingAnchor.constraint(
				equalTo: fillImageView.trailingAnchor, constant: -Constants.labelsHorizontalDistance.rawValue),
			sourceLabel.topAnchor.constraint(
				equalTo: fillImageView.topAnchor, constant: Constants.labelsVerticalDistance.rawValue),
			sourceLabel.heightAnchor.constraint(equalToConstant: Constants.sourceLabelHeight.rawValue)
		])
	}

	func setupTitleLabelLayout() {
		contentView.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: sourceLabel.leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: sourceLabel.trailingAnchor),
			titleLabel.topAnchor.constraint(
				equalTo: sourceLabel.bottomAnchor, constant: Constants.labelsVerticalDistance.rawValue)
		])
	}
}
