//
//  TodayCollectionViewCellProtocol.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 23.07.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

protocol TodayCollectionViewCellProtocol: ListViewCellProtocol, UICollectionViewCell {
	static func getEstimatedHeight() -> CGFloat
	func setupContent(headerImage: UIImage?, source: String, title: String, timePublication: String)
}
