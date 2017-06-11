//
//  UIViewGradient.swift
//  RM53_iOS
//
//  Created by Ayu on 6/11/17.
//  Copyright © 2017 com.rm53. All rights reserved.
//

import UIKit
    
    @IBDesignable
    class UIViewGradient: UIView {
        
        @IBInspectable
        var firstColor:UIColor = UIColor.clear {
            didSet{
                updateColor()
            }
        }
        
        @IBInspectable
        var secondColor:UIColor = UIColor.clear {
            didSet{
                updateColor()
            }
        }
        
        @IBInspectable
        var thirdColor:UIColor = UIColor.clear {
            didSet{
                updateColor()
            }
        }
        
        @IBInspectable
        var shadowOffset:CGSize = CGSize.zero {
            didSet {
                self.layer.shadowOffset = shadowOffset
            }
        }
        
        @IBInspectable
        var isHorizontalGradient:Bool = false {
            didSet {
                updateColor()
            }
        }
        
        @IBInspectable
        var shadowOpacity:Float = 0.0 {
            didSet {
                self.layer.shadowOpacity = shadowOpacity
            }
        }
        
        override class var layerClass: AnyClass {
            get {
                return CAGradientLayer.self
            }
        }
        
        func updateColor(){
            let layer = self.layer as! CAGradientLayer
            if isHorizontalGradient {
                layer.startPoint = CGPoint(x: 0, y: 0)
                layer.endPoint = CGPoint(x: self.frame.width, y: self.frame.height)
            }
            layer.colors = [firstColor.cgColor, secondColor.cgColor,thirdColor.cgColor]
        }

}
