//
//  ConversationDetailsViewController.swift
//  URPay-v2
//
//  Created by Beatriz Teles Castro on 23/09/19.
//  Copyright © 2019 URPay Brasil. All rights reserved.
//

import UIKit


struct ChatDetails {
    var message : String
    var date : Date
    var userLogged : Bool
}

class ConversationViewController: UIViewController, UITableViewDataSource, CAAnimationDelegate {
    
    
    private var components : ConversationComponents!
    private var contentScreen : ConversationScreen!
    private var stepComponents : StepComponents!
    
    var iphoneX = false
    var iphone5s = false
    var iphoneB = false
    var keyboardHeightCalled : CGFloat = 0
    
    var userIsBlock : Bool!
    
    var nameContact : String!
    var imageContact : UIImage!
    
    var conversation : [[ChatDetails]] =
        [ [ChatDetails(message: "Boa tarde\nOs nomes dos dias da semana em Inglês surgiram com base no nome de deuses da mitologia. Veja cada um dos dias da semana, e seus respectivos significados.", date: Date().dateFromConversation(dateFromMessage: "2019-09-23 16:49"), userLogged: false),
           ChatDetails(message: "Boa tarde!\nAt the last possible moment or opportunity. No último momento ou oportunidade possível.", date: Date().dateFromConversation(dateFromMessage:"2019-09-23 16:50"), userLogged: true),
           ChatDetails(message: "Esta expressão vem da Bíblia, onde Jesus a usa na história dos trabalhadores na vinha (Mateus 20:1-16). No tempo de Jesus, as horas eram contadas do amanhecer ao anoitecer, com a décima segunda hora trazendo escuridão,desse modo, a décima primeira hora era a última hora antes do anoitecer.", date: Date().dateFromConversation(dateFromMessage:"2019-09-23 19:50"), userLogged: false)],
          [ChatDetails(message: "Saquei.", date: Date().dateFromConversation(dateFromMessage:"2019-09-25 06:34"), userLogged: true),
           ChatDetails(message: "O django-cookiecutter é uma excelente opção para criar um esqueletão para quem vai usar o maravilindo Postgres", date: Date().dateFromConversation(dateFromMessage:"2019-09-25 07:55"), userLogged: false),
           ChatDetails(message: "Olá pessoal! No meu primeiro site experimental tenho um formulário onde o usuário pode postar arquivos PDF com um campo para o título. Acontece que  nos títulos que possuem caracteres com acento(ç,ã,á,à) o próximo caractere fica em maiúsculo(ex : MatemáTica) na view !!! Alguém pode dar uma dica como resolve???", date: Date().dateFromConversation(dateFromMessage:"2019-09-25 08:02"), userLogged: true)],
          [ChatDetails(message: "O Django já não tem o seu próprio ORM?", date: Date().dateFromConversation(dateFromMessage:"2019-09-26 14:10"), userLogged: true),
           ChatDetails(message: "Que código você fez para isso acontecer?", date: Date().dateFromConversation(dateFromMessage:"2019-09-26 15:27"), userLogged: true)],
          [ChatDetails(message: "Está messagem é de ontem?", date: Date().dateFromConversation(dateFromMessage:"2019-09-29 20:10"), userLogged: false),
           ChatDetails(message: "Sim!", date: Date().dateFromConversation(dateFromMessage:"2019-09-29 20:27"), userLogged: true)],
            [ChatDetails(message: "Está messagem é de hj?", date: Date().dateFromConversation(dateFromMessage:"2019-10-04 08:10"), userLogged: false),
            ChatDetails(message: "Sim!", date: Date().dateFromConversation(dateFromMessage:"2019-10-04 08:27"), userLogged: false)]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        //        formattedDate()
        setUpContentView()
        components.tableChatView.scrollToBottom()
        stepComponents.backButton.addTarget(self, action: #selector(backUpHome), for: .touchDown)
        components.tableChatView.register(LoggedUserCell.self, forCellReuseIdentifier: "loggedUserCell")
        components.tableChatView.register(ForeignUserCell.self, forCellReuseIdentifier: "externalUserCell")
        components.tableChatView.dataSource = self
        components.tableChatView.delegate = self
        
        self.view.clipsToBounds = true
        
        let right = UISwipeGestureRecognizer(target : self, action : #selector(segueToBack))
        right.direction = .right
        self.view.addGestureRecognizer(right)
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(view.endEditing(_:))))
        
        components.sendMessageButton.addTarget(self, action: #selector(sendMessage), for: .touchDown)
        
        components.userNameLabel.text = nameContact ?? "UserName"
        components.userNameLabel.textColor = UIColor.black
        
        components.photoUserImage.image = imageContact
        
        if userIsBlock {
            components.statusUserLabel.isHidden = true
            components.messageTextView.isHidden = true
            components.statusUserView.isHidden = true
            components.photoUserImage.image = nil
            components.blockView.isHidden = false
            components.userBlockLabel.isHidden = false
        }
        else {
            components.statusUserLabel.isHidden = false
            components.messageTextView.isHidden = false
            components.statusUserView.isHidden = false
            components.photoUserImage.image = imageContact
            components.blockView.isHidden = true
            components.userBlockLabel.isHidden = true
        }
        print(iphoneX)
        if iphoneX {
            self.components.tableChatView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 136, right: 0)
        }
        
        
    }
    
    
    @objc func segueToBack(_ sender: UIButton) {
        
        let transition = CATransition.init()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.fade
       //  transition.subtype = CATransitionSubtype.fromLeft
        transition.delegate = self
        view.window!.layer.add(transition, forKey: kCATransition)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @objc func sendMessage() {
        let message = components.messageTextFiel.text ?? ""
        
        if message == "" {
            view.endEditing(true)
            components.tableChatView.scrollToBottom()
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        
        let messageDateHour = dateFormatter.string(from: conversation.last?.last?.date ?? Date())
        let systemDateHour = dateFormatter.string(from: Date())
        let messageDate = messageDateHour.split(separator: " ")
        
        let systemDate = systemDateHour.split(separator: " ")

        
        if messageDate[0] == systemDate[0] {
           
            conversation[conversation.count - 1].append(ChatDetails(message: message, date: dateFormatter.date(from: systemDateHour)!, userLogged: true))
        }
        else {
            
            conversation.append([ChatDetails(message: message, date: dateFormatter.date(from: systemDateHour)! , userLogged: true)])
        }

        components.messageTextFiel.text?.removeAll()
        
        components.tableChatView.scrollToBottom()
        components.tableChatView.reloadData()

//
        
    }
    
    
    
    //Status bar na cor branca
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        NotificationCenter.default.removeObserver(self)
        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    private func setUpContentView() {
        stepComponents = StepComponents()
        
        components = ConversationComponents()
        contentScreen = ConversationScreen(stepComponents: stepComponents,components: components, frame: view.frame)
        view.addSubview(contentScreen)
        contentScreen.translatesAutoresizingMaskIntoConstraints = false
        
        
        var initialConstraints = [NSLayoutConstraint]()
        initialConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v0]-0-|",
                                                             options: NSLayoutConstraint.FormatOptions(),
                                                             metrics: nil,
                                                             views: ["v0" : contentScreen!])
        
        initialConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v0]-0-|",
                                                             options: NSLayoutConstraint.FormatOptions(),
                                                             metrics: nil,
                                                             views: ["v0" : contentScreen!])
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                iphone5s = true
            case 1334:
                break
            case 1920, 2208:
                break
            case 2436:
                iphoneX = true
                
            case 2688:
                iphoneX = true
                iphoneB = true
                
            case 1792:
                iphoneX = true
                
            default:
                break
            }
        }
        NSLayoutConstraint.activate(initialConstraints)
    }
    
    @objc func keyboardWillChange(){
        if keyboardHeightCalled != 0 {

            if iphoneX {
                self.components.messageTextView.frame.origin.y += (keyboardHeightCalled - 60)
                self.components.bottomView.frame.origin.y += (keyboardHeightCalled - 60)
                UIView.animate(withDuration: 0.4) {
                    self.components.tableChatView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 136, right: 0)
                }
            }
            else{
                
                self.components.messageTextView.frame.origin.y += keyboardHeightCalled
                self.components.tableChatView.contentInsetAdjustmentBehavior = .never
                UIView.animate(withDuration: 0.4) {
                    self.components.tableChatView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 75, right: 0)
                }
                
            }
            self.components.tableChatView.reloadData()
            self.components.tableChatView.scrollToBottom()
            keyboardHeightCalled = 0
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            if keyboardHeightCalled != 0 {
                let difference = keyboardHeight - keyboardHeightCalled
                if iphoneX {
                    self.components.messageTextView.frame.origin.y -= difference
                    self.components.bottomView.frame.origin.y -= difference
                }
            } else {
                if iphoneX {
                    self.components.messageTextView.frame.origin.y -= (keyboardHeight - 60)
                    self.components.bottomView.frame.origin.y -= (keyboardHeight - 60)
                    UIView.animate(withDuration: 0.4) {
                        self.components.tableChatView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight + 85, right: 0)
                    }
                }
                else{
                    self.components.messageTextView.frame.origin.y -= keyboardHeight
                    self.components.tableChatView.contentInsetAdjustmentBehavior = .always
                     UIView.animate(withDuration: 0.4) {
                        self.components.tableChatView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight + 75, right: 0)
                    }
                }
            }
            
            keyboardHeightCalled = keyboardHeight
        }
        self.components.tableChatView.reloadData()
        self.components.tableChatView.scrollToBottom()
        
    }
    @objc func backUpHome() {
        tabBarController?.tabBar.isHidden = true
        let transition = CATransition.init()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.default)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.delegate = self
        view.window!.layer.add(transition, forKey: kCATransition)
        
        self.navigationController?.popViewController(animated: false)
    }
    
    
    
}


