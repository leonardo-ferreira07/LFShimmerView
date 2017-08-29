//
//  DesignableShimmerView.swift
//  LFShimmerView
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 29/08/17.
//

import UIKit

@IBDesignable
open class DesignableView: UIView, ShimmerEffect {
    
    var shadowLayer: UIView?
    
    deinit {
        shadowLayer?.removeFromSuperview()
        shadowLayer = nil
    }
    
    @IBInspectable open var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable open var shadowColor: UIColor = UIColor.clear {
        didSet{
            updateShadow()
        }
    }
    
    @IBInspectable open var shadowOffset: CGSize = CGSize.zero {
        didSet{
            updateShadow()
        }
    }
    
    @IBInspectable open var shadowOpacity: Float = 0 {
        didSet{
            updateShadow()
        }
    }
    
    @IBInspectable open var shadowRadius: CGFloat = 0 {
        didSet{
            updateShadow()
        }
    }
    
    @IBInspectable open var isTriangle: Bool = false
    
    @IBInspectable open var triangleColor: UIColor = UIColor.white
    
    @IBInspectable var autoRadius:Bool = false {
        didSet {
            if autoRadius {
                cornerRadius = layer.frame.height / 2
            }
        }
    }
    
    // MARK:- Shimmer
    
    override open static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    open var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    open var animationDuration: TimeInterval = 3
    
    open var animationDelay: TimeInterval = 1.5
    
    open var gradientHighlightRatio: Double = 0.3
    
    @IBInspectable open var shimmerGradientTint: UIColor = .black
    
    @IBInspectable open var shimmerGradientHighlight: UIColor = .white
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        if(self.shadowRadius > 0) {
            if shadowLayer != nil {
                shadowLayer?.removeFromSuperview()
                shadowLayer = nil
            }
            
            shadowLayer = UIView(frame: self.frame)
            shadowLayer!.backgroundColor = UIColor.clear
            shadowLayer!.layer.shadowColor = self.shadowColor.cgColor
            shadowLayer!.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
            shadowLayer!.layer.shadowOffset = self.shadowOffset
            shadowLayer!.layer.shadowOpacity = self.shadowOpacity
            shadowLayer!.layer.shadowRadius = self.shadowRadius
            shadowLayer!.layer.shouldRasterize = true
            shadowLayer!.layer.masksToBounds = true
            shadowLayer!.clipsToBounds = false
            
            self.superview?.addSubview(shadowLayer!)
            self.superview?.bringSubview(toFront: self)
            
        }
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if self.isTriangle {
            addTringleView(rect, fillColor: self.triangleColor)
        }
    }
    
    // MARK: - Shadow
    
    open func updateShadow() {
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowPath = UIBezierPath(rect: self.layer.bounds).cgPath
        self.layer.masksToBounds = true // this will not update the shadow, but fixes the corner radius
    }
}

