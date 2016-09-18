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
        super.viewDidLoad()
        imagepicker.delegate = self
        imagepicker.sourceType = .Camera
        tabBarController?.presentViewController(imagepicker, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        picture = image
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let selectionview = sb.instantiateViewControllerWithIdentifier("selections") as! TestViewController
        selectionview.picture = picture
        imagepicker.pushViewController(selectionview, animated: true)
        
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
