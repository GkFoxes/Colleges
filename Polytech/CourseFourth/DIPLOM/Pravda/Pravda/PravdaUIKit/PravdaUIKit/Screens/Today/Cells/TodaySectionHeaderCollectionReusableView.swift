//
//  TodaySectionHeaderCollectionReusableView.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 23.07.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

protocol TodaySectionHeaderCollectionReusableViewProtocol: UICollectionReusableView {
	static var reuseIdentifier: String { get }

	static func getEstimatedHeight() -> CGFloat

	func setupContent(title: String, textColor: UIColor)
}

final class TodaySectionHeaderCollectionReusableView: UICollectionReusableView {

	// MARK: Properties

	private enum Constants: CGFloat {
		case horizontalDistance = 16
	}

	// MARK: Views

	private let sectionHeaderLabel = sectionHeaderLabelInit()

	// MARK: Life Cycle

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupSectionHeaderLabelLayout()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: Reusable View Interface

extension TodaySectionHeaderCollectionReusableView: TodaySectionHeaderCollectionReusableViewProtocol {
	static var reuseIdentifier: String {
		return String(describing: TodaySectionHeaderCollectionReusableView.self)
	}

	static func getEstimatedHeight() -> CGFloat {
		return 44
	}

	func setupContent(title: String, textColor: UIColor) {
		sectionHeaderLabel.text = title
		sectionHeaderLabel.textColor = textColor
	}
}

// MARK: Views Appearances

private extension TodaySectionHeaderCollectionReusableView {
	static func sectionHeaderLabelInit() -> UILabel {
		let sectionHeaderLabel = UILabel()
		sectionHeaderLabel.backgroundColor = .systemBackground
		sectionHeaderLabel.font = .systemFont(ofSize: 30.0, weight: .black)
		return sectionHeaderLabel
	}
}

// MARK: ReusableView Layout

private extension TodaySectionHeaderCollectionReusableView {
	func setupSectionHeaderLabelLayout() {
		addSubview(sectionHeaderLabel)
		sectionHeaderLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			sectionHeaderLabel.leadingAnchor.constraint(
				equalTo: leadingAnchor, constant: TodayLayout.safeHorizontalDistance.rawValue),
			sectionHeaderLabel.trailingAnchor.constraint(
				equalTo: trailingAnchor, constant: -TodayLayout.safeHorizontalDistance.rawValue),
			sectionHeaderLabel.topAnchor.constraint(
				equalTo: topAnchor, constant: Constants.horizontalDistance.rawValue),
			sectionHeaderLabel.bottomAnchor.constraint(
				equalTo: bottomAnchor, constant: -Constants.horizontalDistance.rawValue)
		])
	}
}
