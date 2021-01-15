//
//  FavoritesCollectionViewDelegate.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 23.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

final class FavoritesCollectionViewDelegate: NSObject {

	// MARK: Properties

	var selectedItemHandler: ((IndexPath) -> Void)?
}

// MARK: Delegate Interface

extension FavoritesCollectionViewDelegate: ListViewDelegateProtocol, UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.selectedItemHandler?(indexPath)
	}
}
