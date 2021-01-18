//
//  FavoritesViewController.swift
//  Pravda-MVC
//
//  Created by Матвеенко Дмитрий on 19.05.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import Models
import PravdaUIKit

final class FavoritesViewController: UIViewController {

	// MARK: Properties

	private let todayViewController: TodayViewControllerProtocol

	// MARK: Views

	private var favoritesView: FavoritesViewProtocol {
		guard let favoritesView = view as? FavoritesViewProtocol else { fatalError() }
		return favoritesView
	}

	// MARK: Life Cycle

	init(todayViewController: TodayViewControllerProtocol) {
		self.todayViewController = todayViewController
		super.init(nibName: nil, bundle: nil)

		self.navigationItem.title = Strings.favoritesTitle.rawValue
		self.tabBarItem.title = Strings.favoritesTitle.rawValue
		self.tabBarItem.image = Assets.favoritesTab.image
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func loadView() {
		self.view = createFavoritesView()
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		guard let pravdaNavigationController = self.navigationController as? PravdaNavigationController
			else { return assertionFailure() }

		pravdaNavigationController.setupBoldDesignAppearances()
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()

		favoritesView.viewWillLayoutSubviews()
	}
}

// MARK: Favorites View

private extension FavoritesViewController {
	func createFavoritesView() -> UIView {
		let favoritesView: FavoritesViewProtocol = FavoritesView()
		favoritesView.setItems(FavoritesMocks.make())

		favoritesView.selectedItemHandler = { [weak self] indexPath in
			guard let self = self else { return assertionFailure() }
			self.pushTodayDetailViewController(with: indexPath)
		}

		return favoritesView
	}

	func pushTodayDetailViewController(with indexPath: IndexPath) {
		guard let item = favoritesView.getItem(for: indexPath) else { return assertionFailure() }

		let todayHorizontalTraitCollection = todayViewController.traitCollection.horizontalSizeClass
		let todayVerticalTraitCollection = todayViewController.traitCollection.verticalSizeClass
		switch (todayHorizontalTraitCollection, todayVerticalTraitCollection) {
		case (.regular, .regular):
			todayViewController.pushDetailNewsViewController(with: item)
		default:
			guard let detailNewsViewController = DetailNewsFactory.make(detailNewsItem: item) as? UIViewController
				else { return assertionFailure() }
			navigationController?.pushViewController(detailNewsViewController, animated: true)
		}
	}
}
