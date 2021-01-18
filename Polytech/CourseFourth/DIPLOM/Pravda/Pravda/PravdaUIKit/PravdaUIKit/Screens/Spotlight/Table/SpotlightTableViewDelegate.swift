//
//  SpotlightTableViewDelegate.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 03.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

final class SpotlightTableViewDelegate: NSObject {

	// MARK: Properties

	var selectedItemHandler: ((IndexPath) -> Void)?
}

// MARK: Delegate Interface

extension SpotlightTableViewDelegate: ListViewDelegateProtocol, UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.selectedItemHandler?(indexPath)
	}
}
