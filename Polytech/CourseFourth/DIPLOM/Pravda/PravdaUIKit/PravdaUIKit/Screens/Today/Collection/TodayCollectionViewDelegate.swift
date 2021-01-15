//
//  TodayCollectionViewDelegate.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 28.07.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

protocol TodayCollectionViewDelegateProtocol: ListViewDelegateProtocol, UICollectionViewDelegate {
	var detailNewsViewControllerHandler: ((IndexPath) -> DetailNewsViewControllerProtocol)? { get set }
}

final class TodayCollectionViewDelegate: NSObject {

	// MARK: Properties

	var selectedItemHandler: ((IndexPath) -> Void)?
	var detailNewsViewControllerHandler: ((IndexPath) -> DetailNewsViewControllerProtocol)?
}

// MARK: Delegate Interface

extension TodayCollectionViewDelegate: TodayCollectionViewDelegateProtocol {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.selectedItemHandler?(indexPath)
	}

	func collectionView(
		_ collectionView: UICollectionView,
		contextMenuConfigurationForItemAt indexPath: IndexPath,
		point: CGPoint
	) -> UIContextMenuConfiguration? {
		let configuration = UIContextMenuConfiguration(identifier: indexPath as NSIndexPath, previewProvider: {
			[weak self] () -> UIViewController? in
				guard let self = self,
					let detailNewsViewController = self.detailNewsViewControllerHandler?(indexPath) as? UIViewController
					else { assertionFailure(); return nil }
				return detailNewsViewController
			}, actionProvider: { _ -> UIMenu? in
				guard let detailNewsViewController = self.detailNewsViewControllerHandler?(indexPath)
					else { assertionFailure(); return nil }
				let action = UIAction(
					title: detailNewsViewController.getFavoriteButtonTitle(),
					image: detailNewsViewController.getFavoriteButtonImage()) { _ in
						detailNewsViewController.tapOnNavigationFavoriteButtonItem(nil)
				}
			return UIMenu(title: "", children: [action])
		})
		return configuration
	}

	func collectionView(
		_ collectionView: UICollectionView,
		willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration,
		animator: UIContextMenuInteractionCommitAnimating
	) {
		guard let indexPath = configuration.identifier as? IndexPath else { assertionFailure(); return }
		animator.addCompletion {
			self.selectedItemHandler?(indexPath)
		}
	}
}
