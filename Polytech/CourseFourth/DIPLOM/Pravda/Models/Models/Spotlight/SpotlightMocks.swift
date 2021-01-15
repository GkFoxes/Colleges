//
//  SpotlightMocks.swift
//  Models
//
//  Created by Дмитрий Матвеенко on 03.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

public struct SpotlightMocks {
	public static func make() -> [NewsItem] {
		let isRemoveFirstItem = false
		return NewsItem.makeOtherTopStoriesMock(isRemoveFirstItem: isRemoveFirstItem)
			+ NewsItem.makeOtherScienceMock(isRemoveFirstItem: isRemoveFirstItem)
			+ NewsItem.makeOtherTechnologyMock(isRemoveFirstItem: isRemoveFirstItem)
	}
}
