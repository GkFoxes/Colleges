//
//  MainContainerView.swift
//  PravdaUIKit
//
//  Created by Матвеенко Дмитрий Владимирович on 08.06.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

protocol MainContainerViewProtocol: UIView {
	func add(asChild childView: UIView)
	func remove(asChild childView: UIView)
}

final class MainContainerView: UIView {

	// MARK: Life Cycle

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: View Interface

extension MainContainerView: MainContainerViewProtocol {
	func add(asChild childView: UIView) {
		self.addSubview(childView)
		childView.frame = self.bounds
		childView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
	}

	func remove(asChild childView: UIView) {
		childView.removeFromSuperview()
	}
}
