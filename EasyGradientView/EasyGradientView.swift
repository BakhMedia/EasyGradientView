//
//  EasyGradientView.swift
//  EasyGradientView
//
//  Created by Ilya Aleshin on 05/11/2018.
//  Copyright © 2018 iAleshin. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    @IBInspectable var firstColor: UIColor = UIColor.red
    @IBInspectable var secondColor: UIColor = UIColor.green
    @IBInspectable var vertical: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyGradient()
    }
    
    @objc func applyGradient() {
        let colors = [firstColor.cgColor, secondColor.cgColor]
        let layer = CAGradientLayer()
        layer.colors = colors
        layer.zPosition = -100
        var bounds : CGRect = self.bounds
        bounds.size.width = bounds.size.width + bounds.size.width * 4
        layer.frame = bounds
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = vertical ? CGPoint(x: 0, y: 1) : CGPoint(x: 1, y: 0)
        self.layer.addSublayer(layer)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        #if TARGET_INTERFACE_BUILDER
        applyGradient()
        #endif
    }

}
