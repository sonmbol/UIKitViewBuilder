//
//  ItemView.swift
//  Example
//
//  Created by ahmed suliman on 25/12/2024.
//

import UIKit

final class ItemView: UIView {
    lazy var titleLabel = createTitleLabel()
    lazy var descriptionLabel = createDescriptionLabel()
    lazy var priceLabel = createPriceLabel()
    lazy var itemImageView = createItemImageView()

    func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }

    func createDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }

    func createPriceLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .systemGreen
        return label
    }

    func createItemImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        let vStack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, priceLabel])
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(vStack)
        addSubview(itemImageView)

        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            vStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            vStack.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16),
            vStack.trailingAnchor.constraint(lessThanOrEqualTo: itemImageView.leadingAnchor, constant: -16),

            itemImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            itemImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 80),
            itemImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
