//
//  regularInterfaceSplitViewController.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 24.07.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

public protocol SplitViewDisplayModeButtonItem: UISplitViewController {
	func getDisplayModeButtonItem() -> UIBarButtonItem
}

protocol RegularInterfaceSplitViewControllerProtocol: UISplitViewController {
	func setViewControllers()
}

final class RegularInterfaceSplitViewController: UISplitViewController {

	// MARK: View Controllers

	private let secondaryViewController: UIViewController
	private let mainViewController: UIViewController

	// MARK: Life Cycle

	init(
		secondaryViewController: UIViewController,
		mainViewController: UIViewController
	) {
		self.secondaryViewController = secondaryViewController
		self.mainViewController = mainViewController
		super.init(nibName: nil, bundle: nil)
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setViewControllers()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: Changes From MainContainer

extension RegularInterfaceSplitViewController: RegularInterfaceSplitViewControllerProtocol {
	public func setViewControllers() {
		viewControllers = [secondaryViewController, mainViewController]
	}
}

// MARK: DisplayModeButtonItem Interface

extension RegularInterfaceSplitViewController: SplitViewDisplayModeButtonItem {
	public func getDisplayModeButtonItem() -> UIBarButtonItem {
		let buttonItemImage = Assets.squareRighthalfFill.systemImage.withTintColor(
			.systemPink, renderingMode: .alwaysOriginal)
		let buttonItem = UIBarButtonItem(
			image: buttonItemImage,
			style: .plain,
			target: self.displayModeButtonItem.target,
			action: self.displayModeButtonItem.action)
		return buttonItem
	}
}
