//
//  PictureViewController.swift
//  Instagram
//
//  Created by Julia Lau on 3/19/16.
//  Copyright © 2016 Julia Lau. All rights reserved.
//

import UIKit
import Parse

class PictureViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var captionText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var uploadPicture: UIButton!
    
    @IBOutlet weak var pickedImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.navigationController?.navigationBarHidden = true
       // imageView.image = picture
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   /* var newMedia: Bool?
    let vc = UIImagePickerController()
    var picture: UIImage?
    
    */
    
    @IBAction func uploadPicture(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            // Do something with the images (based on your use case)
            if editedImage.imageAsset != nil{
                imageView.image = editedImage
            }else{
                pickedImageView.image = originalImage
            }
            
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
            
    }
    

    /*func finalizePicture(image: UIImage) {
        imageView.image = image
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "sharePicture" {
        }
    }
    */

    
    @IBAction func onSubmit(sender: AnyObject) {
        
        let newImage = resize(imageView.image!, newSize: CGSize(width: 300, height: 500))
        
        Post.postUserImage(newImage, withCaption: captionText.text!) { (success: Bool, erro: NSError?) -> Void in
            //            code
            if success{
                print("Posted")
                self.imageView.image = nil
                self.captionText.text = nil
                
            } else {
                print("Error: not Posted")
                
            }
        }
        
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
    
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        return newImage
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
