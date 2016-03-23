//
//  PostCell.swift
//  Instagram
//
//  Created by Julia Lau on 3/18/16.
//  Copyright © 2016 Julia Lau. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import AFNetworking

class PostCell: UITableViewCell {
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postPicture: UIImageView!
    
    var photos: PFObject!{
        didSet {
            
            captionLabel.text = photos["caption"] as? String
            let file = photos["media"] as? PFFile
            let url = NSURL(string: (file?.url)!)
            postPicture.setImageWithURL(url!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
