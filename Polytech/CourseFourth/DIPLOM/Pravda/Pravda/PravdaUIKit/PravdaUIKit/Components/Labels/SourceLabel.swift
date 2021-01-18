//
//  SourceLabel.swift
//  PravdaUIKit
//
//  Created by Матвеенко Дмитрий Владимирович on 24.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

final class SourceLabel: UILabel {

	// MARK: Properties

	private let isShadowNeeded: Bool

	enum FontSize: CGFloat {
		case standard = 11
		case medium = 14
	}

	// MARK: Life Cycle

	init(fontSize: FontSize = .standard, backgroundColor: UIColor = .systemBackground, isShadowNeeded: Bool = false) {
		self.isShadowNeeded = isShadowNeeded
		super.init(frame: .zero)

		self.backgroundColor = backgroundColor
		self.font = .systemFont(ofSize: fontSize.rawValue, weight: .semibold)
		self.textColor = .systemGray
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		guard isShadowNeeded else { return }
		self.layer.shadowColor = UIColor.systemBackground.cgColor
		self.layer.shadowRadius = 8
		self.layer.shadowOpacity = 1.0
	}
}
