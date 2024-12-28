//
//  KeyPathReferenceWritable.swift
//  UIKitViewBuilder
//
//  Created by ahmed suliman on 20/12/2024.
//

import class UIKit.UIView

@available(iOS 14.0, *)
public protocol KeyPathReferenceWritable { }

public extension KeyPathReferenceWritable {
    func set<Value>(_ keyPath: ReferenceWritableKeyPath<Self, Value>, to value: Value) -> Self {
        self[keyPath: keyPath] = value
        return self
    }
}
