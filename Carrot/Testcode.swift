//
//  ViewController.swift
//  Router
//
//  Created by Jay Chia on 17/9/16.
//  Copyright © 2016 Jay Chia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = API()
        let url = NSURL(string: "http://feelgrafix.com/data_images/out/28/992756-cheese.jpg")
        let imageData:NSData = NSData.init(contentsOfURL: url!)!
        let strBase64:String = imageData.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        api.getSuggestions(strBase64, completion: completion1)
        //        let cjson = ["Food": [["Pizza", 5], ["Fries", 6]], "url": "http://pngimg.com/upload/carrot_PNG4985.png"]
        //        api.confirmFood(completion2, confirmedjson: cjson)
        showPopUp(self)
        //        closePopUp(self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
}


   
   
   
   func completion1(strobj: [String]) {
        print("running completion1")
        print(strobj)
    }
    
    func completion2(obj: (Nutrition, String)) {
        print(obj.0.calories)
        print(obj.1)
    }
    
    var popViewController : PopUpViewControllerSwift!
    
    @IBAction func showPopUp(sender: AnyObject) {
        let bundle = NSBundle(forClass: PopUpViewControllerSwift.self)
        if (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
        {
            self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPad", bundle: bundle)
            self.popViewController.title = "This is a popup view"
            self.popViewController.showInView(self.view, withImage: UIImage(named: "logo"), withMessage: "You just triggered a great popup window", animated: true)
        } else
        {
            if UIScreen.mainScreen().bounds.size.width > 320 {
                if UIScreen.mainScreen().scale == 3 {
                    self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPhone6Plus", bundle: bundle)
                    self.popViewController.title = "This is a popup view"
                    self.popViewController.showInView(self.view, withImage: UIImage(named: "logo"), withMessage: "You just triggered a great popup window", animated: true)
                } else {
                    self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPhone6", bundle: bundle)
                    self.popViewController.title = "This is a popup view"
                    self.popViewController.showInView(self.view, withImage: UIImage(named: "logo"), withMessage: "You just triggered a great popup window", animated: true)
                }
            } else {
                self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: bundle)
                self.popViewController.title = "This is a popup view"
                self.popViewController.showInView(self.view, withImage: UIImage(named: "logo"), withMessage: "You just triggered a great popup window", animated: true)
            }
        }
    }