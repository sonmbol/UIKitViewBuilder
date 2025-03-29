//
//  DynamicViewWrapper.swift
//
//
//  Created by ahmed suliman on 16/12/2024.
//

import SwiftUI
import UIKit

public enum UIKitViewComponent<T: UIViewConfigurable> {
    case configuration((T) -> Void)
    case view(T)
}

@available(iOS 14.0, *)
public struct DynamicViewWrapper<ViewType: UIViewConfigurable>: UIViewRepresentable {
    public var component: UIKitViewComponent<ViewType>
    let shouldLoadFromNib: Bool

    public init(component: UIKitViewComponent<ViewType>, shouldLoadFromNib: Bool = false) {
        self.component = component
        self.shouldLoadFromNib = shouldLoadFromNib
    }

    public func makeUIView(context: Context) -> ContainerView {
        let contentView: ViewType
        switch component {
            case .view(let preconfiguredView):
            contentView = preconfiguredView
            case .configuration(let configure):
            contentView = shouldLoadFromNib ? ViewType.loadFromNib() : ViewType()
            configure(contentView)
        }

        let containerView = ContainerView(contentView: contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: containerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        return containerView
    }

    public func updateUIView(_ uiView: ContainerView, context: Context) {
        guard case .configuration(let configure) = component else { return }
        configure(uiView.contentView)
    }
}

@available(iOS 14.0, *)
public extension DynamicViewWrapper {
    final class ContainerView: UIView {
        let contentView: ViewType

        init(contentView: ViewType) {
            self.contentView = contentView
            super.init(frame: .zero)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        public override func layoutSubviews() {
            super.layoutSubviews()
            invalidateIntrinsicContentSize()
        }

        public override var intrinsicContentSize: CGSize {
            let targetSize = CGSize(width: bounds.width, height: UIView.layoutFittingCompressedSize.height)
            let fittingSize = contentView.systemLayoutSizeFitting(
                targetSize,
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
            )

            return fittingSize
        }
    }
}
