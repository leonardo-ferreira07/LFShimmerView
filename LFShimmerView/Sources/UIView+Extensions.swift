//
//  UIView+Extensions.swift
//  LFShimmerView
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 29/08/17.
//

import UIKit

extension UIView {
    
    // MARK: - Triangle
    
    public func addTringleView(_ rect: CGRect, fillColor: UIColor) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        context.closePath()
        
        context.setFillColor(fillColor.cgColor)
        context.fillPath()
    }
}
