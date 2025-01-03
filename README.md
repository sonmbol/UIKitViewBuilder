# UIKitViewBuilder

**UIKitViewBuilder** is a versatile Swift framework designed to seamlessly convert any `UIView`, `UITableViewCell`, or `UICollectionViewCell` into a `SwiftUI` view. This enables configuration and responsiveness to `Publisher`, making the integration of existing UI components into SwiftUI a breeze. Enhance your development experience with efficiency, excitement, and a touch of magic!

## Features

- **Seamless Integration**: Effortlessly convert any `UIView`, `UITableViewCell`, or `UICollectionViewCell` to a `SwiftUI` view.
- **Configurable and Responsive**: Fully compatible with `SwiftUI` and responsive to `Publisher`.
- **Result Builder**: Simplifies the implementation of `UIView`, `UITableViewCell`, or `UICollectionViewCell` as `SwiftUI` views using `UIKitViewBuilder`.

## Installation

### Swift Package Manager

To integrate `UIKitViewBuilder` into your project using Swift Package Manager, add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/sonmbol/UIKitViewBuilder.git", from: "1.0.0")
]
```


#### CocoaPods


To integrate `UIKitViewBuilder` using CocoaPods, add the following to your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '14.0'

target 'YourAppTargetName' do
  use_frameworks!
  pod 'UIKitViewBuilder'
end
```

### Usage

The core idea behind `UIKitViewBuilder` is to convert any `UIView`, `UITableViewCell`, or `UICollectionViewCell` into a `SwiftUI` view, making it configurable and responsive to `Publisher`. Below are some examples to get you started.

### Example Usage

#### Creating a View

```swift
struct ContentView: View {
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
```


#### UIKitViewBuilder for Single Cells

```swift
@UIKitViewBuilder
func buildLabelView() -> some View {
    LabelView { view in
        view.label.text = "SwiftUI View UIView"
    }
}

@UIKitViewBuilder
func buildEmptyLabelView() -> some View {
    LabelView()
        .set(\.label.text, to: "Dynamic Content Here")
        .set(\.backgroundColor, to: .red)
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
```


#### UIKitViewBuilder for Multiple Cells

```swift
@UIKitViewBuilder
func buildLabelViews() -> some View {
    LabelView { cell in
        cell.label.text = "First UIView"
    }
    LabelView { cell in
        cell.label.text = "Second UIView"
    }
    LabelView { cell in
        cell.label.text = "Third UIView"
    }
}

@UIKitViewBuilder
func buildTableViewCells() -> some View {
    LabelTableViewCell { cell in
        cell.label.text = "First TableViewCell"
    }
    LabelTableViewCell { cell in
        cell.label.text = "Second TableViewCell"
    }
    LabelTableViewCell { cell in
        cell.label.text = "Third TableViewCell"
    }
}

@UIKitViewBuilder
func buildCollectionViewCells() -> some View {
    LabelCollectionViewCell { cell in
        cell.label.text = "First CollectionViewCell"
    }
    LabelCollectionViewCell { cell in
        cell.label.text = "Second CollectionViewCell"
    }
    LabelCollectionViewCell { cell in
        cell.label.text = "Third CollectionViewCell"
    }
}
```


#### UIKitViewBuilder for Multiple Cells

```swift
@UIKitViewBuilder
func buildLabelViews() -> some View {
    LabelView { cell in
        cell.label.text = "First UIView"
    }
    LabelView { cell in
        cell.label.text = "Second UIView"
    }
    LabelView { cell in
        cell.label.text = "Third UIView"
    }
}

@UIKitViewBuilder
func buildTableViewCells() -> some View {
    LabelTableViewCell { cell in
        cell.label.text = "First TableViewCell"
    }
    LabelTableViewCell { cell in
        cell.label.text = "Second TableViewCell"
    }
    LabelTableViewCell { cell in
        cell.label.text = "Third TableViewCell"
    }
}

@UIKitViewBuilder
func buildCollectionViewCells() -> some View {
    LabelCollectionViewCell { cell in
        cell.label.text = "First CollectionViewCell"
    }
    LabelCollectionViewCell { cell in
        cell.label.text = "Second CollectionViewCell"
    }
    LabelCollectionViewCell { cell in
        cell.label.text = "Third CollectionViewCell"
    }
}
```


### How It Works


- **Extraction**: The `UIView`, `UITableViewCell`, or `UICollectionViewCell` is first extracted as a `UIView`.
- **Container**: A container is added around it to override `intrinsicContentSize` since `SwiftUI` respects the size only, not the constraints.
- **Content Integration**: The cell content is added inside the container.
- **Result Builder**: To make the view easy to use in `SwiftUI`, a result builder called `UIKitViewBuilder` is used.

By following this approach, you can easily integrate your existing `UIView`, `UITableViewCell`, or `UICollectionViewCell` components into `SwiftUI`, making your development process smoother and more efficient.
