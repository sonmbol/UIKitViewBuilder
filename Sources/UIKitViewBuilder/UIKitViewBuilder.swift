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
@resultBuilder
public struct UIKitViewFromNibBuilder {

    public static func buildBlock<T: UIViewConfigurable>(_ component: UIKitViewComponent<T>) -> some View {
        DynamicViewWrapper(component: component, shouldLoadFromNib: true)
    }

    public static func buildBlock<T: UIViewConfigurable>(_ components: UIKitViewComponent<T>...) -> some View {
        ForEach(components.indices, id: \.self) { index in
            let component = components[index]
            DynamicViewWrapper(component: component, shouldLoadFromNib: true)
        }
    }

    public static func buildEither<T: UIViewConfigurable>(first component: UIKitViewComponent<T>) -> some View {
        DynamicViewWrapper(component: component, shouldLoadFromNib: true)
    }

    public static func buildEither<T: UIViewConfigurable>(second component: UIKitViewComponent<T>) -> some View {
        DynamicViewWrapper(component: component, shouldLoadFromNib: true)
    }

    public static func buildExpression<T: UIViewConfigurable>(_ expression: T) -> UIKitViewComponent<T> {
        .view(expression)
    }

    public static func buildExpression<T: UIViewConfigurable>(_ expression: @escaping (T) -> Void) -> UIKitViewComponent<T> {
        .configuration(expression)
    }
}

