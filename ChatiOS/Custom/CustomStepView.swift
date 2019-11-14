//
//  CustomStepView.swift
//  ExplorerGoogle
//
//  Created by Weslley on 04/10/19.
//  Copyright © 2019 URPay. All rights reserved.
//
import UIKit

class StepComponents : UIView {

    func setData(title: String, img: UIImage, price: Int) {
           user.text = title
           imageUser.image = img
           priceLabel.text = "R$\(price)"
       }
    
    var backButton: UIButton = {
           
           let element = UIButton(frame: .zero)
          
           element.setImage(#imageLiteral(resourceName: "back"), for: .normal)
           element.layer.cornerRadius = 15
           element.translatesAutoresizingMaskIntoConstraints = false
           
           return element
       }()
    var cardzin : UIView = {
        
        let element = UIView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.1254901961, blue: 0.168627451, alpha: 1)
        
        element.layer.cornerRadius = 15.0
        element.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        element.layer.masksToBounds = true
        element.isHidden = true
        
        return element
    }()
    
    
    var user : UILabel = {
        let element = UILabel()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        
        
        guard let gothamBook = UIFont(name: "gotham-book", size: 15) else {
            fatalError("""
                Failed to load the "GothamBook" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
            """)
        }
        let title = "Fulano"
        let normalAttributteString = [.font: gothamBook, .foregroundColor: #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9647058824, alpha: 1) ] as [NSAttributedString.Key: Any]
        
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
        element.attributedText = attributedTitle
      
        element.isHidden = true
        return element
    }()
    
    var priceLabel : UILabel = {
        let element = UILabel()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        
        
        guard let gothamBook = UIFont(name: "gotham-book", size: 10) else {
            fatalError("""
                Failed to load the "GothamBook" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
            """)
        }
        let title = "R$"
        let normalAttributteString = [.font: gothamBook, .foregroundColor: #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9647058824, alpha: 1) ] as [NSAttributedString.Key: Any]
        
        
        let attributedTitle = NSMutableAttributedString(string: title, attributes: normalAttributteString)
        element.attributedText = attributedTitle
      
        element.isHidden = true
        return element
    }()
    
    var imageUser : UIImageView = {
         let element = UIImageView()
         element.contentMode = .scaleAspectFit
         element.translatesAutoresizingMaskIntoConstraints = false
         
         element.layer.borderWidth = 1.5
         element.layer.masksToBounds = false
         element.layer.borderColor = UIColor.white.cgColor
         element.layer.cornerRadius = 19
         element.clipsToBounds = true
         element.isHidden = true
         return element
     }()
     
    
    
    
    var seachButton: UIButton = {
        
        let element = UIButton(frame: .zero)
        element.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        element.setImage(#imageLiteral(resourceName: "lupa"), for: .normal)
        element.layer.cornerRadius = 15
        element.translatesAutoresizingMaskIntoConstraints = false
        
        return element
    }()

    var seachTextField : CustomTextField = {
        let element = CustomTextField()
        element.padding = UIEdgeInsets(top: 16, left: 75, bottom: 16, right: 50)
        element.backgroundColor = .clear
        guard let gotham = UIFont(name: "gotham", size: 16) else {
            fatalError("""
                Failed to load the "GothamBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
            """)
        }
       // element.alpha = 0.2
        element.layer.cornerRadius = 15
        element.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        element.attributedPlaceholder
            = NSAttributedString( string: "Pesquisar",
                                  attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) , NSAttributedString.Key.font: gotham] )
        
        
        element.font = gotham
//        element.elevate(elevation: 0)
        element.isHidden = true
        return element
        
    }()
    
   
    
    //View
    var stepView: UIView = {
        let component = UIView()
        component.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.3176470588, alpha: 1))
        component.translatesAutoresizingMaskIntoConstraints = false
        return component
    }()
    
    var stepCircleView1 : UIView = {
        let card = UIView()
//        card.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.clear
        card.layer.borderWidth = 1.5
        card.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        card.layer.cornerRadius = 5
        return card
    }()
    
    var stepCircleView2 : UIView = {
        let card = UIView()
//        card.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.clear
        card.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        card.layer.borderWidth = 1.5
        card.layer.cornerRadius = 5
        return card
    }()
    
    var stepCircleView3 : UIView = {
        let card = UIView()
    
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.clear
        card.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        card.layer.borderWidth = 1.5
        card.layer.cornerRadius = 5
        return card
    }()
    
    var stepCircleView4 : UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.clear
        card.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        card.layer.borderWidth = 1.5
        card.layer.cornerRadius = 5
        return card
    }()
    
    var stepCircleView5 : UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.clear
        card.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        card.layer.borderWidth = 1.5
        card.layer.cornerRadius = 5
        return card
    }()
    var stepCircleView6 : UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.clear
        card.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        card.layer.borderWidth = 1.5
        card.layer.cornerRadius = 5
        return card
    }()
    var stepCircleView7 : UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.clear
        card.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        card.layer.borderWidth = 1.5
        card.layer.cornerRadius = 5
        return card
    }()
    
    var stepCircleView8 : UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.clear
        card.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        card.layer.borderWidth = 1.5
        card.layer.cornerRadius = 5
        return card
    }()
    
    var stepCircleView9 : UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.clear
        card.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        card.layer.borderWidth = 1.5
        card.layer.cornerRadius = 5
        return card
    }()
    
    var stepCircleView10 : UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor.clear
        card.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        card.layer.borderWidth = 1.5
        card.layer.cornerRadius = 5
        return card
    }()

    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.spacing   = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var tabBarView : UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.3176470588, green: 0.2509803922, blue: 0.4941176471, alpha: 1))
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 15
        element.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner ]
        return element
    }()
    
  

}

extension UIButton {
    
//    func centerVertically(padding: CGFloat = 6.0) {
//        guard
//            let imageViewSize = self.imageView?.frame.size,
//            let titleLabelSize = self.titleLabel?.frame.size else {
//                return
//        }
//
//        let totalHeight = imageViewSize.height + titleLabelSize.height + padding
//
//        self.imageEdgeInsets = UIEdgeInsets(
//            top: -(totalHeight - imageViewSize.height),
//            left: 0.0,
//            bottom: 0.0,
//            right: -titleLabelSize.width
//        )
//
//        self.titleEdgeInsets = UIEdgeInsets(
//            top: 0.0,
//            left: -imageViewSize.width,
//            bottom: -(totalHeight - titleLabelSize.height),
//            right: 0.0
//        )
//
//        self.contentEdgeInsets = UIEdgeInsets(
//            top: 0.0,
//            left: 0.0,
//            bottom: titleLabelSize.height,
//            right: 0.0
//        )
//    }
    
        func centerImageAndButton(_ gap: CGFloat, imageOnTop: Bool) {
            
            guard let imageView = self.currentImage,
                let titleLabel = self.titleLabel?.text else { return }
            
            let sign: CGFloat = imageOnTop ? 1 : -1
            self.titleEdgeInsets = UIEdgeInsets(top: (imageView.size.height + gap) * sign, left: -imageView.size.width, bottom: 0, right: 0);
            
            let titleSize = titleLabel.size(withAttributes:[NSAttributedString.Key.font: self.titleLabel!.font!])
            self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + gap) * sign, left: 0, bottom: 0, right: -titleSize.width)
        }
    
    
}
