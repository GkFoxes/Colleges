//
//  OtherNewsTopicCollectionViewCell.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 23.07.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

final class OtherNewsTopicCollectionViewCell: UICollectionViewCell {

	// MARK: Properties

	private enum Constants: CGFloat {
		case labelsVerticalDistance = 4
		case sourceLabelHeight = 14
		case titleLabelHeight = 86
		case timePublicationLabelHeight = 12
	}

	// MARK: Views

	private let headerImageView = HeaderImageView()
	private let sourceLabel = SourceLabel()
	private let titleLabel = TitleLabel(fontSize: .medium, weight: .bold)
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

// MARK: Cell Interface

extension OtherNewsTopicCollectionViewCell: TodayCollectionViewCellProtocol {
	static var reuseIdentifier: String {
		return String(describing: OtherNewsTopicCollectionViewCell.self)
	}

	static func getEstimatedHeight() -> CGFloat {
		return 132
	}

	func setupContent(headerImage: UIImage?, source: String, title: String, timePublication: String) {
		headerImageView.image = headerImage
		sourceLabel.text = source
		titleLabel.text = title
		timePublicationLabel.text = timePublication
	}
}

// MARK: Views Layout

private extension OtherNewsTopicCollectionViewCell {
	func setupViewsLayout() {
		setupSourceLabelLayout()
		setupTitleLabelLayout()
		setupTimePublicationLabelLayout()
		setupImageViewLayout()
	}

	func setupSourceLabelLayout() {
		contentView.addSubview(sourceLabel)
		sourceLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			sourceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			sourceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			sourceLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
			sourceLabel.heightAnchor.constraint(equalToConstant: Constants.sourceLabelHeight.rawValue)
		])
	}

	func setupTitleLabelLayout() {
		contentView.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			titleLabel.topAnchor.constraint(
				equalTo: sourceLabel.bottomAnchor, constant: Constants.labelsVerticalDistance.rawValue),
			titleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: Constants.titleLabelHeight.rawValue)
		])
	}

	func setupTimePublicationLabelLayout() {
		contentView.addSubview(timePublicationLabel)
		timePublicationLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			timePublicationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			timePublicationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			timePublicationLabel.topAnchor.constraint(
				greaterThanOrEqualTo: titleLabel.bottomAnchor,
				constant: Constants.labelsVerticalDistance.rawValue),
			timePublicationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			timePublicationLabel.heightAnchor.constraint(equalToConstant: Constants.timePublicationLabelHeight.rawValue)
		])
	}

	func setupImageViewLayout() {
		contentView.addSubview(headerImageView)
		headerImageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			headerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			headerImageView.leadingAnchor.constraint(
				equalTo: titleLabel.trailingAnchor, constant: Constants.labelsVerticalDistance.rawValue),
			headerImageView.topAnchor.constraint(
				equalTo: sourceLabel.bottomAnchor, constant: Constants.labelsVerticalDistance.rawValue),
			headerImageView.bottomAnchor.constraint(
				equalTo: timePublicationLabel.topAnchor, constant: -Constants.labelsVerticalDistance.rawValue),
			// Aspect ratio 1 : 1 == Square
			headerImageView.heightAnchor.constraint(equalTo: headerImageView.widthAnchor)
		])
	}
}
