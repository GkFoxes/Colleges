//
//  DetailNewsFactory.swift
//  Pravda-MVC
//
//  Created by Дмитрий Матвеенко on 05.08.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import Models
import PravdaUIKit

final class DetailNewsFactory {
	public static func make(
		detailNewsItem: NewsItem
	) -> DetailNewsViewControllerProtocol {
		let detailNewsViewController: DetailNewsViewControllerFactoryProtocol & DetailNewsViewControllerProtocol
			= DetailNewsViewController()
		detailNewsViewController.setItem(detailNewsItem)
		return detailNewsViewController
	}
}
