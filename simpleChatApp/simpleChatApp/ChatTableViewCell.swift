//
//  ChatTableViewCell.swift
//  simpleChatApp
//
//  Created by ibaikaa on 26/10/22.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var chatAvatarImageView: UIImageView!
    
    
    @IBOutlet weak var chatTitleLabel: UILabel!
    
    
    @IBOutlet weak var chatLatestMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
