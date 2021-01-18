//
//  FavoritesMocks.swift
//  Models
//
//  Created by Дмитрий Матвеенко on 23.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

public struct FavoritesMocks {
	public static func make() -> [NewsItem] {
		let isOnlyOneItem = false

		return NewsItem.makeTopStoriesMock(isOnlyOneItem: isOnlyOneItem)
			+ NewsItem.makeScienceMock(isOnlyOneItem: isOnlyOneItem)
			+ NewsItem.makeTechnologyMock(isOnlyOneItem: isOnlyOneItem)
	}
}
