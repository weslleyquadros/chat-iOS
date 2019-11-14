//
//  ChatScreen.swift
//  chat-iOS
//
//  Created by WeslleyQ on 11/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import UIKit

final class ChatScreen : UIView {
    
    
    private var initialConstraints = [NSLayoutConstraint]()
    private let components: ChatComponents!
   
  
    var iphoneX = false
    
    var cardSize = 0
    
    init(components: ChatComponents, frame : CGRect) {
    
        self.components = components
        super.init(frame: frame)
        
        setupView()
        setupConstraints()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        components.bgGradientLayer.frame = (bounds)
        layer.addSublayer(components.bgGradientLayer)
        
        
        addSubview(components.baseView)
        
        addSubview(components.titleLabel)
        
        components.baseView.addSubview(components.tableConversationsView)
        
        components.baseView.addSubview(components.mensageEmptyLabel)

        
        addSubview(components.seachTextField)
        components.seachTextField.setIconSearchLeft()
//
//        if UIDevice().userInterfaceIdiom == .phone {
//            switch UIScreen.main.nativeBounds.height {
//            case 1136:
//                cardSize = 30
//            case 1334:
//                cardSize = 50
//            case 1920, 2208:
//                cardSize = 60
//            case 2436:
//              //  addSubview(components.buttonView)
////                iphoneX = true
////                cardSize = 30
//            case 2688:
//               // addSubview(components.buttonView)
////                iphoneX = true
////                cardSize = 30
//            case 1792:
//              //  addSubview(components.buttonView)
////                iphoneX = true
////                cardSize = 30
//            default:
//                print("Unknown")
//            }
//        }
//        print("CardSize: ",  cardSize)
        
        
    }
    
    private func setupConstraints() {
        
        components.baseView.anchor(top: nil, left: leftAnchor, bottom: self.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: percentOfHeight(percente: 75), trailling: nil, leading: nil)
        
        
        components.titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: percentOfHeight(percente: 2), paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
        
        initialConstraints.append(components.titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor))
        
   
        components.seachTextField.anchor(top: components.baseView.topAnchor, left: components.baseView.leftAnchor, bottom: nil, right: components.baseView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 55, trailling: nil, leading: nil)
        
         components.mensageEmptyLabel.anchor(top: components.baseView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: percentOfHeight(percente: 10), paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
        
        initialConstraints.append(components.mensageEmptyLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor))
        
        
        
        components.tableConversationsView.anchor(top: components.seachTextField.bottomAnchor, left:  components.baseView.leftAnchor, bottom: components.baseView.bottomAnchor, right: components.baseView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
              
        
        
  
        
         NSLayoutConstraint.activate(initialConstraints)
    }
    
}
