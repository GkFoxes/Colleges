//
//  SpotlightTableViewDataSource.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 03.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import Models

protocol SpotlightTableViewDataSourceProtocol: UITableViewDataSource {
	func setItems(_ newsItems: [NewsItem])
	func getItem(for indexPath: IndexPath) -> NewsItem
}

final class SpotlightTableViewDataSource: NSObject {

	// MARK: Properties

	private var newsItems = [NewsItem]()
}

// MARK: Data Source Interface

extension SpotlightTableViewDataSource: SpotlightTableViewDataSourceProtocol {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return newsItems.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: SpotlightTableViewCell.reuseIdentifier,
			for: indexPath) as? SpotlightTableViewCellProtocol
			else { assertionFailure(); return UITableViewCell() }

		let spotlightNewsItem = newsItems[indexPath.row]
		cell.setupContent(
			title: spotlightNewsItem.title,
			source: spotlightNewsItem.source,
			timePublication: spotlightNewsItem.timePublication)
		return cell
	}

	func setItems(_ newsItems: [NewsItem]) {
		self.newsItems = newsItems
	}

	func getItem(for indexPath: IndexPath) -> NewsItem {
		return newsItems[indexPath.row]
	}
}