extension ConversationViewController : UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
}


extension ConversationViewController : UITableViewDelegate {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversation[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return conversation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellUser = components.tableChatView.dequeueReusableCell(withIdentifier: "loggedUserCell") as! LoggedUserCell
        let cellExternal = components.tableChatView.dequeueReusableCell(withIdentifier: "externalUserCell") as! ForeignUserCell
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        
        
        let item = conversation[indexPath.section][indexPath.row]
        
        let date = dateFormatter.string(from: item.date)
        
        let time = date.split(separator: " ")
       
        if indexPath.row + 1 < conversation[indexPath.section].count {
            
            if let next = conversation[indexPath.section][indexPath.row + 1] as? ChatDetails,
                let now = conversation[indexPath.section][indexPath.row]  as? ChatDetails {
               
                if indexPath.row != 0 {
                    
                    if now.userLogged == conversation[indexPath.section][indexPath.row - 1].userLogged {
                        if now.userLogged == true {
                            cellUser.triangleView.isHidden = false
                            cellUser.messageCardView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,  .layerMinXMaxYCorner]
                            cellUser.messageCardView.layer.cornerRadius = 12
                            
                            if (now.userLogged == next.userLogged){
                                cellUser.triangleView.isHidden = true
                                cellUser.messageCardView.layer.maskedCorners = [.layerMinXMinYCorner,  .layerMinXMaxYCorner]
                                cellUser.messageCardView.layer.cornerRadius = 40
                                
                                
                            }
                        }
                        else {
                            cellExternal.triangleView.isHidden = false
                            cellExternal.messageCardView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,  .layerMaxXMaxYCorner]
                            cellExternal.messageCardView.layer.cornerRadius = 12
                            
                            if (now.userLogged == next.userLogged){
                                cellExternal.triangleView.isHidden = true
                                cellExternal.messageCardView.layer.maskedCorners = [.layerMinXMinYCorner,  .layerMinXMaxYCorner]
                                cellExternal.messageCardView.layer.cornerRadius = 40
                                
                                
                            }
                        }
                        
                    }
                        
                    
                }
                if (now.userLogged == next.userLogged){
                    
                    if now.userLogged == true {
                        cellUser.triangleView.isHidden = true
                        cellUser.messageCardView.layer.maskedCorners = [.layerMinXMinYCorner,  .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
                        cellUser.messageCardView.layer.cornerRadius = 18
                        
                        cellUser.messageLabel.frame.origin.x += 100
                    }
                    
                    else {
                        cellExternal.triangleView.isHidden = true
                        cellExternal.messageCardView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,  .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
                        cellExternal.messageCardView.layer.cornerRadius = 18
                        
                        cellExternal.messageLabel.frame.origin.x += 100
                        
                    }
                    
                    
                }
                else {
                    if now.userLogged {
                        cellUser.triangleView.isHidden = false
                        cellUser.messageCardView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,  .layerMinXMaxYCorner]
                        cellUser.messageCardView.layer.cornerRadius = 12
                    }
                    else {
                        cellExternal.triangleView.isHidden = false
                        cellExternal.messageCardView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,  .layerMaxXMaxYCorner]
                        cellExternal.messageCardView.layer.cornerRadius = 12
                    }
                    
                    
                }
                
                
            }
            
        }
        else {
            if conversation[indexPath.section][indexPath.row].userLogged {
                
                cellUser.triangleView.isHidden = false
                cellUser.messageCardView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,  .layerMinXMaxYCorner]
                cellUser.messageCardView.layer.cornerRadius = 12
            }
            else {
                
                cellExternal.triangleView.isHidden = false
                cellExternal.messageCardView.layer.maskedCorners =  [.layerMinXMinYCorner, .layerMaxXMinYCorner,  .layerMaxXMaxYCorner]
                cellExternal.messageCardView.layer.cornerRadius = 12
            }
            
        }
        

        
        if conversation.count > 0 {
            if item.userLogged{
                
                 
                
                cellUser.messageLabel.text = item.message
                cellUser.backgroundColor = UIColor.white
                cellUser.timeLabel.text = "\(time[1])"
                
                
                return cellUser
            }
            else {
                cellExternal.messageLabel.text = item.message
                cellExternal.backgroundColor = UIColor.white
                cellExternal.timeLabel.text = "\(time[1])"
                return cellExternal
            }
        }
        print("Foi pro ultimo, user logged")
        
        
        
        return cellUser
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 40
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let calender = Calendar.current
        
        
        
        
        if (conversation[section].first?.date) != nil {
            //Data
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            
            
            let dateMessage = conversation[section].first?.date
            
            let dataLabel = dataHeaderChat()
            
            let data = dateFormatter.string(from: dateMessage!)
            
            let exibeDate = data.split(separator: " ")
            
            if calender.isDateInToday(dateMessage!){
                dataLabel.text = "Hoje"
            }
            else {
                if calender.isDateInYesterday(dateMessage!){
                    dataLabel.text = "Ontem"
                }
                else{
                    
                    dataLabel.text = "\(exibeDate[0])"
                }
            }
            
            let dataView = UIView()
            
            dataView.addSubview(dataLabel)
            
            dataLabel.center(inView: dataView)
            
            return dataView
        }
        return nil
    }
   

}
class dataHeaderChat: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        textAlignment = .center
        
        textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont(name: "gotham", size: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize {
        let originalIntri = super.intrinsicContentSize
        let height = originalIntri.height + 12
        layer.cornerRadius = height/2
        layer.masksToBounds = true
        return CGSize(width: originalIntri.width + 20, height: height )
    }
}
extension UITableView {
    
    func scrollToBottom(){
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections - 1) - 1,
                section: self.numberOfSections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
    func scroll() {
        let indexPath = NSIndexPath(row: 0, section: 0)
        self.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
    }
    
}
extension Date {
    
    func dateFromConversation(dateFromMessage: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let result = dateFormatter.date(from: dateFromMessage)
        
        return result ??  Date()
    }
    
}

