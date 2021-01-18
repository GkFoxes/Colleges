//
//  Assets.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 13.06.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

public enum Assets: String {

	// MARK: Tabs

	case todayTab
	case favoritesTab

	// MARK: System Images

	case squareRighthalfFill = "square.righthalf.fill"
	case archiveboxFill = "archivebox.fill"
	case bookmark = "bookmark"
	case bookmarkFill = "bookmark.fill"

	// MARK: Public Properties

	public var image: UIImage {
		guard let bundle = Bundle(identifier: "ru.GkFoxes.PravdaUIKit"),
			let image = UIImage(named: self.name, in: bundle, compatibleWith: nil)
			else { assertionFailure(); return UIImage() }
		return image
	}

	public var systemImage: UIImage {
		guard let image = UIImage(systemName: self.name) else { assertionFailure(); return UIImage() }
		return image
	}

	static func getImage(named: String) -> UIImage {
		guard let bundle = Bundle(identifier: "ru.GkFoxes.PravdaUIKit"),
			let image = UIImage(named: named, in: bundle, compatibleWith: nil)
			else { assertionFailure(); return UIImage() }
		return image
	}

	// MARK: Private Properties

	private var name: String {
		return self.rawValue
	}
}
