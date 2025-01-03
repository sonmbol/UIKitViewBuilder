//
//  UIViewConfigurable.swift
//  CellBuilder
//
//  Created by ahmed suliman on 17/12/2024.
//

import UIKit
import SwiftUI

@available(iOS 14.0, *)
public protocol UIViewConfigurable: UIView, KeyPathReferenceWritable, ViewProviderProtocol {
    init()
    static func createCell() -> Self
}

public extension UIViewConfigurable {
    func callAsFunction(_ configuration: @escaping (Self) -> Void) -> (Self) -> Void {
        configuration
    }

    static func callAsFunction() -> Self {
        Self.createCell()
    }

    func makeView() -> some View {
        DynamicViewWrapper(component: .view(self))
    }

    static func makeView(_ configuration: @escaping (Self) -> Void = { _ in }) -> some View {
        DynamicViewWrapper(component: .configuration(configuration))
    }
}

extension UIViewConfigurable {
    private static func isCellFromNib() -> Bool {
        let className = identifier ?? String(describing: Self.self)
        return bundle?.path(forResource: className, ofType: "nib") != nil
    }

    private static func loadFromNib() -> Self {
        let className = identifier ?? String(describing: Self.self)
        let nib = UINib(nibName: className, bundle: bundle)
        guard let cell = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            return Self()
        }
        return cell
    }

    public static func createCell() -> Self {
        if isCellFromNib() {
            return loadFromNib()
        } else {
            return Self()
        }
    }
}

@available(iOS 14.0, *)
extension UIView: UIViewConfigurable { }
