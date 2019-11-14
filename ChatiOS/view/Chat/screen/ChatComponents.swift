//
//  ChatComponents.swift
//  chat-iOS
//
//  Created by WeslleyQ on 11/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import UIKit

class ChatComponents {
    
     var bgGradientLayer : CAGradientLayer = {
              let bg = CAGradientLayer()
              bg.backgroundColor = #colorLiteral(red: 0.7417137027, green: 0.4405708313, blue: 1, alpha: 1)
              bg.colors = [  #colorLiteral(red: 0.01175031811, green: 0.3921851218, blue: 0.7913323045, alpha: 1).cgColor, #colorLiteral(red: 0.01175031811, green: 0.3921851218, blue: 0.7913323045, alpha: 0.5).cgColor, #colorLiteral(red: 0.01175031811, green: 0.3921851218, blue: 0.7913323045, alpha: 0.1045609595).cgColor]
              bg.startPoint = CGPoint.init(x: 0.5, y: 0)
              bg.endPoint = CGPoint.init(x: 0.5, y: 1)
              return bg
     }()
          

     
    var baseView : UIView = {
         
         let element = UIView()
         
         element.translatesAutoresizingMaskIntoConstraints = false
         element.backgroundColor = .white
         
         element.layer.cornerRadius = 15.0
         element.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
         element.layer.masksToBounds = true

//        element.alpha = 0.7
         
         return element
     }()

    var titleLabel: UILabel = {
        let element = UILabel()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        
      guard let gothamBook = UIFont(name: "gotham-book", size: 30) else {
                 fatalError("""
                     Failed to load the "GothamBook" font.
                     Make sure the font file is included in the project and the font name is spelled correctly.
                 """)
             }
        
        
        let title = "Chat"
        let normalAttributteString = [.font: gothamBook , .foregroundColor: UIColor.white ] as [NSAttributedString.Key: Any]
        
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
        element.attributedText = attributedTitle
        
        return element
    }()
    
    var tableConversationsView : UITableView = {
         let element = UITableView()
         element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .white
//         element.alpha = 0.3
         element.separatorStyle = .none
         
         return element
     }()
    

    var mensageEmptyLabel: UILabel = {
        let component = UILabel()
        component.translatesAutoresizingMaskIntoConstraints = false
        component.numberOfLines = -1
        
        guard let gothamBook = UIFont(name: "gotham-book", size: 22) else {
                    fatalError("""
                        Failed to load the "GothamBook" font.
                        Make sure the font file is included in the project and the font name is spelled correctly.
                    """)
                }
        
        
        let titleLabelOne = NSLocalizedString("title_emptyChatPart1", comment: "")
        let titleLabelTwo = NSLocalizedString("title_emptyChatPart2", comment: "")
        let titleLabelThree = "\(titleLabelOne)\(titleLabelTwo)" + NSLocalizedString("title_emptyChatPart3", comment: "")
        
        
        
        let normalAttributteString = [.font: gothamBook, .foregroundColor: UIColor.white ] as [NSAttributedString.Key: Any]
        let specialAttributteString = [.font: gothamBook, .foregroundColor:  UIColor.white ] as [NSAttributedString.Key: Any]
        
        let attributedTitle = NSMutableAttributedString(string: titleLabelThree, attributes: normalAttributteString)
        
        
        attributedTitle.setAttributes(specialAttributteString, range: NSRange(location: titleLabelOne.count, length: titleLabelTwo.count ))
        component.attributedText = attributedTitle
        
        component.textAlignment = .center
        
        return component
    }()


     var seachTextField : CustomTextField = {
           let element = CustomTextField()
           element.padding = UIEdgeInsets(top: 16, left: 75, bottom: 16, right: 50)
           element.backgroundColor = .white

          // element.alpha = 0.2
           element.layer.cornerRadius = 15
           element.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
           
        
           guard let gothamBook = UIFont(name: "gotham-book", size: 16) else {
                       fatalError("""
                           Failed to load the "GothamBook" font.
                           Make sure the font file is included in the project and the font name is spelled correctly.
                       """)
                   }
           
           element.attributedPlaceholder
               = NSAttributedString( string: "Pesquisar",
                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray , NSAttributedString.Key.font: gothamBook] )
           
        
            element.alpha = 0.5
           
           return element
           
       }()
       
}
