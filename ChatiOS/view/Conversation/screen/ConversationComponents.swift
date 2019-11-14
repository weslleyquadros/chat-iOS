//
//  Conversations.swift
//  URPay-v2
//
//  Created by Beatriz Teles Castro on 23/09/19.
//  Copyright © 2019 URPay Brasil. All rights reserved.
//

import UIKit

class ConversationComponents {
    
    //Background
    
      var bgGradientLayer : CAGradientLayer = {
               let bg = CAGradientLayer()
               bg.backgroundColor = #colorLiteral(red: 0.7417137027, green: 0.4405708313, blue: 1, alpha: 1)
               bg.colors = [  #colorLiteral(red: 0.01175031811, green: 0.3921851218, blue: 0.7913323045, alpha: 1).cgColor, #colorLiteral(red: 0.01175031811, green: 0.3921851218, blue: 0.7913323045, alpha: 0.5).cgColor, #colorLiteral(red: 0.01175031811, green: 0.3921851218, blue: 0.7913323045, alpha: 0.1045609595).cgColor]
               bg.startPoint = CGPoint.init(x: 0.5, y: 0)
               bg.endPoint = CGPoint.init(x: 0.5, y: 1)
               return bg
      }()
           
    
    var bgLayer : CALayer = {
        let element = CALayer()
        element.contentsGravity = CALayerContentsGravity.resizeAspectFill
        element.contents = UIImage(named: "sobeGirl")?.cgImage
        element.compositingFilter = "multiplyBlendMode"
           
        return element
    }()
    
    //Top Elements
    
    var titleLabel : UILabel = {
        
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.numberOfLines = -1
        
        
        
        guard let gothamBook = UIFont(name: "gotham-book", size: 22) else {
            fatalError("""
                Failed to load the "GothamBook" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
            """)
        }
        
        
        let title = NSLocalizedString("Conversas", comment: "")
        
        
        let normalAttributteString = [.font: gothamBook, .foregroundColor:  UIColor.white ] as [NSAttributedString.Key: Any]
        
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
        
        element.attributedText = attributedTitle
        
        
        return element
        
    }()
    
    
    //Cards View
     var cardConversationView : UIView = {
            let card = UIView()
            card.translatesAutoresizingMaskIntoConstraints = false
            card.backgroundColor = UIColor.white
            card.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            card.layer.cornerRadius = 20.0
            return card
        }()
    
     var cardUserInfoView : UIView = {
            let card = UIView()
            card.translatesAutoresizingMaskIntoConstraints = false
            card.backgroundColor = UIColor.white
            card.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            card.layer.cornerRadius = 20.0
            return card
        }()
    
    var bottomView: UIView = {
        let component = UIView()
        component.backgroundColor = UIColor.white
        component.translatesAutoresizingMaskIntoConstraints = false
        return component
    }()
    
    var photoView: UIView = {
        let component = UIView()
        component.backgroundColor = UIColor.gray
        component.translatesAutoresizingMaskIntoConstraints = false
        component.layer.cornerRadius = 25

        return component
    }()
    
    //User Info
    
    var photoUserImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = UIColor.gray
        element.image = #imageLiteral(resourceName: "woman")
        element.contentMode = .scaleAspectFit
             
        element.layer.cornerRadius = element.frame.height / 2
        element.layer.masksToBounds = false
        element.layer.cornerRadius = 20
        element.clipsToBounds = true
        
        return element
    }()
    
    var userNameLabel : UILabel = {
        
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.numberOfLines = -1
        
        
        
        guard let gothamBook = UIFont(name: "gotham-book", size: 18) else {
            fatalError("""
                Failed to load the "GothamBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
            """)
        }
        
        
        let title = ""
        
        
        let normalAttributeString = [.font:  gothamBook,
                                     .foregroundColor: UIColor.gray ] as [NSAttributedString.Key : Any]
        
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributeString)
        
