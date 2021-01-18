//
//  DetailNewsViewControllerProtocol.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 31.08.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

@objc public protocol DetailNewsViewControllerProtocol {
	@objc func tapOnNavigationFavoriteButtonItem(_ sender: UIBarButtonItem?)
	func getFavoriteButtonImage() -> UIImage
	func getFavoriteButtonTitle() -> String
}
