//
//  TodayViewControllerProtocol.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 01.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import Models

public protocol TodayViewControllerProtocol: UIViewController {
	func tapOnMoreViewAction(navigationTitle: String)
	func pushDetailNewsViewController(with todayNewsItem: NewsItem)
}
