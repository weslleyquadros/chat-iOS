//
//  ListChat.swift
//  chat-iOS
//
//  Created by WeslleyQ on 11/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//


import UIKit


struct ChatClass {
    var image : UIImage
    var name : String
    var message : String
    var date : String
    var qtd : String
    var active : Bool
    var itsBlocked : Bool
    
    
   
//    var statusBool : Bool
}


class ListChat : UITableViewCell {
    
    var conversation : ChatClass? {
        didSet {
            imageContact.image = conversation?.image
            nameContact.text = conversation?.name
            messageLabel.text = conversation?.message
            dateLabel.text = conversation?.date
            qtdLabel.text = conversation?.qtd
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
    
      
        contentView.addSubview(imageContact)
        contentView.addSubview(nameContact)
        contentView.addSubview(messageLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(circle)
        circle.addSubview(qtdLabel)
        contentView.addSubview(imageActive)

       
      
        imageContact.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft:  percentOfWidth(percente: 8), paddingBottom: 0, paddingRight: 0, width: 40, height: 40, trailling: nil, leading: nil)
        
        imageContact.centerY(inView: self)
        
        nameContact.anchor(top: self.topAnchor, left: imageContact.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: percentOfWidth(percente: 5), paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
        
        
        messageLabel.anchor(top: nameContact.bottomAnchor, left: imageContact.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: percentOfWidth(percente: 5), paddingBottom: 0, paddingRight: -70, width: 0, height: 0, trailling: nil, leading: nil)
        
        dateLabel.anchor(top: self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: -30, width: 0, height: 0, trailling: nil, leading: nil)
        circle.anchor(top: dateLabel.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: -30, width: 0, height: 0, trailling: nil, leading: nil)
        
        imageActive.anchor(top: imageContact.bottomAnchor, left: nil, bottom: nil, right: imageContact.rightAnchor, paddingTop: -10, paddingLeft:  0, paddingBottom: 0, paddingRight: -2, width: 9, height: 9, trailling: nil, leading: nil)
        
        qtdLabel.centerY(inView: circle)
        qtdLabel.centerX(inView: circle)
    
       
    
    }
    
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
   
    
    var imageContact : UIImageView = {
        let element = UIImageView ()
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
    
    var imageActive : UIImageView = {
        let element = UIImageView ()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image =   #imageLiteral(resourceName: "trash")

              
        return element
    }()
    
    var nameContact: UILabel = {
        let component = UILabel()
        component.translatesAutoresizingMaskIntoConstraints = false
        component.numberOfLines = -1
        
        
        guard let gothamMedium = UIFont(name: "gotham-medium", size: 14) else {
            fatalError("""
                Failed to load the "GothamBook" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
            """)
        }
        let title = "João"
        
        let normalAttributteString = [.font: gothamMedium, .foregroundColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)] as [NSAttributedString.Key: Any]
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
        
        component.attributedText = attributedTitle
        component.textAlignment = .center
        
        return component
    }()
    
    var messageLabel: UILabel = {
        let component = UILabel()
        component.translatesAutoresizingMaskIntoConstraints = false
        component.numberOfLines = 2
        
        guard let gothamMedium = UIFont(name: "gotham-medium", size: 14) else {
                   fatalError("""
                       Failed to load the "GothamBook" font.
                       Make sure the font file is included in the project and the font name is spelled correctly.
                   """)
               }
  
        let title = "Essa é uma mensagem de fulano de tal para mim"
        
        let normalAttributteString = [.font: gothamMedium, .foregroundColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)] as [NSAttributedString.Key: Any]
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
        
        component.attributedText = attributedTitle
//        component.textAlignment = .center
        
        return component
    }()
    
    var dateLabel: UILabel = {
         let component = UILabel()
         component.translatesAutoresizingMaskIntoConstraints = false
         component.numberOfLines = -1
         
    guard let gothamMedium = UIFont(name: "gotham-medium", size: 11) else {
                      fatalError("""
                          Failed to load the "GothamBook" font.
                          Make sure the font file is included in the project and the font name is spelled correctly.
                      """)
                  }
        
         let title = "18:30"
         
        let normalAttributteString = [.font: gothamMedium, .foregroundColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)] as [NSAttributedString.Key: Any]
         
         let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
         
         component.attributedText = attributedTitle
         component.textAlignment = .center
         
         return component
     }()
    
    var circle : UIView = {
        
        let element = UIView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = UIColor.blue
        element.layer.borderColor = UIColor.blue.cgColor
        element.layer.borderWidth = 1.5
        element.layer.cornerRadius = 10
        element.clipsToBounds = true
//        element.widthAnchor.constraint(equalToConstant: 20).isActive = true
        element.heightAnchor.constraint(equalToConstant: 20).isActive = true
       // element.percentOfWidth(percente: 20)
        
        return element
    }()
    
   var qtdLabel: UILabel = {
          let component = UILabel()
          component.translatesAutoresizingMaskIntoConstraints = false
          component.numberOfLines = -1
          
    guard let gothamMedium = UIFont(name: "gotham-medium", size: 11) else {
                      fatalError("""
                          Failed to load the "GothamBook" font.
                          Make sure the font file is included in the project and the font name is spelled correctly.
                      """)
                  }
  
          let title = ""
          
    let normalAttributteString = [.font: gothamMedium, .foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)] as [NSAttributedString.Key: Any]
          
          let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
          
          component.attributedText = attributedTitle
          component.textAlignment = .center
          
          return component
      }()
}




