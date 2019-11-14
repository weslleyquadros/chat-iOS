//
//  CellForeignUser.swift
//  URPay-v2
//
//  Created by Beatriz Teles Castro on 24/09/19.
//  Copyright © 2019 URPay Brasil. All rights reserved.
//

import UIKit

class ForeignUserCell : UITableViewCell {
    
    var toBig = false

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

            responsiveCellLayout()
    }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    var messageCardView : UIView = {
        let component = UIView()
        
        
        component.backgroundColor = UIColor.blue
        component.translatesAutoresizingMaskIntoConstraints = false
        component.layer.cornerRadius = 12
        component.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,  .layerMaxXMaxYCorner]
        return component
    }()
    
//    var messageImageView : UIImageView = {
//        let element = UIImageView ()
//        element.translatesAutoresizingMaskIntoConstraints = false
//        element.image = UIImage(imageLiteralResourceName: "vectorExternalUser")
//        element.contentMode = .scaleAspectFit
//        return element
//    }()
    
    var messageLabel : UILabel = {
        let element = UILabel ()
        element.numberOfLines = -1
        guard let gotham = UIFont(name: "gotham", size: 14) else {
            fatalError("""
                Failed to load the "GothamBook" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
            """)
        }
        let title = "Sucosdfghjkjhgfdsadfghjk"
        
        let normalAttributteString = [.font: gotham, .foregroundColor: UIColor.black] as [NSAttributedString.Key: Any]
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.attributedText = attributedTitle
        element.textAlignment = .left
        return element
    }()
    var timeLabel : UILabel = {
            let element = UILabel ()
            element.numberOfLines = -1
            
            guard let gotham = UIFont(name: "gotham", size: 10) else {
                fatalError("""
                    Failed to load the "GothamBook" font.
                    Make sure the font file is included in the project and the font name is spelled correctly.
                """)
            }
            let title = "00:00"
            
            let normalAttributteString = [.font: gotham, .foregroundColor: UIColor.gray] as [NSAttributedString.Key: Any]
            
            let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
            
            element.attributedText = attributedTitle
    //        element.textAlignment = .left
            return element
        }()
    
    var triangleView : userExternalTriangleView = {
            let component = userExternalTriangleView()
            component.backgroundColor = UIColor.clear
            component.translatesAutoresizingMaskIntoConstraints = false
            return component
        }()
    
    
    func responsiveCellLayout() {
        addSubview(messageCardView)
        addSubview(messageLabel)
        
        addSubview(triangleView)
        
        addSubview(timeLabel)
        

        messageLabel.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, paddingTop: 15, paddingLeft: 25, paddingBottom: -30, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
        
        let constraints = [messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250)]
        
        messageCardView.anchor(top: messageLabel.topAnchor, left: messageLabel.leftAnchor, bottom: timeLabel.bottomAnchor, right: messageLabel.rightAnchor, paddingTop: -10, paddingLeft: -10, paddingBottom: 6, paddingRight: 18, width: 0, height: 0, trailling: nil, leading: nil)
        
        triangleView.anchor(top: nil, left: nil, bottom: messageCardView.bottomAnchor, right: messageCardView.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 15, height: 15, trailling: nil, leading: nil)
        
        timeLabel.anchor(top: messageLabel.bottomAnchor, left: messageLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 2, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
        
        NSLayoutConstraint.activate(constraints)
    }
   
}
