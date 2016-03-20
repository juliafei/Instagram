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
            mediaPost["likesCount"] = 0
            mediaPost["commentsCount"] = 0
            
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
    
    
    init(comment:String, user:String, picture:PFFile, date:NSDate) {
        super.init()
        self.author = user
        self.comment = comment
        self.picture = picture
        self.timestamp = date
    }
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        // Create Parse object PFObject
        let media = PFObject(className: "Post")
        
        // Add relevant fields to the object
        media["media"] = getPFFileFromImage(image) // PFFile column type
        media["author_name"] = PFUser.currentUser()?.valueForKey("username") // Pointer column type that points to PFUser
        media["caption"] = caption
        media["likesCount"] = 0
        media["commentsCount"] = 0
        
        // Save object (following function will save the object in Parse asynchronously)
        media.saveInBackgroundWithBlock(completion)
    }
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
    class func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    class func getContent(author: String, completion: (content: [Post], error: NSError?) -> ()) {
        let query = PFQuery(className: "Post")
        if author.characters.count > 0{
            query.whereKey("author_name", equalTo: author)
        }
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                //                print("found \(objects?.count) post(s)")
                var post_content = [Post]()
                for post in objects! {
                    post_content.append(Post(
                        comment: (post.valueForKey("caption") as? String)!,
                        user:    post["author_name"] as! String,
                        picture: post["media"] as! PFFile,
                        date:    post.updatedAt as! NSDate!)
                    )
                }
                completion(content: post_content.reverse(), error: nil)
            } else {
                completion(content: [], error: error)
                print("error getting media content \(error)\n\n")
            }
        }
*/
    }


}
