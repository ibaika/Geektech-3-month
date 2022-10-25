//
//  ViewController.swift
//  simpleChatApp
//
//  Created by ibaikaa on 26/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    //картинки
    let img1 = UIImage(named: "avatar")
    let img2 = UIImage(named: "avatar2")
    let img3 = UIImage(named: "Image")
    let defaultImg = UIImage(systemName: "person.fill")!
    
    
    var chats = [Chat]()
    
    
    @IBOutlet weak var chatsTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         chats = [
            Chat(chatTitle: "Sienna", latestMessage: "What are u doing??", avatar: (img1 ?? defaultImg)),
            
            Chat(chatTitle: "Michael", latestMessage: "Hello! How are you? 🤗", avatar: (img2 ?? defaultImg)),
            
            Chat(chatTitle: "Bro", latestMessage: "Let's party now!", avatar: defaultImg),
            
            Chat(chatTitle: "Grandpa", latestMessage: "I made a dinner for us! Come up! Let's eat together!! ❤️❤️", avatar: (img3 ?? defaultImg))
         ]
        
    }


}


extension ViewController: UITableViewDataSource{
    
    
    //количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chats.count
    }
    
    //создание ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatsTableView.dequeueReusableCell(withIdentifier: "chat_cell") as! ChatTableViewCell
        
        cell.chatAvatarImageView.image = chats[indexPath.row].avatar
        
        cell.chatAvatarImageView.maskCircle(anyImage: chats[indexPath.row].avatar)
        
        cell.chatTitleLabel.text = chats[indexPath.row].chatTitle
        cell.chatLatestMessageLabel.text = chats[indexPath.row].latestMessage

        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    
    //переход на viewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatDetailedViewController = navigationController?.storyboard?.instantiateViewController(withIdentifier: "detailed_vc") as! ChatDetailedViewController
        
        
        chatDetailedViewController.loadViewIfNeeded()
        
        chatDetailedViewController.avatarImageView.image = chats[indexPath.row].avatar
        
        chatDetailedViewController.chatTitleLabel?.text = chats[indexPath.row].chatTitle
        
        chatDetailedViewController.latestMessageLabel?.text = chats[indexPath.row].latestMessage
        
        navigationController?.pushViewController(chatDetailedViewController, animated: true)
    }
    
    
    //высота ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}



//функция, чтоб сделать картинку круглой
extension UIImageView {
  public func maskCircle(anyImage: UIImage) {
      self.layer.cornerRadius = self.frame.width / 2
      self.clipsToBounds = true
      self.layer.borderWidth = 3.0
      self.layer.borderColor = UIColor.white.cgColor
      self.image = anyImage
  }
}
