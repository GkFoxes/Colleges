//
//  TodayView.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 23.07.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import Models

public protocol TodayViewProtocol: ListViewProtocol {
	var detailNewsViewController: ((IndexPath) -> DetailNewsViewControllerProtocol)? { get set }

	func setItems(_ todayNewsItems: TodayNewsItems)
	func getItem(for indexPath: IndexPath) -> NewsItem?
	func updateCollectionView(isCollectionCompact: Bool, items: TodayNewsItems)
}

public final class TodayView: UIView {

	// MARK: Properties

	public override class var requiresConstraintBasedLayout: Bool { return true }

	public var selectedItemHandler: ((IndexPath) -> Void)?
	public var detailNewsViewController: ((IndexPath) -> DetailNewsViewControllerProtocol)?

	private let collectionViewLayout: TodayCollectionViewLayoutProtocol = TodayCollectionViewLayout()
	private let dataSource: TodayCollectionViewDiffableDataSourceProtocol
	private let output: TodayCollectionViewDelegateProtocol = TodayCollectionViewDelegate()

	// MARK: Views

	private let collectionView: UICollectionView

	// MARK: Life Cycle

	public init(todayViewController: TodayViewControllerProtocol, isCollectionCompact: Bool, frame: CGRect) {
		collectionView = UICollectionView(
			frame: frame,
			collectionViewLayout: collectionViewLayout
				.makeCollectionViewCompositionalLayout(isCollectionCompact: isCollectionCompact))

		dataSource = TodayCollectionViewDiffableDataSource(
			collectionView: collectionView, todayViewController: todayViewController)
		super.init(frame: frame)

		setupCollectionViewAppearances()
		setupCollectionViewLayout()
		setupCollectionViewDelegate()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: Changes Cycle

	public override func layoutSubviews() {
		super.layoutSubviews()

		collectionView.refreshCollectionViewLayout()
	}
}

// MARK: View Interface

extension TodayView: TodayViewProtocol {
	public func setItems(_ todayNewsItems: TodayNewsItems) {
		dataSource.setItems(todayNewsItems)
	}

	public func getItem(for indexPath: IndexPath) -> NewsItem? {
		dataSource.getItem(for: indexPath)
	}

	public func updateCollectionView(isCollectionCompact: Bool, items: TodayNewsItems) {
		collectionViewLayout.setIsCollectionCompact(isCollectionCompact)
		dataSource.setItems(items)
	}
}

// MARK: Views Appearances

private extension TodayView {
	func setupCollectionViewAppearances() {
		collectionView.delegate = output

		collectionView.register(
			TitleNewsTopicCollectionViewCell.self,
			forCellWithReuseIdentifier: TitleNewsTopicCollectionViewCell.reuseIdentifier)
		collectionView.register(
			OtherNewsTopicCollectionViewCell.self,
			forCellWithReuseIdentifier: OtherNewsTopicCollectionViewCell.reuseIdentifier)
		collectionView.register(
			TodaySectionHeaderCollectionReusableView.self,
			forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
			withReuseIdentifier: TodaySectionHeaderCollectionReusableView.reuseIdentifier)
		collectionView.register(
			MoreSectionFooterCollectionReusableView.self,
			forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
			withReuseIdentifier: MoreSectionFooterCollectionReusableView.reuseIdentifier)

		collectionView.backgroundColor = .systemBackground
	}
}

// MARK: View Layout

private extension TodayView {
	func setupCollectionViewLayout() {
		self.addSubview(collectionView)
		collectionView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			collectionView.topAnchor.constraint(equalTo: self.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}
}

// MARK: Collection Delegate

private extension TodayView {
	func setupCollectionViewDelegate() {
		setupSelectedItemHandler()
		setupDetailNewsViewController()
	}

	func setupSelectedItemHandler() {
		self.output.selectedItemHandler = { [weak self] indexPath in
			guard let self = self else { return assertionFailure() }
			self.selectedItemHandler?(indexPath)
		}
	}

	func setupDetailNewsViewController() {
		self.output.detailNewsViewControllerHandler  = { [weak self] indexPath in
			guard let self = self,
				let detailNewsViewController = self.detailNewsViewController
				else { fatalError() }
			return detailNewsViewController(indexPath)
		}
	}
}
