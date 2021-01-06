//
//  Extentions.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import UIKit

extension UIView {
    
    func fillFull(for view: UIView, insets: UIEdgeInsets = .zero) {
        view.addConstraints([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom),
        ])
    }
  
    func fillSuperview() {
        anchor(top: superview?.safeAreaLayoutGuide.topAnchor, left: superview?.leftAnchor, right: superview?.rightAnchor, bottom: superview?.safeAreaLayoutGuide.bottomAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10, paddingBottom: 10)
    }

    func anchor (top:NSLayoutYAxisAnchor? = nil,
                 left:NSLayoutXAxisAnchor? = nil,
                 right:NSLayoutXAxisAnchor? = nil,
                 bottom:NSLayoutYAxisAnchor? = nil,
                 paddingTop:CGFloat = 0,
                 paddingLeft:CGFloat = 0,
                 paddingRight:CGFloat = 0,
                 paddingBottom:CGFloat = 0,
                 width:CGFloat? = nil,
                 height:CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    func centerX(inView view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func centerY(inView view: UIView) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    func heightEqualToMultiplier (inView view: UIView,multiplier: CGFloat) {
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
    }
    
   
}
public protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}
 
extension Optional: OptionalType {
    public var value: Wrapped? {
        return self
    }
 
    @discardableResult
    public func then(_ closure: (Wrapped) -> Void) -> Optional {
        if case .some(let item) = self {
            closure(item)
        }
 
        return self
    }
 
    public func otherwise(_ closure: () -> Void) {
        if case .none = self {
            closure()
        }
    }
}

