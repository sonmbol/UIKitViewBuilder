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
public struct DynamicViewWrapper<CellType: UIViewConfigurable>: UIViewRepresentable {
    public var component: UIKitViewComponent<CellType>

    public init(component: UIKitViewComponent<CellType>) {
        self.component = component
    }

    public func makeUIView(context: Context) -> ContainerView {
        let cell: CellType
        switch component {
            case .view(let preconfiguredView):
            cell = preconfiguredView
            case .configuration(let configure):
            cell = CellType.createCell(provider: (CellType.self as? ViewProviderProtocol))
            configure(cell)
        }

        let containerView = ContainerView(cell: cell)
        cell.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(cell)

        NSLayoutConstraint.activate([
            cell.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
            cell.topAnchor.constraint(equalTo: containerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
        ])

        return containerView
    }

    public func updateUIView(_ uiView: ContainerView, context: Context) {
        guard case .configuration(let configure) = component else { return }
        let cell = uiView.cell
        configure(cell)
    }
}

@available(iOS 14.0, *)
public extension DynamicViewWrapper {
    final class ContainerView: UIView {
        let cell: CellType

        init(cell: CellType) {
            self.cell = cell
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
            let fittingSize = cell.systemLayoutSizeFitting(
                targetSize,
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
            )

            return fittingSize
        }
    }
}
