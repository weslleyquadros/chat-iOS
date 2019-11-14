//
//  ChatViewController.swift
//  chat-iOS
//
//  Created by WeslleyQ on 11/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, CAAnimationDelegate, UITableViewDelegate {
    
    private var components : ChatComponents!
    private var contentScreen : ChatScreen!
    
    private var cellComponents : ListChat!
    
    var iphone5s = false
    var iphoneX = false

    
    var conversation : ChatClass?
    var infos = [String()]
    
    var filterdTerms : [ChatClass] = [ChatClass]()
    
    var listConversation : [ChatClass] = [ChatClass]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpContentView()
        
          self.navigationController?.isNavigationBarHidden = true

        
       
        self.components.seachTextField.alpha = 1
        self.components.seachTextField.isHidden = false
        
        components.mensageEmptyLabel.alpha = 0
        
        components.seachTextField.addTarget(self, action: #selector(seachInRequest), for: .editingChanged)
        components.seachTextField.endEditing(true)
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
         components.tableConversationsView.register(ListChat.self, forCellReuseIdentifier: "listChatCell")
        
        
        self.components.tableConversationsView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        
        components.tableConversationsView.dataSource = self
        components.tableConversationsView.delegate = self

     
        appendList()
        self.components.tableConversationsView.addSubview(self.refreshControl)
        
       // if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: components.tableConversationsView)
            
        //}
        self.view.clipsToBounds = true
    
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
 
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
                     #selector(ChatViewController.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        
        
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {

        self.components.tableConversationsView.reloadData()
        refreshControl.endRefreshing()
    }
    
    


    
    func appendList() {
     
        listConversation.append(ChatClass(image: #imageLiteral(resourceName: "woman"), name: "Carlinha", message: "Essa é uma mensagem aletoria pra poder ficar bonito na fita", date: "07:23", qtd: "300", active: true, itsBlocked: false))
        listConversation.append(ChatClass(image: #imageLiteral(resourceName: "woman"), name: "Anna", message: "Essa é uma mensagem aletoria pra poder ficar bonito na fita", date: "07:23", qtd: "2", active: true, itsBlocked: true))
        listConversation.append(ChatClass(image: #imageLiteral(resourceName: "man"), name: "Marcos", message: "Essa é uma mensagem aletoria pra poder ficar bonito na fita", date: "07:23", qtd:"", active: false, itsBlocked: false))
         listConversation.append(ChatClass(image: #imageLiteral(resourceName: "man"), name: "Paulo", message: "Essa é uma mensagem aletoria pra poder ficar bonito na fita", date: "07:23",qtd: "4", active: false, itsBlocked: false))
        listConversation.append(ChatClass(image: #imageLiteral(resourceName: "woman"), name: "Maria", message: "Essa é uma mensagem aletoria pra poder ficar bonito na fita", date: "07:23", qtd: "20", active: true, itsBlocked: false))
 
    }
     
     @objc func backUpHome() {
         tabBarController?.tabBar.isHidden = true
         let transition = CATransition.init()
         transition.duration = 0.5
         transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.default)
         transition.type = CATransitionType.push
         transition.subtype = CATransitionSubtype.fromBottom
         transition.delegate = self
         view.window!.layer.add(transition, forKey: kCATransition)
         
         self.navigationController?.popToRootViewController(animated: false)
     }
     
    
    private func setUpContentView() {
       
        components = ChatComponents()
        contentScreen = ChatScreen( components: components, frame: view.frame)
        view.addSubview(contentScreen)
        contentScreen.translatesAutoresizingMaskIntoConstraints = false
        
        var initialConstraints = [NSLayoutConstraint]()
        initialConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v0]-0-|",
                                                             options: NSLayoutConstraint.FormatOptions(),
                                                             metrics: nil,
                                                             views: ["v0" : contentScreen])
        
        initialConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v0]-0-|",
                                                             options: NSLayoutConstraint.FormatOptions(),
                                                             metrics: nil,
                                                             views: ["v0" : contentScreen])
        
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                //                print("iPhone 5 or 5S or 5C")
                iphone5s = true
                
            case 1334:
                //                print("iPhone 6/6S/7/8")
                break
            case 1920, 2208:
                //                print("iPhone 6+/6S+/7+/8+")
                break
                
            case 2436:
                //                print("iPhone X, XS")
                iphoneX = true
                
            case 2688:
                //                print("iPhone XS Max")
                iphoneX = true
                
            case 1792:
                //                print("iPhone XR")
                iphoneX = true
                
            default:
                //                print("Unknown")
                break
            }
        }
        
        
        NSLayoutConstraint.activate(initialConstraints)
        
    }

    @objc func seachInRequest(seach: UITextField){
           let seachText = seach.text ?? ""
           filterContentForSearchText(searchText: seachText)
       }
 
}


extension ChatViewController : UITableViewDataSource {
    
    func filterContentForSearchText(searchText: String) {
         filterdTerms.removeAll()
         UIView.animate(withDuration: 0.4) {
            
             self.components.mensageEmptyLabel.alpha = 0
             self.components.tableConversationsView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
         }
         for i in listConversation {
            if i.name.localizedCaseInsensitiveContains(searchText){
                 filterdTerms.append(i)
                 components.tableConversationsView.reloadData()
             }
             
         }
         if filterdTerms.count == 0 {
            
             UIView.animate(withDuration: 0.4) {
                
                 self.components.mensageEmptyLabel.alpha = 1
                 self.components.tableConversationsView.separatorStyle = UITableViewCell.SeparatorStyle.none
             }
             filterdTerms.removeAll()
             components.tableConversationsView.reloadData()
         }
         
         if components.seachTextField.text == "" {
             filterdTerms.removeAll()
             filterdTerms = listConversation
            
             self.components.mensageEmptyLabel.alpha = 0
                self.components.tableConversationsView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
             components.tableConversationsView.reloadData()
         }
     
     }
    
       
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           if components.seachTextField.text != ""  {
                   return filterdTerms.count
               }
             
            if listConversation.count == 0 {
                 self.components.mensageEmptyLabel.alpha = 1
                self.components.tableConversationsView.separatorStyle = UITableViewCell.SeparatorStyle.none
            }
            
               return listConversation.count
         
        }


        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = components.tableConversationsView.dequeueReusableCell(withIdentifier: "listChatCell", for: indexPath) as? ListChat
            
            cell?.conversation =  listConversation[indexPath.row]
         
            
            var itemToShow = listConversation[indexPath.row]
                   if filterdTerms.count != 0 {
    //                   if seachStatus {
                           if components.seachTextField.text != "" {
                            itemToShow = filterdTerms[indexPath.row]
                           }
                     //  }
                       else {
                           itemToShow = filterdTerms[indexPath.row]
                       }
                       
                   }
    //
            cell?.nameContact.text = itemToShow.name
  
            // adiciona o sinal de "online" se o user "realmente" estiver
            if itemToShow.active == false {
                cell?.imageActive.alpha = 0

            }
            
            
            // alterar celula caso tenha mensagem não lida / lida
            if itemToShow.qtd == "" {
                
                cell?.circle.alpha = 0
                cell?.messageLabel.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
                cell?.nameContact.textColor =  UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
                
            } else {
                
                cell?.qtdLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            }
         if itemToShow.qtd.count  >= 2 {

            cell?.circle.widthAnchor.constraint(equalToConstant: 25).isActive = true
            }
         else {
            cell?.circle.widthAnchor.constraint(equalToConstant: 20).isActive = true
            }
            
            guard let gothamBook = UIFont(name: "gotham-book", size: 11) else {
                            fatalError("""
                                Failed to load the "GothamBook" font.
                                Make sure the font file is included in the project and the font name is spelled correctly.
                            """)
                        }
                   
        if itemToShow.qtd.count  >= 3 {

            cell?.qtdLabel.text = "+99"
            cell?.qtdLabel.font = gothamBook
        }
        else {
            cell?.qtdLabel.text = itemToShow.qtd
            cell?.qtdLabel.font = gothamBook
        }
                       
            
            
            
            // alterar celula caso usuario esteja bloqueado
            if itemToShow.itsBlocked == true {
                          
                cell?.imageContact.image = .none
                cell?.messageLabel.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
                cell?.nameContact.textColor =  UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
                cell?.circle.alpha = 0
                cell?.imageActive.alpha = 0
            }
            
            
        
            cell?.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 30)
            
            if listConversation.count == 0 {
                    
                     UIView.animate(withDuration: 0.4) {
                    
                       
                         self.components.tableConversationsView.separatorStyle = UITableViewCell.SeparatorStyle.none
                     }
                     listConversation.removeAll()
                     components.tableConversationsView.reloadData()
                 }
                 
            cell?.backgroundColor = UIColor.white
                cell?.alpha = 0.3
                       
        return cell!
        }
    
                 
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let sizeHeight = components.tableConversationsView.frame.size.height
            var height = 0.0   //
            
                if UIDevice().userInterfaceIdiom == .phone {
                        switch UIScreen.main.nativeBounds.height {
                        case 1136:
                            height = 0.25
                        case 1334:
                            height = 0.21
                        case 1920, 2208:
                            height = 0.19
                        case 2436:
                            height = 0.17
                        case 2688:
                         height = 0.17
                        case 1792:
                            height = 0.15
                        default:
                            print("Unknown")
                        }
                }
            return sizeHeight * CGFloat(height)
            
        }
                   

                   
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
                       return 3.5
        }
            



    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
         let delete = UIContextualAction(style: .destructive, title: "Apagar") { (action, view, nil) in

            let itemToShow = self.listConversation[indexPath.row]
            if self.components.seachTextField.text != ""  {
                self.filterdTerms.remove(at: indexPath.row)

                tableView.deleteRows(at: [indexPath], with: .bottom)
                
                            
              
            }
            else{
                self.listConversation.remove(at: indexPath.row)
                
            
                tableView.deleteRows(at: [indexPath], with: .bottom)
          
            }
        }
        delete.backgroundColor = UIColor.red
        delete.image = UIImage(named: "trash")


       

        return UISwipeActionsConfiguration(actions: [delete])
    }
    

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            
            tabBarController?.tabBar.isHidden = false
            let transition = CATransition.init()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.default)
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            transition.delegate = self
            view.window!.layer.add(transition, forKey: kCATransition)
             
            if filterdTerms.count != 0 {
                self.performSegue(withIdentifier: "filterdTerms", sender: self, indexPath: indexPath)
                
            }
            else{
                self.performSegue(withIdentifier: "listContact", sender: self, indexPath: indexPath)
            }
            
        }
    
    
        func performSegue(withIdentifier identifier: String, sender: Any?, indexPath: IndexPath) {
 
            let itemToShow = listConversation[indexPath.row]
            
            if identifier == "filterdTerms" {
                let pass =  ConversationViewController()

                pass.nameContact = itemToShow.name
                pass.imageContact = itemToShow.image

                if itemToShow.itsBlocked == true {
                    pass.userIsBlock = true

                }
                else{
                    pass.userIsBlock = false

                }


                self.navigationController?.pushViewController(pass, animated: false)
            }
            if identifier == "listContact" {
                let pass =  ConversationViewController()

                pass.nameContact = itemToShow.name
                pass.imageContact = itemToShow.image

                if itemToShow.itsBlocked == true {
                    pass.userIsBlock = true

                }
                else{
                    pass.userIsBlock = false

                }


                self.navigationController?.pushViewController(pass, animated: false)
            }
           
       
        }

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let cell = components.tableConversationsView.dequeueReusableCell(withIdentifier: "listChatCell", for: indexPath) as? ListChat
                    
                    cell?.conversation =  listConversation[indexPath.row]
                 

        let itemToShow = self.listConversation[indexPath.row]
        let lida = UIContextualAction(style: .destructive, title: "Lida") { (action, view, sucess : (Bool) -> Void) in

            
            if itemToShow.qtd == "" {
            
               sucess(true)
//            cell?.circle.alpha = 0
//            cell?.messageLabel.textColor =  UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
//            cell?.nameContact.textColor =  UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
              
            }
           
        }
                lida.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
               // lida.image = UIImage(named: "trash")

               

                return UISwipeActionsConfiguration(actions: [lida])
        
    }
   


    

}
extension ChatViewController : UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
   
    

    
}

extension ChatViewController : UIViewControllerPreviewingDelegate
{
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let indexPath = components.tableConversationsView.indexPathForRow(at: location),
            let cell = components.tableConversationsView.cellForRow(at: indexPath) else {
                
                return nil
        }
        
      

        let vc = ConversationViewController()


        let itemToShow = listConversation[indexPath.row]


            vc.nameContact = itemToShow.name
            vc.imageContact = itemToShow.image

            if itemToShow.itsBlocked == true {
                vc.userIsBlock = true

            }
            else{
                vc.userIsBlock = false

            }



        previewingContext.sourceRect = cell.frame
//            ListContactsViewController.instantiate()

        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
      
        
    }
    
    
    
}

