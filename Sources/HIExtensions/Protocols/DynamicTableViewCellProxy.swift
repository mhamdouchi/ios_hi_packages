//
//  DynamicTableViewCellProxy.swift
//
//
//  Created by Mohamed Hamdouchi on 2/28/21.
//

import UIKit

public protocol DynamicTableViewCellProxy {
    func configureCell<T>(_ controller: T, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}
