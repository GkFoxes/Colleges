//
//  MainContainerFactory.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 16.06.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

public final class MainContainerFactory {
	public static func make(
		firstSectionViewController: UIViewController,
		secondSectionViewController: UIViewController
	) -> UIViewController {
		let sectionsTabBarController: SectionsTabBarControllerProtocol =
			SectionsTabBarController(
				firstSectionViewController: firstSectionViewController,
				secondSectionViewController: secondSectionViewController)

		let regularInterfaceSplitViewController: RegularInterfaceSplitViewControllerProtocol =
			RegularInterfaceSplitViewController(
				secondaryViewController: sectionsTabBarController,
				mainViewController: firstSectionViewController)

		let mainContainerViewController = MainContainerViewController(
			sectionsTabBarController: sectionsTabBarController,
			regularInterfaceSplitViewController: regularInterfaceSplitViewController)

		return mainContainerViewController
	}
}
