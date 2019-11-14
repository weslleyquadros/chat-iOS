//
//  ConversationsScreen.swift
//  URPay-v2
//
//  Created by Beatriz Teles Castro on 23/09/19.
//  Copyright © 2019 URPay Brasil. All rights reserved.
//

import Foundation
import UIKit

final class ConversationScreen : UIView {


    private var initialConstraints = [NSLayoutConstraint]()
    private let components: ConversationComponents
    private let stepComponents: StepComponents
    var iphoneX = false

    init(stepComponents: StepComponents , components: ConversationComponents, frame: CGRect ){
        self.stepComponents = stepComponents
        self.components = components
        super.init(frame: frame)
        
        setupView()
        setupConstraint()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    private func setupView(){

        //Background
        components.bgGradientLayer.frame = (bounds)
        layer.addSublayer(components.bgGradientLayer)
               
        components.bgLayer.frame = (bounds)
         layer.addSublayer(components.bgLayer)
        
        
        //Top Elements
        addSubview(stepComponents.backButton)
        addSubview(components.titleLabel)
        
        
        //Cards View
        addSubview(components.cardConversationView)
        components.cardConversationView.addSubview(components.cardUserInfoView)
        
        
        //UserInfo
        components.cardUserInfoView.addSubview(components.photoUserImage)
        components.cardUserInfoView.addSubview(components.userNameLabel)
        
        components.cardUserInfoView.addSubview(components.statusUserView)
        components.cardUserInfoView.addSubview(components.statusUserLabel)
        
        
        
        //Conversation
        
        components.cardConversationView.addSubview(components.tableChatView)
        
        //Message
        components.cardConversationView.addSubview(components.messageTextView)
        components.cardGradientLayer.frame =  CGRect(x: 0, y: 0, width: percentOfWidth(percente: 100), height: percentOfHeight(percente: 10))
        components.messageTextView.layer.addSublayer(components.cardGradientLayer)
        
        components.messageTextView.addSubview(components.messageTextFiel)
        components.messageTextView.addSubview(components.sendMessageButton)
        
        
        //Block
        addSubview(components.blockView)
        
        components.blockGradientLayer.frame =  CGRect(x: 0, y: 0, width: percentOfWidth(percente: 100), height: percentOfHeight(percente: 100))
        components.blockView.layer.addSublayer(components.blockGradientLayer)
        
        
        addSubview(components.userBlockLabel)
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
//                print("iPhone 5 or 5S or 5C")
                break
            case 1334:
//                print("iPhone 6/6S/7/8")
                break
            case 1920, 2208:
//                print("iPhone 6+/6S+/7+/8+")
                break
            case 2436:
//                print("iPhone X, XS")
                addSubview(components.bottomView)
                iphoneX = true
                
            case 2688:
//                print("iPhone XS Max")
                addSubview(components.bottomView)
                iphoneX = true
                
            case 1792:
//                print("iPhone XR")
                addSubview(components.bottomView)
                iphoneX = true
                
            default:
//                print("Unknown")
                break
            }
        }
    }
    
    private func setupConstraint(){
        
        if iphoneX {
            components.bottomView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: percentOfHeight(percente: 8), trailling: nil, leading: nil)
            
           components.cardConversationView.anchor(top: stepComponents.backButton.bottomAnchor, left: leftAnchor, bottom: components.bottomView.topAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
            
            components.cardUserInfoView.anchor(top: components.cardConversationView.topAnchor, left: components.cardConversationView.leftAnchor, bottom: nil, right: components.cardConversationView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: percentOfHeight(percente: 8.5), trailling: nil, leading: nil)
            
            
            components.statusUserLabel.anchor(top: components.userNameLabel.bottomAnchor, left: components.statusUserView.rightAnchor, bottom: nil, right: nil, paddingTop: 1, paddingLeft: 2, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
            
            
        }
        else {
            // Configuração de Responsividade
            components.cardConversationView.anchor(top: stepComponents.backButton.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
            
            components.cardUserInfoView.anchor(top: components.cardConversationView.topAnchor, left: components.cardConversationView.leftAnchor, bottom: nil, right: components.cardConversationView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: percentOfHeight(percente: 10), trailling: nil, leading: nil)
            
            
            components.statusUserLabel.anchor(top: components.userNameLabel.bottomAnchor, left: components.statusUserView.rightAnchor, bottom: nil, right: nil, paddingTop: 2, paddingLeft: 4, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
        }
        
        components.titleLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: percentOfHeight(percente: 6), paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
        
        components.titleLabel.centerX(inView: self)
        
        stepComponents.backButton.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: percentOfHeight(percente: 6), paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
        
        components.photoUserImage.anchor(top: nil, left: components.cardUserInfoView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 40, height: 40, trailling: nil, leading: nil)
        
        components.photoUserImage.centerY(inView: components.cardUserInfoView)
        
        
        components.userNameLabel.anchor(top: components.cardUserInfoView.topAnchor, left: components.photoUserImage.rightAnchor, bottom: nil, right: components.cardUserInfoView.rightAnchor, paddingTop: percentOfHeight(percente: 2), paddingLeft: 10, paddingBottom: 0, paddingRight: 2, width: 0, height: 0, trailling: nil, leading: nil)
        
        components.statusUserView.anchor(top: nil, left: components.photoUserImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 10, height: 10, trailling: nil, leading: nil)
       
        
        components.statusUserView.centerYAnchor.constraint(equalTo: components.statusUserLabel.centerYAnchor, constant: 1).isActive = true
        
         components.messageTextView.anchor(top: nil, left: components.cardConversationView.leftAnchor, bottom: components.cardConversationView.bottomAnchor, right: components.cardConversationView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: percentOfHeight(percente: 10), trailling: nil, leading: nil)
        
        components.messageTextFiel.anchor(top: nil, left: components.messageTextView.leftAnchor, bottom: nil, right: components.sendMessageButton.leftAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: -5, width: 0, height: percentOfHeight(percente: 6), trailling: nil, leading: nil)
        
        components.messageTextFiel.centerY(inView: components.messageTextView)
        
        components.sendMessageButton.anchor(top: nil, left: nil, bottom: nil, right: components.messageTextView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: -5, width: 36, height: 36, trailling: nil, leading: nil)
        
        components.sendMessageButton.centerY(inView: components.messageTextView)
        
        
        components.tableChatView.anchor(top: components.cardUserInfoView.bottomAnchor, left: components.cardConversationView.leftAnchor, bottom: bottomAnchor, right: components.cardConversationView.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: -15, width: 0, height: 0, trailling: nil, leading: nil)
        

        components.blockView.anchor(top: components.cardUserInfoView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
        
        components.userBlockLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: -20, paddingRight: -5, width: 0, height: 0, trailling: nil, leading: nil)
    }

}
