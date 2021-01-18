//
//  SectionsTabBarController.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 27.05.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

protocol SectionsTabBarControllerProtocol: UITabBarController {
	func setupRegularInterface()
	func setupCompactInterface()
	func changeInterfaceToRegularAppearance()
	func changeInterfaceToCompactAppearance(with displayMode: UISplitViewController.DisplayMode?)
}

final class SectionsTabBarController: UITabBarController {

	// MARK: View Controllers

	// Sections Tab have first, second in Compact interface.
	// But in Regular interface Tab is hidden.
	private let firstSectionViewController: UIViewController
	private let secondSectionViewController: UIViewController

	// MARK: Life Cycle

	init(
		firstSectionViewController: UIViewController,
		secondSectionViewController: UIViewController
	) {
		self.firstSectionViewController = firstSectionViewController
		self.secondSectionViewController = secondSectionViewController
		super.init(nibName: nil, bundle: nil)
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupDesignAppearances()
	}
}

// MARK: Changes From MainContainer

extension SectionsTabBarController: SectionsTabBarControllerProtocol {
	func setupRegularInterface() {
		tabBar.isHidden = true
		viewControllers = [secondSectionViewController]
	}

	func setupCompactInterface() {
		tabBar.isHidden = false
		viewControllers = [firstSectionViewController, secondSectionViewController]
	}

	func changeInterfaceToRegularAppearance() {
		tabBar.isHidden = true
		viewControllers?.removeFirst()
	}

	func changeInterfaceToCompactAppearance(with displayMode: UISplitViewController.DisplayMode?) {
		tabBar.isHidden = false

		var selectedIndex = self.selectedIndex
		if displayMode == .primaryOverlay {
			//If Master view in read, show it in tabs
			selectedIndex += 1
		} else {
			selectedIndex = 0
		}

		self.viewControllers?.insert(firstSectionViewController, at: 0)
		self.selectedIndex = selectedIndex
	}
}

// MARK: Design Appearances

private extension SectionsTabBarController {
	func setupDesignAppearances() {
		let appearance = UITabBarAppearance()
		appearance.backgroundColor = .systemBackground

		let selectedColor = UIColor.systemPink
		appearance.stackedLayoutAppearance.selected.iconColor = selectedColor
		appearance.inlineLayoutAppearance.selected.iconColor = selectedColor
		appearance.compactInlineLayoutAppearance.selected.iconColor = selectedColor

		let selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: selectedColor]
		appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedTitleTextAttributes
		appearance.inlineLayoutAppearance.selected.titleTextAttributes = selectedTitleTextAttributes
		appearance.compactInlineLayoutAppearance.selected.titleTextAttributes = selectedTitleTextAttributes

		tabBar.standardAppearance = appearance
	}
}
