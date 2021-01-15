//
//  UINavigationController+Design.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 13.06.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

public final class PravdaNavigationController: UINavigationController {

	// MARK: Design Variations

	public func setupBoldDesignAppearances() {
		setupDesignAppearances(weight: .bold)
	}

	public func setupBlackDesignAppearances() {
		setupDesignAppearances(weight: .black)
	}
}

// MARK: Design Appearances

private extension PravdaNavigationController {
	func setupDesignAppearances(weight: UIFont.Weight) {
		navigationBar.prefersLargeTitles = true

		let appearance = UINavigationBarAppearance()
		appearance.backgroundColor = .systemBackground

		let backButtonAppearance = UIBarButtonItemAppearance()
		backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
		appearance.buttonAppearance = backButtonAppearance

		let titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17.0, weight: weight)]
		appearance.titleTextAttributes = titleTextAttributes

		let largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34.0, weight: weight)]
		appearance.largeTitleTextAttributes = largeTitleTextAttributes

		navigationBar.tintColor = .systemPink
		navigationBar.standardAppearance = appearance
		navigationBar.compactAppearance = appearance
		navigationBar.scrollEdgeAppearance = appearance
	}
}
