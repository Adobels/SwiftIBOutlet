//
//  UIViewDSL+Subviews.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 29/09/2023.
//

import UIKit

@MainActor
extension UIViewDSL where Self: UIView {

    @discardableResult
    public func ibSubviews(@UIViewBuilder _ content: () -> [UIView]) -> Self {
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }
    
    @discardableResult
    public func ibSubviews(@UIViewBuilder _ content: (Self) -> [UIView]) -> Self {
        let contentWrapper: (UIView) -> [UIView] = { arg1 in
            content(arg1 as! Self)
        }
        UIViewDSLEngine.shared.addSubviews(contentWrapper, to: self)
        return self
    }
    
    @discardableResult
    public func callAsFunction(@UIViewBuilder _ content: () -> [UIView]) -> Self {
        UIViewDSLEngine.shared.addSubviews(content, to: self)
        return self
    }
    
    @discardableResult
    public func callAsFunction(@UIViewBuilder _ content: (Self) -> [UIView]) -> Self {
        let contentWrapper: (UIView) -> [UIView] = { arg1 in
            content(arg1 as! Self)
        }
        UIViewDSLEngine.shared.addSubviews(contentWrapper, to: self)
        return self
    }
}
