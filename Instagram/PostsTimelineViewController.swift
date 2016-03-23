//
//  PostsTimelineViewController.swift
//  Instagram
//
//  Created by Julia Lau on 3/17/16.
//  Copyright © 2016 Julia Lau. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostsTimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var photos: [PFObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        parseAPICall()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        parseAPICall()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return photos?.count ?? 0
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //new cell that cotains the caption & image
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! PostCell
        cell.photos = photos![indexPath.row]
        
       // let photo = photos[indexPath.row]
        
        //cell.photofromParse.file = photo["media"] as? PFFile
        //cell.photofromParse.loadInBackground()
      //  cell.photofromParse.reloadInputViews()
        
        //let caption = photo ["caption"] as! String
        //cell.captionLabel.text = caption

        return cell
    }
    
    func parseAPICall() {
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                print("data fetched")
                self.photos = posts
                self.tableView.reloadData()
            } else {
                print ("Error: data not fetched")
            }
        }
    }
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
  /*  var pictures: [PFObject]?
    
    /*var media:[Post]?{
        didSet{
            tableView.reloadData()
        }
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getParseData()
        tableView.reloadData()
    }
    
    func getParseData() {
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                self.pictures = posts
                self.tableView.reloadData()
            }
        }
    }
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        Post.getContent ("", completion: { (content, error) -> () in
            self.media = content
        })

        // Do any additional setup after loading the view.
    }
*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        getParseData()
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
        
        let object = pictures![indexPath.row]
        
        cell.object = object
        
        return cell
    }
    
   /* func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = media {
            return data.count
        }
        else {
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as! PostCell
        cell.post = media![indexPath.row] as Post
        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
*/
*/

