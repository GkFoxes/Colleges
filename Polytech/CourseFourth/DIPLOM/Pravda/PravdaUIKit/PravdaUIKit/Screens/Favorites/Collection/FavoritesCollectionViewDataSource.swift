//
//  FavoritesCollectionViewDataSource.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 23.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import Models

protocol FavoritesCollectionViewDataSourceProtocol: UICollectionViewDataSource {
	func setItems(_ newsItems: [NewsItem])
	func getItem(for indexPath: IndexPath) -> NewsItem
}

final class FavoritesCollectionViewDataSource: NSObject {

	// MARK: Properties

	private var newsItems = [NewsItem]()
}

// MARK: Data Source Interface

extension FavoritesCollectionViewDataSource: FavoritesCollectionViewDataSourceProtocol {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return newsItems.count
	}

	func collectionView(
		_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(
				withReuseIdentifier: FavoritesCollectionViewCell.reuseIdentifier,
				for: indexPath) as? FavoritesCollectionViewCellProtocol
			else { assertionFailure(); return UICollectionViewCell() }

		let favoritesNewsItem = newsItems[indexPath.row]
		cell.setupContent(
			fillImage: Assets.getImage(named: favoritesNewsItem.image),
			source: favoritesNewsItem.source,
			title: favoritesNewsItem.title)
		return cell
	}

	func setItems(_ newsItems: [NewsItem]) {
		self.newsItems = newsItems
	}

	func getItem(for indexPath: IndexPath) -> NewsItem {
		return newsItems[indexPath.row]
	}
}
