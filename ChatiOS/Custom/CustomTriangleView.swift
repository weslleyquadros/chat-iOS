//
//  CustomTriangleView.swift
//  URPay-v2
//
//  Created by Beatriz Teles Castro on 04/10/19.
//  Copyright © 2019 URPay Brasil. All rights reserved.
//

import Foundation
import UIKit

class TriangleView : UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        context.addLine(to: CGPoint(x: rect.minX, y: rect.minY ))
        context.addLine(to: CGPoint(x: (rect.maxX / 5), y: rect.maxY ))
        context.closePath()

//        context.setFillColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.60)
        context.setFillColor(UIColor.purple.cgColor)
        context.fillPath()
    }
}

class userExternalTriangleView : UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
       context.addLine(to: CGPoint(x: rect.maxX , y: rect.maxY))
       context.addLine(to: CGPoint(x: rect.maxX, y: rect.minY ))
        
//        context.addLine(to: CGPoint(x: rect.maxX - 2, y: rect.maxY - 2))
//        context.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.minY + 2))
        
        context.closePath()

        context.setFillColor(UIColor.blue.cgColor)
        context.fillPath()
    }
}
