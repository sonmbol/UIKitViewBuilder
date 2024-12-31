//
//  ViewProvider.swift
//  UIKitViewBuilder
//
//  Created by ahmed suliman on 20/12/2024.
//

import Foundation

@available(iOS 14.0, *)
public protocol ViewProviderProtocol: AnyObject {
    static var identifier: String? { get }
    static var bundle: Bundle? { get }
}

public extension ViewProviderProtocol {
    static var identifier: String? { nil }
    static var bundle: Bundle? { Bundle(for: type(of: self as AnyObject)) }
}
