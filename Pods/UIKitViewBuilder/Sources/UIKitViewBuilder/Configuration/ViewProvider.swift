//
//  ViewProvider.swift
//  UIKitViewBuilder
//
//  Created by ahmed suliman on 20/12/2024.
//

import Foundation

@available(iOS 14.0, *)
public protocol ViewProviderProtocol: AnyObject {
    var identifier: String? { get }
    var bundle: Bundle? { get }
    init()
}

public extension ViewProviderProtocol {
    var identifier: String? { nil }
}
