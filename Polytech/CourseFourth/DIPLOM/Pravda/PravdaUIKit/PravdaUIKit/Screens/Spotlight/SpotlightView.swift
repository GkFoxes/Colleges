//
//  SpotlightView.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 03.09.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

import Models

public protocol SpotlightViewProtocol: ListViewProtocol {
	func viewWillAppear(_ animated: Bool)

	func setItems(_ newsItem: [NewsItem])
	func getItem(for indexPath: IndexPath) -> NewsItem?
}

public final class SpotlightView: UIView {

	// MARK: Properties

	public var selectedItemHandler: ((IndexPath) -> Void)?

	private let dataSource: SpotlightTableViewDataSourceProtocol = SpotlightTableViewDataSource()
	private let output = SpotlightTableViewDelegate()

	// MARK: Views

	private let tableView: UITableView

	// MARK: Life Cycle

	override init(frame: CGRect) {
		tableView = UITableView(frame: frame)
		super.init(frame: frame)

		setupTableViewAppearances()
		setupTableViewLayout()
		setupSelectedItemHandler()
	}

	public func viewWillAppear(_ animated: Bool) {
		if let selectedIndexPath = tableView.indexPathForSelectedRow {
			tableView.deselectRow(at: selectedIndexPath, animated: animated)
		}
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: View Interface

extension SpotlightView: SpotlightViewProtocol {
	public func setItems(_ newsItem: [NewsItem]) {
		dataSource.setItems(newsItem)
	}

	public func getItem(for indexPath: IndexPath) -> NewsItem? {
		dataSource.getItem(for: indexPath)
	}
}

// MARK: Views Appearances

private extension SpotlightView {
	func setupTableViewAppearances() {
		tableView.delegate = output
		tableView.dataSource = dataSource

		tableView.register(
			SpotlightTableViewCell.self,
			forCellReuseIdentifier: SpotlightTableViewCell.reuseIdentifier)

		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = SpotlightTableViewCell.getEstimatedHeight()

		tableView.backgroundColor = .systemBackground
	}
}

// MARK: View Layout

private extension SpotlightView {
	func setupTableViewLayout() {
		self.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			tableView.topAnchor.constraint(equalTo: self.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
		])
	}
}

// MARK: Table Delegate

private extension SpotlightView {
	func setupSelectedItemHandler() {
		self.output.selectedItemHandler = { [weak self] indexPath in
			guard let self = self else { return assertionFailure() }
			self.selectedItemHandler?(indexPath)
		}
	}
}
