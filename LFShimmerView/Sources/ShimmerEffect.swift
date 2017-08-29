//
//  ShimmerEffect.swift
//  LFShimmerView
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 29/08/17.
//

import UIKit

// MARK: - Shimmer

public protocol ShimmerEffect {
    
    var animationDuration: TimeInterval { set get }
    var animationDelay: TimeInterval {set get }
    
    var shimmerGradientTint: UIColor { set get }
    var shimmerGradientHighlight: UIColor { set get }
    
    var gradientHighlightRatio: Double { set get }
    
    var gradientLayer: CAGradientLayer { get }
}

public enum ShimmerAnimationKeyPath: String {
    case lfShimmerViewLocations = "locations"
}

extension ShimmerEffect {
    
    public func addShimmerAnimation() {
        
        let startLocations = [NSNumber(value: -gradientHighlightRatio), NSNumber(value: -gradientHighlightRatio/2), 0.0]
        let endLocations = [1, NSNumber(value: 1+(gradientHighlightRatio/2)), NSNumber(value: 1+gradientHighlightRatio)]
        let gradientColors = [shimmerGradientTint.cgColor, shimmerGradientHighlight.cgColor, shimmerGradientTint.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: -gradientHighlightRatio, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1+gradientHighlightRatio, y: 0.5)
        gradientLayer.locations = startLocations
        gradientLayer.colors = gradientColors
        
        let shimmerAnimation = CABasicAnimation(keyPath: ShimmerAnimationKeyPath.lfShimmerViewLocations.rawValue)
        shimmerAnimation.fromValue = startLocations
        shimmerAnimation.toValue = endLocations
        shimmerAnimation.duration = animationDuration
        shimmerAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = animationDuration + animationDelay
        animationGroup.repeatCount = .infinity
        animationGroup.animations = [shimmerAnimation]
        
        gradientLayer.removeAnimation(forKey: ShimmerAnimationKeyPath.lfShimmerViewLocations.rawValue)
        gradientLayer.add(animationGroup, forKey: ShimmerAnimationKeyPath.lfShimmerViewLocations.rawValue)
    }
    
    public func removeShimmerAnimation() {
        gradientLayer.removeAnimation(forKey: ShimmerAnimationKeyPath.lfShimmerViewLocations.rawValue)
    }
    
}


