//
//  HeaderImageView.swift
//  PravdaUIKit
//
//  Created by Матвеенко Дмитрий Владимирович on 24.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

final class HeaderImageView: UIImageView {

	// MARK: Life Cycle

	init(cornerRadius: CGFloat = 4.0) {
		super.init(frame: .zero)

		self.backgroundColor = .systemBackground
		self.layer.cornerRadius = cornerRadius
		self.contentMode = .scaleAspectFill
		self.clipsToBounds = true
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
