//
//  ViewController.swift
//  Carrot
//
//  Created by Talha Baig on 9/16/16.
//  Copyright © 2016 Talha Baig. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var cameraView: UIView!
    
    
    var picture: UIImage?
    var imagepicker = UIImagePickerController()
    
    override func viewDidLoad() {
        imagepicker.delegate = self
        imagepicker.sourceType = .Camera
        tabBarController?.presentViewController(imagepicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        //let imageData = UIImageJPEGRepresentation(image, <#T##compressionQuality: CGFloat##CGFloat#>)
        picture = image
        //let base64String = imageData?.base64EncodedStringWithOptions(.Encoding64CharacterLineLength) //this may be an error
        //post the base64String to them
        //get the [String] array
        //store it at the top selections[0] = the get shit
        //picture = image
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let selectionview = sb.instantiateViewControllerWithIdentifier("selections") as! TestViewController
        selectionview.picture = picture
        selectionview.fetchSuggestions()
        imagepicker.presentViewController(selectionview, animated: true, completion: nil)
        
        //performSegueWithIdentifier("toselections", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationvc = segue.destinationViewController as? SelectionViewController {
            destinationvc.picture = picture
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(false, completion: nil)
    }

}



/*
 override func viewDidLoad() {
 let imagePickerController = UIImagePickerController()
 imagePickerController.delegate = self
 imagePickerController.sourceType = .Camera
 imagePickerController.view.frame =
 CGRect(x: self.view.frame.origin.x,
 y: self.view.frame.origin.y,
 width: self.view.frame.width,
 height: self.view.frame.height - (self.tabBarController?.tabBar.frame.size.height)!)
 print((self.tabBarController?.tabBar.frame.size.height)!)
 imagePickerController.navigationBarHidden = false
 
 
 
 //presentViewController(imagePickerController, animated: true, completion: nil)
 tabBarController?.presentViewController(imagePickerController, animated: true, completion: nil)
 }
 
 override func viewDidAppear(animated: Bool) {}
 */







/*UIViewController, ImagePickerDelegate {

 
    override func viewDidAppear(animated: Bool) {
        let imageViewController =  ImagePickerController()
        imageViewController.delegate = self
        presentViewController(imageViewController, animated: true, completion: nil)
    }
    
    func wrapperDidPress(imagePicker: ImagePickerController, images: [UIImage]) {
    }
    
    func doneButtonDidPress(imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func cancelButtonDidPress(imagePicker: ImagePickerController) {
        
    }
 }
 */
