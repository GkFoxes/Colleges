//
//  MainContainerViewController.swift
//  Pravda-MVC
//
//  Created by Матвеенко Дмитрий on 20.05.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

final class MainContainerViewController: UIViewController {

	// MARK: Properties

	/// The interface is always compact, except when the width and height are equal to (.regular, .regular)
	private var isInterfaceCompact: Bool?

	// MARK: Views

	private var mainContainerView: MainContainerViewProtocol {
		guard let mainContainerView = view as? MainContainerViewProtocol else { fatalError() }
		return mainContainerView
	}

	// Main Tab have only Sections TabBar in Compact interface.
	// But in Regular interface have Section in Master and first section in Detail.
	private let sectionsTabBarController: SectionsTabBarControllerProtocol
	private let regularInterfaceSplitViewController: RegularInterfaceSplitViewControllerProtocol

	// MARK: Life Cycle

	init(
		sectionsTabBarController: SectionsTabBarControllerProtocol,
		regularInterfaceSplitViewController: RegularInterfaceSplitViewControllerProtocol
	) {
		self.sectionsTabBarController = sectionsTabBarController
		self.regularInterfaceSplitViewController = regularInterfaceSplitViewController
		super.init(nibName: nil, bundle: nil)
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		self.view = MainContainerView()
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setupInterface(traitCollection: traitCollection)
	}

	// MARK: Changes Cycle

	/// Change interface to compact or regular only on iPad
	override func willTransition(
		to newCollection: UITraitCollection,
		with coordinator: UIViewControllerTransitionCoordinator
	) {
		changeInterfaceIfNeeded(traitCollection: newCollection)

		super.willTransition(to: newCollection, with: coordinator)
	}
}

// MARK: Initial Interface

private extension MainContainerViewController {
	func setupInterface(traitCollection: UITraitCollection) {
		switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
		case (.regular, .regular): setupRegularInterfaceToFront()
		default: setupCompactInterfaceToFront()
		}
	}

	func setupRegularInterfaceToFront() {
		isInterfaceCompact = false
		sectionsTabBarController.setupRegularInterface()
		add(asChild: regularInterfaceSplitViewController)
	}

	func setupCompactInterfaceToFront() {
		isInterfaceCompact = true
		sectionsTabBarController.setupCompactInterface()
		add(asChild: sectionsTabBarController)
	}
}

// MARK: Size Class Change Interface

private extension MainContainerViewController {
	func changeInterfaceIfNeeded(traitCollection: UITraitCollection) {
		switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
		case (.regular, .regular):
			guard isInterfaceCompact != nil && isInterfaceCompact != false else { return }
			changeInterfaceToRegularAppearance()
		default:
			guard isInterfaceCompact != nil && isInterfaceCompact != true else { return }
			changeInterfaceToCompactAppearance()
		}
	}

	func changeInterfaceToRegularAppearance() {
		isInterfaceCompact = false
		sectionsTabBarController.changeInterfaceToRegularAppearance()
		remove(asChild: sectionsTabBarController)
		regularInterfaceSplitViewController.setViewControllers()
		add(asChild: regularInterfaceSplitViewController)
	}

	func changeInterfaceToCompactAppearance() {
		isInterfaceCompact = true
		remove(asChild: regularInterfaceSplitViewController)
		sectionsTabBarController.changeInterfaceToCompactAppearance(
			with: regularInterfaceSplitViewController.displayMode)
		add(asChild: sectionsTabBarController)
	}
}

// MARK: Changing Hierarchy

private extension MainContainerViewController {
	func add(asChild childViewController: UIViewController) {
		addChild(childViewController)
		mainContainerView.add(asChild: childViewController.view)
		childViewController.didMove(toParent: self)
	}

	func remove(asChild childViewController: UIViewController) {
		childViewController.willMove(toParent: nil)
		mainContainerView.remove(asChild: childViewController.view)
		childViewController.removeFromParent()
	}
}
