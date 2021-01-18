//
//  TitleNewsTopicCollectionViewCell.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 23.07.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

final class TitleNewsTopicCollectionViewCell: UICollectionViewCell {

	// MARK: Properties

	private enum Constants: CGFloat {
		case labelsVerticalDistance = 8
		case sourceLabelHeight = 17
		case timePublicationLabelHeight = 12
	}

	// MARK: Views

	private let headerImageView = HeaderImageView()
	private let sourceLabel = SourceLabel(fontSize: .medium)
	private let titleLabel = TitleLabel()
	private let timePublicationLabel = TimePublicationLabel()

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

// MARK: View Interface

extension TitleNewsTopicCollectionViewCell: TodayCollectionViewCellProtocol {
	static var reuseIdentifier: String {
		return String(describing: TitleNewsTopicCollectionViewCell.self)
	}

	static func getEstimatedHeight() -> CGFloat {
		return 650
	}

	func setupContent(headerImage: UIImage?, source: String, title: String, timePublication: String) {
		headerImageView.image = headerImage
		sourceLabel.text = source
		titleLabel.text = title
		timePublicationLabel.text = timePublication
	}
}

// MARK: Views Layout

private extension TitleNewsTopicCollectionViewCell {
	func setupViewsLayout() {
		setupImageViewLayout()
		setupSourceLabelLayout()
		setupTitleLabelLayout()
		setupTimePublicationLabelLayout()
	}

	func setupImageViewLayout() {
		contentView.addSubview(headerImageView)
		headerImageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			headerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			headerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			headerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			// Aspect ratio height 3, weight 4
			headerImageView.heightAnchor.constraint(equalTo: headerImageView.widthAnchor, multiplier: 3/4)
		])
	}

	func setupSourceLabelLayout() {
		contentView.addSubview(sourceLabel)
		sourceLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			sourceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			sourceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			sourceLabel.topAnchor.constraint(
				equalTo: headerImageView.bottomAnchor, constant: Constants.labelsVerticalDistance.rawValue),
			sourceLabel.heightAnchor.constraint(equalToConstant: Constants.sourceLabelHeight.rawValue)
		])
	}

	func setupTitleLabelLayout() {
		contentView.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			titleLabel.topAnchor.constraint(
				equalTo: sourceLabel.bottomAnchor, constant: Constants.labelsVerticalDistance.rawValue)
		])
	}

	func setupTimePublicationLabelLayout() {
		contentView.addSubview(timePublicationLabel)
		timePublicationLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			timePublicationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			timePublicationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			timePublicationLabel.topAnchor.constraint(
				equalTo: titleLabel.bottomAnchor, constant: Constants.labelsVerticalDistance.rawValue),
			timePublicationLabel.bottomAnchor.constraint(
				equalTo: contentView.bottomAnchor, constant: -2 * Constants.labelsVerticalDistance.rawValue),
			timePublicationLabel.heightAnchor.constraint(equalToConstant: Constants.timePublicationLabelHeight.rawValue)
		])
	}
}
