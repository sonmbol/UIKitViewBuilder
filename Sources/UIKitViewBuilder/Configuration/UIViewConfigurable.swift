//
//  UIViewConfigurable.swift
//  CellBuilder
//
//  Created by ahmed suliman on 17/12/2024.
//

import UIKit
import SwiftUICore

@available(iOS 14.0, *)
public protocol UIViewConfigurable: UIView, KeyPathReferenceWritable {
    init()
    static func createCell(provider: ViewProviderProtocol?) -> Self
}

public extension UIViewConfigurable {
    func callAsFunction(_ configuration: @escaping (Self) -> Void) -> (Self) -> Void {
        configuration
    }

    func makeView() -> some View {
        DynamicViewWrapper(component: .view(self))
    }

    static func makeView(_ configuration: @escaping (Self) -> Void = { _ in }) -> some View {
        DynamicViewWrapper(component: .configuration(configuration))
    }
}

extension UIViewConfigurable {
    private static func isCellFromNib(provider: ViewProviderProtocol?) -> Bool {
        let className = provider?.identifier ?? String(describing: type(of: self))
        return provider?.bundle?.path(forResource: className, ofType: "nib") != nil
    }

    private static func loadFromNib(provider: ViewProviderProtocol?) -> Self {
        let className = provider?.identifier ?? String(describing: type(of: self))
        let nib = UINib(nibName: className, bundle: provider?.bundle)
        guard let cell = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            return Self()
        }
        return cell
    }

    public static func createCell(provider: ViewProviderProtocol?) -> Self {
        if isCellFromNib(provider: provider) {
            return loadFromNib(provider: provider)
        } else {
            return Self()
        }
    }
}

@available(iOS 14.0, *)
extension UIView: UIViewConfigurable { }
