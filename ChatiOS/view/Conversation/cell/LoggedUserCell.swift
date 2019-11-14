//
//  CellLoggedUser.swift
//  URPay-v2
//
//  Created by Beatriz Teles Castro on 24/09/19.
//  Copyright © 2019 URPay Brasil. All rights reserved.
//

import UIKit

class LoggedUserCell : UITableViewCell {
    
    var message : String?

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        layoutCell()
            responsiveCellLayout()
    }
    
    required init(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    var messageCardView : UIView = {
        let component = UIView()
        component.backgroundColor = UIColor.purple
        component.translatesAutoresizingMaskIntoConstraints = false
        component.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,  .layerMinXMaxYCorner]
        component.layer.cornerRadius = 12
        return component
    }()
    
    var triangleView : TriangleView = {
        let component = TriangleView()
        component.backgroundColor = UIColor.clear
        component.translatesAutoresizingMaskIntoConstraints = false
//        component.transform =  CGAffineTransform(rotationAngle: (CGFloat.pi)/2)
//        component.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,  .layerMinXMaxYCorner]
//        component.layer.cornerRadius = 12
        return component
    }()
    
//    var messageImageView : UIImageView = {
//        let element = UIImageView ()
//        element.translatesAutoresizingMaskIntoConstraints = false
//        element.image = UIImage(imageLiteralResourceName: "vectorUser")
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
        let title = "00:00"
        
        let normalAttributteString = [.font: gotham, .foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)] as [NSAttributedString.Key: Any]
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
        
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
        
        let normalAttributteString = [.font: gotham, .foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)] as [NSAttributedString.Key: Any]
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
        
        element.attributedText = attributedTitle
//        element.textAlignment = .left
        return element
    }()

    
    
    func responsiveCellLayout() {
        
        addSubview(messageCardView)
        addSubview(messageLabel)
        
        addSubview(triangleView)
        
        addSubview(timeLabel)
        
        messageLabel.anchor(top: self.topAnchor, left: nil, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: -30, paddingRight: -25, width: 0, height: 0, trailling: nil, leading: nil)
        
        let constraints = [messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250)]
        
        messageCardView.anchor(top: messageLabel.topAnchor, left: messageLabel.leftAnchor, bottom: timeLabel.bottomAnchor, right: messageLabel.rightAnchor, paddingTop: -10, paddingLeft: -18, paddingBottom: 6, paddingRight: 10, width: 0, height: 0, trailling: nil, leading: nil)
        
        triangleView.anchor(top: nil, left: messageCardView.rightAnchor, bottom: messageCardView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 15, trailling: nil, leading: nil)
        
        timeLabel.anchor(top: messageLabel.bottomAnchor, left: messageLabel.leftAnchor, bottom: nil, right: messageLabel.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, trailling: nil, leading: nil)
        
        
        NSLayoutConstraint.activate(constraints)
    }
}
