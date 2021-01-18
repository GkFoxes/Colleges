//
//  TimePublicationLabel.swift
//  PravdaUIKit
//
//  Created by Матвеенко Дмитрий Владимирович on 24.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

final class TimePublicationLabel: UILabel {

	// MARK: Properties

	enum FontSize: CGFloat {
		case standard = 10
		case medium = 12
	}

	// MARK: Life Cycle

	init(fontSize: FontSize = .standard, weight: UIFont.Weight = .medium) {
		super.init(frame: .zero)

		self.backgroundColor = .systemBackground
		self.font = .systemFont(ofSize: fontSize.rawValue, weight: weight)
		self.textColor = .systemGray2
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
