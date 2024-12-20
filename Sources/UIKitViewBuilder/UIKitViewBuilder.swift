//
//  UIKitViewBuilder.swift
//
//
//  Created by ahmed suliman on 16/12/2024.
//

import SwiftUI

@available(iOS 14.0, *)
@resultBuilder
public struct UIKitViewBuilder {

    public static func buildBlock<T: UIViewConfigurable>(_ component: UIKitViewComponent<T>) -> some View {
        DynamicViewWrapper(component: component)
    }

    public static func buildBlock<T: UIViewConfigurable>(_ components: UIKitViewComponent<T>...) -> some View {
        ForEach(components.indices, id: \.self) { index in
            let component = components[index]
            DynamicViewWrapper(component: component)
        }
    }

    public static func buildEither<T: UIViewConfigurable>(first component: UIKitViewComponent<T>) -> some View {
        DynamicViewWrapper(component: component)
    }

    public static func buildEither<T: UIViewConfigurable>(second component: UIKitViewComponent<T>) -> some View {
        DynamicViewWrapper(component: component)
    }

    public static func buildExpression<T: UIViewConfigurable>(_ expression: T) -> UIKitViewComponent<T> {
        .view(expression)
    }

    public static func buildExpression<T: UIViewConfigurable>(_ expression: @escaping (T) -> Void) -> UIKitViewComponent<T> {
        .configuration(expression)
    }
}


@available(iOS 14.0, *)
#Preview {
    struct TestView: View {
        var body: some View {
            List {
                LabelView.makeView { view in
                    view.label.text = "make SwiftUI View"
                }
                LabelView()
                    .set(\.label.text, to: "make SwiftUI View")
                    .makeView()
                buildEmptyLabelView()
                buildLabelView()
                buildTableViewCell()
                buildCollectionViewCell()
                buildTableViewCells()
                buildCollectionViewCells()
            }
        }

        @UIKitViewBuilder
        func buildEmptyLabelView() -> some View {
            LabelView()
                .set(\.label.text, to: "")
                .set(\.backgroundColor, to: .red)
        }

        @UIKitViewBuilder
        func buildLabelView() -> some View {
            LabelView { view in
                view.label.text = "SwiftUI View UIView"
            }
        }

        @UIKitViewBuilder
        func buildTableViewCell() -> some View {
            LabelTableViewCell { cell in
                cell.label.text = "SwiftUI View TableViewCell"
            }
        }

        @UIKitViewBuilder
        func buildCollectionViewCell() -> some View {
            LabelCollectionViewCell { cell in
                cell.label.text = "SwiftUI View CollectionViewCell"
            }
        }

        @UIKitViewBuilder
        func buildTableViewCells() -> some View {
            LabelTableViewCell { cell in
                cell.label.text = "first TableViewCell"
            }
            LabelTableViewCell { cell in
                cell.label.text = "second TableViewCell"
            }
            LabelTableViewCell { cell in
                cell.label.text = "third TableViewCell"
            }
        }

        @UIKitViewBuilder
        func buildCollectionViewCells() -> some View {
            LabelCollectionViewCell { cell in
                cell.label.text = "first CollectionViewCell"
            }
            LabelCollectionViewCell { cell in
                cell.label.text = "second CollectionViewCell"
            }
            LabelCollectionViewCell { cell in
                cell.label.text = "third CollectionViewCell"
            }
        }
    }

    class LabelTableViewCell: UITableViewCell {
        lazy var label = addLabel()

        func addLabel() -> UILabel {
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.addSubview(label)
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            ])
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    class LabelCollectionViewCell: UICollectionViewCell {
        lazy var label = addLabel()

        func addLabel() -> UILabel {
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(label)
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            ])
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    class LabelView: UIView {
        lazy var label = addLabel()

        func addLabel() -> UILabel {
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(label)
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    return TestView()
}

