//
//  TodayCollectionViewLayout.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 23.07.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import Models

protocol TodayCollectionViewLayoutProtocol: UICollectionViewLayout {
	func setIsCollectionCompact(_ isCollectionCompact: Bool)
	func makeCollectionViewCompositionalLayout(isCollectionCompact: Bool) -> UICollectionViewLayout
}

final class TodayCollectionViewLayout: UICollectionViewLayout {

	// MARK: Properties

	/// The collection is compact, when the width and height are equal to (.compact, .regular)
	/// default = true
	var isCollectionCompact = true
}

// MARK: View Layout Interface

extension TodayCollectionViewLayout: TodayCollectionViewLayoutProtocol {
	func setIsCollectionCompact(_ isCollectionCompact: Bool) {
		self.isCollectionCompact = isCollectionCompact
	}

	func makeCollectionViewCompositionalLayout(isCollectionCompact: Bool) -> UICollectionViewLayout {
		self.isCollectionCompact = isCollectionCompact

		let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, _) -> NSCollectionLayoutSection? in
			guard let self = self else { assertionFailure(); return nil }
			switch TodaySections.allCases[sectionIndex] {
			case .topStories, .science, .technology: return self.makeTitleNewsLayoutSection()
			case .otherTopStories, .otherScience, .otherTechnology: return self.makeOtherNewsLayoutSection()
			}
		}

		return layout
	}
}

// MARK: Sections

private extension TodayCollectionViewLayout {
	func makeTitleNewsLayoutSection() -> NSCollectionLayoutSection {
		let topStoriesLayoutSize = NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(1.0),
			heightDimension: .estimated(TitleNewsTopicCollectionViewCell.getEstimatedHeight()))
		let titleNewsTopicItem = NSCollectionLayoutItem(layoutSize: topStoriesLayoutSize)

		let topStoriesGroup = NSCollectionLayoutGroup.horizontal(
			layoutSize: topStoriesLayoutSize, subitem: titleNewsTopicItem, count: isCollectionCompact ? 1 : 2)
		topStoriesGroup.interItemSpacing = .fixed(TodayLayout.safeHorizontalDistance.rawValue)
		topStoriesGroup.contentInsets = NSDirectionalEdgeInsets(
			top: 0,
			leading: TodayLayout.safeHorizontalDistance.rawValue,
			bottom: 0,
			trailing: TodayLayout.safeHorizontalDistance.rawValue)

		let section = NSCollectionLayoutSection(group: topStoriesGroup)
		section.boundarySupplementaryItems = [makeSectionHeaderLayout()]
		return section
	}

	func makeOtherNewsLayoutSection() -> NSCollectionLayoutSection {
		let newsTopicItemLayoutSize = NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(1.0),
			heightDimension: .estimated(OtherNewsTopicCollectionViewCell.getEstimatedHeight()))
		let newsTopicItem = NSCollectionLayoutItem(layoutSize: newsTopicItemLayoutSize)

		let newsItemsInGroupCount = 2
		let newsGroupLayoutSize = NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(isCollectionCompact ? 0.85 : 0.425),
			heightDimension: .estimated(
				CGFloat(newsItemsInGroupCount) * OtherNewsTopicCollectionViewCell.getEstimatedHeight()))
		let newsGroup = NSCollectionLayoutGroup.vertical(
			layoutSize: newsGroupLayoutSize, subitem: newsTopicItem, count: newsItemsInGroupCount)
		newsGroup.interItemSpacing = .fixed(TodayLayout.topicHorizontalDistance.rawValue)
		newsGroup.contentInsets = NSDirectionalEdgeInsets(
			top: 0, leading: 0, bottom: 0, trailing: TodayLayout.safeHorizontalDistance.rawValue)

		let section = NSCollectionLayoutSection(group: newsGroup)
		section.orthogonalScrollingBehavior = .groupPaging
		section.contentInsets = NSDirectionalEdgeInsets(
			top: 0,
			leading: TodayLayout.safeHorizontalDistance.rawValue,
			bottom: TodayLayout.topicHorizontalDistance.rawValue,
			trailing: TodayLayout.safeHorizontalDistance.rawValue)
		section.boundarySupplementaryItems = [makeSectionFooterLayout()]
		return section
	}
}

// MARK: Supplementary Items

private extension TodayCollectionViewLayout {
	func makeSectionHeaderLayout() -> NSCollectionLayoutBoundarySupplementaryItem {
		let sectionHeaderLayoutSize = NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(1.0),
			heightDimension: .estimated(TodaySectionHeaderCollectionReusableView.getEstimatedHeight()))

		let sectionHeaderLayout = NSCollectionLayoutBoundarySupplementaryItem(
			layoutSize: sectionHeaderLayoutSize,
			elementKind: UICollectionView.elementKindSectionHeader,
			alignment: .top)
		return sectionHeaderLayout
	}

	func makeSectionFooterLayout() -> NSCollectionLayoutBoundarySupplementaryItem {
		let sectionFooterLayoutSize = NSCollectionLayoutSize(
			widthDimension: .fractionalWidth(1.0),
			heightDimension: .estimated(MoreSectionFooterCollectionReusableView.getEstimatedHeight()))

		let sectionFooterLayout = NSCollectionLayoutBoundarySupplementaryItem(
			layoutSize: sectionFooterLayoutSize,
			elementKind: UICollectionView.elementKindSectionFooter,
			alignment: .bottom)
		return sectionFooterLayout
	}
}
