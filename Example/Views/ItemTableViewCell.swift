//
//  ItemTableViewCell.swift
//  Example
//
//  Created by ahmed suliman on 25/12/2024.
//

import UIKitViewBuilder
import UIKit

extension ViewProviderProtocol {
    var bundle: Bundle? { .main }
}
class ItemTableViewCell: UITableViewCell, ViewProviderProtocol {
    @IBOutlet weak var itemView: ItemView!

}
