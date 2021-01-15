//
//  FavoritesCollectionViewDelegateFlowLayout.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 23.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

extension FavoritesCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		sizeForItemAt indexPath: IndexPath)
	-> CGSize {
		return CGSize(
			width: collectionView.safeAreaLayoutGuide.layoutFrame.width,
			height: FavoritesCollectionViewCell.getHeight())
	}

	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		minimumLineSpacingForSectionAt section: Int
	) -> CGFloat {
		return FavoritesLayout.safeInterDistance.rawValue
	}

	func collectionView(
		_ collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		insetForSectionAt section: Int
	) -> UIEdgeInsets {
		return UIEdgeInsets(
			top: FavoritesLayout.safeInterDistance.rawValue,
			left: .zero,
			bottom: FavoritesLayout.safeInterDistance.rawValue,
			right: .zero)
	}
}
