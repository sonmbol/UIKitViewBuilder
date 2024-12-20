//
//  ViewProvider.swift
//  UIKitViewBuilder
//
//  Created by ahmed suliman on 20/12/2024.
//

import Foundation

@available(iOS 14.0, *)
public protocol ViewProviderProtocol {
    var identifier: String? { get }
    var bundle: Bundle? { get }
}

public extension ViewProviderProtocol {
    var identifier: String? { nil }
    var bundle: Bundle? { nil }
}

@available(iOS 14.0, *)
public struct ViewProvider: ViewProviderProtocol {
    public let identifier: String?
    public let bundle: Bundle?

    public init(identifier: String?, bundle: Bundle?) {
        self.identifier = identifier
        self.bundle = bundle
    }
}
