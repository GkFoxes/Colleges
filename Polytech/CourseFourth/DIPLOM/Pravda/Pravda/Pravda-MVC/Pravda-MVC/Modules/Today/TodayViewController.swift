//
//  TodayViewController.swift
//  Pravda-MVC
//
//  Created by Матвеенко Дмитрий on 17.05.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import Models
import PravdaUIKit

final class TodayViewController: UIViewController {

	// MARK: Views

	private var todayView: TodayViewProtocol {
		guard let todayView = view as? TodayViewProtocol else { fatalError() }
		return todayView
	}

	// MARK: Properties

	private var isCollectionCompact: Bool {
		switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
		case (.compact, .regular): return true
		default: return false
		}
	}

	// MARK: Life Cycle

	init() {
		super.init(nibName: nil, bundle: nil)

		self.navigationItem.title = Strings.todayNavigationTitle.rawValue
		self.tabBarItem.title = Strings.todayTabTitle.rawValue
		self.tabBarItem.image = Assets.todayTab.image
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		guard let pravdaNavigationController = self.navigationController as? PravdaNavigationController
			else { return assertionFailure() }

		pravdaNavigationController.setupBlackDesignAppearances()
		self.view = createTodayView()
		setupSplitViewAppearancesIfNeeded()
	}

	// MARK: Changes Cycle

	public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)

		setupSplitViewAppearancesIfNeeded()
		todayView.updateCollectionView(isCollectionCompact: isCollectionCompact, items: getTodayNewsItems())
	}
}

// MARK: View Controller Interface

extension TodayViewController: TodayViewControllerProtocol {
	func tapOnMoreViewAction(navigationTitle: String) {
		let spotlightViewController = SpotlightViewController(navigationTitle: navigationTitle)
		navigationController?.pushViewController(spotlightViewController, animated: true)
	}

	func pushDetailNewsViewController(with todayNewsItem: NewsItem) {
		guard let detailNewsViewController = makeDetailNewsViewController(with: todayNewsItem) as? UIViewController
			else { return assertionFailure() }
		navigationController?.pushViewController(detailNewsViewController, animated: true)
	}
}

// MARK: Split View Interface

extension TodayViewController: UISplitViewControllerDelegate {
	func splitViewController(_ svc: UISplitViewController, willChangeTo displayMode: UISplitViewController.DisplayMode) {
		setNavigationItem(svc, displayMode: displayMode)
	}

	private func setupSplitViewAppearancesIfNeeded() {
		// After viewDidLoad() delegate == nil, at the moment when view is loaded in compact, and after rise to regular
		if splitViewController?.delegate == nil {
			splitViewController?.delegate = self
		}

		setNavigationItem(splitViewController, displayMode: splitViewController?.displayMode)
	}

	private func setNavigationItem(
		_ splitViewController: UISplitViewController?,
		displayMode: UISplitViewController.DisplayMode?
	) {
		if let splitViewController = splitViewController as? SplitViewDisplayModeButtonItem,
			displayMode == .primaryHidden {
			navigationItem.leftBarButtonItem = splitViewController.getDisplayModeButtonItem()
		} else {
			navigationItem.leftBarButtonItem = nil
		}
	}
}

// MARK: Today View

private extension TodayViewController {
	func createTodayView() -> UIView {
		let todayView: TodayViewProtocol = TodayView(
			todayViewController: self, isCollectionCompact: isCollectionCompact, frame: view.bounds)
		todayView.setItems(getTodayNewsItems())

		todayView.selectedItemHandler = { [weak self] indexPath in
			guard let self = self else { return assertionFailure() }
			self.pushDetailNewsViewController(with: indexPath)
		}

		todayView.detailNewsViewController = { [weak self] indexPath in
			guard let self = self else { fatalError() }
			return self.makeDetailNewsViewController(with: indexPath)
		}

		return todayView
	}

	func makeDetailNewsViewController(with todayNewsItem: NewsItem) -> DetailNewsViewControllerProtocol {
		let detailNewsViewController = DetailNewsFactory.make(detailNewsItem: todayNewsItem)
		return detailNewsViewController
	}

	func makeDetailNewsViewController(with indexPath: IndexPath) -> DetailNewsViewControllerProtocol {
		guard let item = todayView.getItem(for: indexPath) else { fatalError() }
		let detailNewsViewController = DetailNewsFactory.make(detailNewsItem: item)
		return detailNewsViewController
	}

	func pushDetailNewsViewController(with indexPath: IndexPath) {
		guard let detailNewsViewController = makeDetailNewsViewController(with: indexPath) as? UIViewController
			else { return assertionFailure() }
		navigationController?.pushViewController(detailNewsViewController, animated: true)
	}
}

// MARK: News Items Interface

private extension TodayViewController {
	func getTodayNewsItems() -> TodayNewsItems {
		return TodayNewsItems(
			topStoriesItems: NewsItem.makeTopStoriesMock(isOnlyOneItem: isCollectionCompact),
			otherTopStoriesItems: NewsItem.makeOtherTopStoriesMock(isRemoveFirstItem: isCollectionCompact),
			scienceItems: NewsItem.makeScienceMock(isOnlyOneItem: isCollectionCompact),
			otherScienceItems: NewsItem.makeOtherScienceMock(isRemoveFirstItem: isCollectionCompact),
			technologyItems: NewsItem.makeTechnologyMock(isOnlyOneItem: isCollectionCompact),
			otherTechnologyItems: NewsItem.makeOtherTechnologyMock(isRemoveFirstItem: isCollectionCompact))
	}
}
