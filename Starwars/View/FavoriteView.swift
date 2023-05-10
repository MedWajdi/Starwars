//
//  FavoriteView.swift
//  Starwars
//
//  Created by Mohamed Brahem on 09/05/2023.
//

import Foundation
import UIKit

final class FavoriteView: UIView {

    // MARK: - Subviews

    let refreshControl = UIRefreshControl()

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = FavoriteTableViewCell.Constants.cellHeight
        tableView.rowHeight = UITableView.automaticDimension
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.tableFooterView = UIView()
        return tableView
    }()

    // MARK: - Setup

    func setupView() {
        backgroundColor = .white
    }

    func setupSubview() {
        tableView.refreshControl = refreshControl
        addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.leading.trailing.bottom.top.equalToSuperview()
        }
    }
}