        element.attributedText = attributedTitle
        
        
        return element
        
    }()
    
    var statusUserView: UIView = {
        let component = UIView()
        component.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1))
        component.layer.borderWidth = 1
        component.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        component.translatesAutoresizingMaskIntoConstraints = false
        component.layer.cornerRadius = 5
        return component
    }()
    
    var statusUserLabel : UILabel = {
        
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.numberOfLines = -1
        
        
        
        guard let gotham = UIFont(name: "gotham", size: 14) else {
            fatalError("""
                Failed to load the "GothamBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
            """)
        }
        
        
        let title = "online"
        
        
        let normalAttributeString = [.font:  gotham,
                                     .foregroundColor: #colorLiteral(red: 0.1529411765, green: 0.6823529412, blue: 0.3764705882, alpha: 1) ] as [NSAttributedString.Key : Any]
        
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributeString)
        
        element.attributedText = attributedTitle
        
        
        return element
        
    }()
    
    var messageTextFiel : CustomTextField = {
        let element = CustomTextField()
        element.translatesAutoresizingMaskIntoConstraints = false

        element.padding = UIEdgeInsets(top: 13, left: 16, bottom: 13, right: 10)

        guard let gotham = UIFont(name: "gotham", size: 14) else {
        fatalError("""
            Failed to load the "gotham_medium" font.
            Make sure the font file is included in the project and the font name is spelled correctly.
        """)        }

        element.attributedPlaceholder = NSAttributedString (string: NSLocalizedString("Digite sua mensagem", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: gotham] )

        element.backgroundColor = UIColor.white
        element.font = gotham

//        element.elevate(elevation: 0)

        element.layer.cornerRadius = 18
        element.tintColor = UIColor.blue
        

        return element
    }()

    
    
    var sendMessageButton : UIButton = {
        let element = UIButton()
        element.setImage(#imageLiteral(resourceName: "send"), for: .normal)
        element.contentMode = .center
        element.backgroundColor = UIColor.blue
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 18
        return element
    }()
    
    
    var messageTextView: UIView = {
        let component = UIView()
        component.backgroundColor = UIColor.white
//        component.alpha = 0.2
        component.translatesAutoresizingMaskIntoConstraints = false
//        component.clipsToBounds = false
        component.layer.masksToBounds = true
        
        return component
    }()
    
    var cardGradientLayer : CAGradientLayer = {
        let bg = CAGradientLayer()
       // bg.colors = [ #colorLiteral(red: 0.8196078431, green: 0.8196078431, blue: 0.862745098, alpha: 0.7114993579).cgColor , #colorLiteral(red: 0.8196078431, green: 0.8196078431, blue: 0.862745098, alpha: 1).cgColor ]
        bg.shouldRasterize = false
        return bg
    }()
    
    //Conversation
    
    var tableChatView : UITableView = {
        let element = UITableView(frame: .zero, style: .grouped)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = UIColor.white
        element.separatorStyle = .none
//        element.keyboardDismissMode = .onDrag
        element.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 75, right: 0)
//        element.indicatorStyle = .white
        element.contentInsetAdjustmentBehavior = .never
        element.allowsSelection = false
        return element
    }()
    
    
    var blockView: UIView = {
            let component = UIView()
            component.backgroundColor = UIColor.clear
            component.translatesAutoresizingMaskIntoConstraints = false
            component.layer.masksToBounds = true
            
            return component
    }()
    
    var blockGradientLayer : CAGradientLayer = {
        let bg = CAGradientLayer()
        bg.colors = [ #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.04628638699).cgColor,  #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor  ]
        return bg
    }()
    
    var userBlockLabel : UILabel = {
        
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.numberOfLines = -1
        
        
        
        guard let gotham = UIFont(name: "gotham", size: 16) else {
            fatalError("""
                Failed to load the "GothamBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
            """)
        }
        
        
        let title = NSLocalizedString("text_userBlock", comment: "")
        
        
        let normalAttributeString = [.font:  gotham,
                                     .foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ] as [NSAttributedString.Key : Any]
        
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributeString)
        
        element.attributedText = attributedTitle
        
        element.textAlignment = .center
        return element
        
    }()
    
}
