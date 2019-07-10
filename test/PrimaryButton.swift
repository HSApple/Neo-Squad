//
//  PrimaryButton.swift
//  test
//
//  Created by student on 7/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class PrimaryButton: UIButton {
    
    override func layoutSubviews() {
    super.layoutSubviews()
        
        let borderGradientTop = UIColor(hue:0.53, saturation:0.59, brightness:0.90, alpha:1.00).cgColor
        let borderGradientBottom = UIColor(hue:0.45, saturation:0.82, brightness:0.88, alpha:1.00).cgColor
        let borderGradient = CAGradientLayer()
        borderGradient.frame = self.bounds
        borderGradient.colors = [borderGradientTop, borderGradientBottom]
        borderGradient.cornerRadius = 4
        
        let borderMask = CAShapeLayer()
        borderMask.lineWidth = 1
        borderMask.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
        borderMask.fillColor = UIColor.clear.cgColor
        borderMask.strokeColor = UIColor.black.cgColor
        
        borderGradient.mask = borderMask
        self.layer.insertSublayer(borderGradient, below: self.titleLabel?.layer)
        
        // Background:
        let backgroundGradientTop = UIColor(hue:0.53, saturation:0.58, brightness:0.9, alpha:1.00).cgColor
        let backgroundGradientBottom = UIColor(hue:0.45, saturation:0.80, brightness:0.88, alpha:1.00).cgColor
        let background = CAGradientLayer()
        background.frame = self.bounds
        background.colors = [backgroundGradientTop, backgroundGradientBottom]
        background.cornerRadius = 10
        self.layer.insertSublayer(background, below: borderGradient)
        
        // Shadow:
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
        
        // Text
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitle(self.titleLabel?.text?.uppercased(), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
    
}
}
