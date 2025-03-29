//
//  ContentView.swift
//  Example
//
//  Created by ahmed suliman on 25/12/2024.
//

import UIKitViewBuilder
import UIKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            controlView()
            itemView()
            makeItemView()
            itemCellView()
            makeItemCellView()
        }
    }

    @UIKitViewBuilder
    func controlView() -> some View {
        UIActivityIndicatorView { view in
            view.color = .red
            view.startAnimating()
        }
    }

    @UIKitViewBuilder
    func itemView() -> some View {
        ItemView()
            .set(\.titleLabel.text, to: "Cheese burger")
            .set(\.descriptionLabel.text, to: "tomatoe, cheese, tomatoe, cheese, tomatoe, cheese, tomatoe, cheese")
            .set(\.priceLabel.text, to: "$100")
            .set(\.itemImageView.image, to: UIImage(systemName: "globe"))
    }

    func makeItemView() -> some View {
        ItemView()
            .set(\.titleLabel.text, to: "Cheese burger")
            .set(\.descriptionLabel.text, to: "tomatoe, cheese")
            .set(\.priceLabel.text, to: "$100")
            .set(\.itemImageView.image, to: UIImage(systemName: "globe"))
            .makeView()
    }

    @UIKitViewFromNibBuilder
    func itemCellView() -> some View {
        ItemTableViewCell.callAsFunction()
            .set(\.itemView.titleLabel.text, to: "Cheese burger")
            .set(\.itemView.descriptionLabel.text, to: "tomatoe, cheese")
            .set(\.itemView.priceLabel.text, to: "$100")
            .set(\.itemView.itemImageView.image, to: UIImage(systemName: "globe"))
    }

    @UIKitViewFromNibBuilder
    func makeItemCellView() -> some View {
        ItemTableViewCell { cell in
            cell.itemView.titleLabel.text = "Cheese burger"
            cell.itemView.descriptionLabel.text = "tomatoe, cheese"
            cell.itemView.priceLabel.text = "$100"
            cell.itemView.itemImageView.image = UIImage(systemName: "globe")
        }
    }
}

#Preview {
    ContentView()
}

