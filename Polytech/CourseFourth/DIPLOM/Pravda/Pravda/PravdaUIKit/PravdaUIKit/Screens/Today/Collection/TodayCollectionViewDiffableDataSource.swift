//
//  TodayCollectionViewDiffableDataSource.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 23.07.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import Models

typealias TodayDiffableDataSource = UICollectionViewDiffableDataSource<TodaySections, NewsItem>

protocol TodayCollectionViewDiffableDataSourceProtocol: TodayDiffableDataSource {
	func setItems(_ todayNewsItems: TodayNewsItems)
	func getItem(for indexPath: IndexPath) -> NewsItem?
}

final class TodayCollectionViewDiffableDataSource: TodayDiffableDataSource {

	// MARK: Properties

	private weak var todayViewController: TodayViewControllerProtocol?

	private var todayNewsItems = TodayNewsItems()

	// MARK: Life Cycle

	init(collectionView: UICollectionView, todayViewController: TodayViewControllerProtocol) {
		self.todayViewController = todayViewController
		super.init(
		collectionView: collectionView
		) { (collectionView: UICollectionView, indexPath: IndexPath, detailItem: NewsItem)
			-> UICollectionViewCell? in
			return TodayCollectionViewDiffableDataSource.setupCellsDataSource(
				collectionView: collectionView, indexPath: indexPath, detailItem: detailItem)
		}
	}
}

// MARK: Data Source Interface

extension TodayCollectionViewDiffableDataSource: TodayCollectionViewDiffableDataSourceProtocol {
	func setItems(_ todayNewsItems: TodayNewsItems) {
		self.todayNewsItems = todayNewsItems
		setupSupplementaryViewProvider()
		applyCurrentStateSnapshot()
	}

	func getItem(for indexPath: IndexPath) -> NewsItem? {
		return self.itemIdentifier(for: indexPath)
	}
}

// MARK: Data Snapshot

private extension TodayCollectionViewDiffableDataSource {
	static func setupCellsDataSource(
		collectionView: UICollectionView,
		indexPath: IndexPath,
		detailItem: NewsItem
	) -> UICollectionViewCell? {
		var newsCell: TodayCollectionViewCellProtocol?

		switch TodaySections.allCases[indexPath.section] {
		case .topStories, .science, .technology:
			let titleNewsTopicCell = collectionView.tryDequeueReusableTodayCell(
				withReuseIdentifier: TitleNewsTopicCollectionViewCell.reuseIdentifier,
				for: indexPath)
			newsCell = titleNewsTopicCell
		case .otherTopStories, .otherScience, .otherTechnology:
			let newsTopicCell = collectionView.tryDequeueReusableTodayCell(
				withReuseIdentifier: OtherNewsTopicCollectionViewCell.reuseIdentifier,
				for: indexPath)
			newsCell = newsTopicCell
		}

		if let newsCell = newsCell {
			newsCell.setupContent(
				headerImage: Assets.getImage(named: detailItem.image),
				source: detailItem.source,
				title: detailItem.title,
				timePublication: detailItem.timePublication)
			return newsCell
		} else {
			assertionFailure()
			return UICollectionViewCell()
		}
	}

	func setupSupplementaryViewProvider() {
		self.supplementaryViewProvider = {
			(collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
			guard let sectionItem = self.itemIdentifier(for: indexPath),
				let section = self.snapshot().sectionIdentifier(containingItem: sectionItem)
				else { assertionFailure(); return nil }

			if kind == "UICollectionElementKindSectionHeader" {
				let sectionHeader = collectionView.dequeueReusableSupplementaryView(
					ofKind: kind,
					withReuseIdentifier: TodaySectionHeaderCollectionReusableView.reuseIdentifier,
					for: indexPath) as? TodaySectionHeaderCollectionReusableViewProtocol
				sectionHeader?.setupContent(title: section.string, textColor: section.color)
				return sectionHeader
			} else if kind == "UICollectionElementKindSectionFooter" {
				let sectionFooter = collectionView.dequeueReusableSupplementaryView(
					ofKind: kind,
					withReuseIdentifier: MoreSectionFooterCollectionReusableView.reuseIdentifier,
					for: indexPath) as? MoreSectionFooterCollectionReusableViewProtocol

				guard let todayViewController = self.todayViewController else { assertionFailure(); return nil }
				sectionFooter?.setupTodayViewController(todayViewController)
				sectionFooter?.setupContent(sectionString: section.string, sectionColor: section.color)
				return sectionFooter
			} else {
				return nil
			}
		}
	}

	func applyCurrentStateSnapshot() {
		self.apply(self.getCurrentStateSnapshot(), animatingDifferences: true)
	}

	func getCurrentStateSnapshot() -> NSDiffableDataSourceSnapshot<TodaySections, NewsItem> {
		var snapshot = NSDiffableDataSourceSnapshot<TodaySections, NewsItem>()
		snapshot.appendSections([.topStories, .otherTopStories, .science, .otherScience, .technology, .otherTechnology])

		snapshot.appendItems(todayNewsItems.topStoriesItems, toSection: .topStories)
		snapshot.appendItems(todayNewsItems.otherTopStoriesItems, toSection: .otherTopStories)
		snapshot.appendItems(todayNewsItems.scienceItems, toSection: .science)
		snapshot.appendItems(todayNewsItems.otherScienceItems, toSection: .otherScience)
		snapshot.appendItems(todayNewsItems.technologyItems, toSection: .technology)
		snapshot.appendItems(todayNewsItems.otherTechnologyItems, toSection: .otherTechnology)

		return snapshot
	}
}
