//
//  SafariViewControllerDelegate.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 14.08.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import SafariServices

public protocol SafariViewControllerDelegate: SFSafariViewControllerDelegate, UIViewController {
	func presentUrl(linkString: String?)
}

public extension SafariViewControllerDelegate {
	func presentUrl(linkString: String?) {
		guard let linkString = linkString,
			let linkUrl = URL(string: linkString),
			UIApplication.shared.canOpenURL(linkUrl) else {
				let alert = UIAlertController(
					title: Strings.canNotOpenWebsite.rawValue,
					message: nil,
					preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: Strings.okCapital.rawValue, style: .default))
				return self.present(alert, animated: true, completion: nil)
		}

		let safariViewController = SFSafariViewController(url: linkUrl)
		self.present(safariViewController, animated: true)
	}
}
