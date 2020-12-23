//
//  Extentions.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import UIKit

extension UIView {
    
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



