//
//  Post.swift
//  Instagram
//
//  Created by Julia Lau on 3/17/16.
//  Copyright © 2016 Julia Lau. All rights reserved.
//

import UIKit
import Parse

class Post: NSObject {
    
        class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
            let mediaPost = PFObject(className: "Post")
            
            mediaPost["media"] = getPFFileFromImage(image)
            mediaPost["author"] = PFUser.currentUser()
            mediaPost["caption"] = caption
            
            mediaPost.saveInBackgroundWithBlock(completion)
        }
        
        class func getPFFileFromImage(image: UIImage?) -> PFFile? {
            if let image = image {
                if let imageData = UIImagePNGRepresentation(image) {
                    return PFFile(name: "image.png", data: imageData)
                }
            }
            
            return nil

  /*
    var author: String?
    var comment: String?
    var timestamp: NSDate?
    var picture: PFFile?
    
*/
    }


}
