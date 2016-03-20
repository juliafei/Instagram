//
//  User.swift
//  Instagram
//
//  Created by Julia Lau on 3/18/16.
//  Copyright © 2016 Julia Lau. All rights reserved.
//

import UIKit
import Parse

class User: NSObject {
    var name: String?
    var username: String?
    var password: String?
    var parseUser: PFUser!
    init(name: String, username: String, password: String) {
        super.init()
        self.name               = name
        self.username           = username
        self.password           = password
        self.parseUser          = PFUser()
        self.parseUser["name"]  = name
        self.parseUser.username = username
        self.parseUser.password = password
    }
    init(parseObject: PFObject) {
        super.init()
        print("initiializing user ")
        print("\( parseObject)")//.valueForKey("name"))")
        print("\(parseObject["name"])")
        
    }
    func signup(completion: (complete: Bool, error: NSError?) -> ()) {
        parseUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
                completion(complete: success, error: nil)
                print("created account for \(self.username)")
            } else {
                completion(complete: success, error: error)
                print("Error: account NOT created for \(self.username)")
            }
        }
    }
    func updateAttrs(params: NSDictionary) {
        for (key, value) in params {
            parseUser[key as! String] = value
            parseUser.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    print("\(key) has been saved for user \(self)")
                } else {
                    print("Error: \(key) NOT saved for user \(self)")
                }
            }
        }
    }
    class func getUser(username: String, completion: (user: PFObject, error: NSError?) -> ()) {
        let query = PFQuery(className: "_User")
        query.whereKey("username", matchesRegex: username)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            print("\(error) and \(objects)")
            if error == nil {
                completion(user: objects![0], error: nil)
            } else {
                print("Error: querying for user \(username) \n\n \(error)")
                completion(user:PFObject(), error: error)
            }
            
        }
    }

}
