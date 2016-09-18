//
//  HomeTableViewController.swift
//  Carrot
//
//  Created by Talha Baig on 9/17/16.
//  Copyright © 2016 Talha Baig. All rights reserved.
//

import UIKit

class HomeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate{

    var images = [UIImage]()
    var dates = [Int]()
    
    @IBOutlet var tableView: UITableView!
    
    private func setup (URLs: [(String, Int)]) -> Void {
        
        let urls = URLs.map { NSURL(string: $0.0) }
        let data = urls.map { NSData(contentsOfURL: $0!) }
        self.images.appendContentsOf(data.map { UIImage(data: $0!)! })
        self.dates.appendContentsOf(URLs.map { $0.1 })
        print(images)
        dispatch_async(dispatch_get_main_queue()) { 
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.separatorStyle = .SingleLineEtched
            self.tableView.separatorColor = UIColor(red: 220, green: 220, blue: 220, alpha: 1)
            self.tableView.reloadData()
            self.modalPresentationStyle = UIModalPresentationStyle.Popover
            let poppc = self.popoverPresentationController
            poppc?.delegate = self
            poppc?.backgroundColor = UIColor.blackColor()
        }
    }
    
    override func viewDidLoad() {
        let nav = self.navigationController?.navigationBar
        nav?.barTintColor = UIColor(red: 0.976470588 , green: 0.568627451, blue: 0.215686275, alpha: 0.2).colorWithAlphaComponent(0.6)
        nav?.translucent = true
        let imageView = UIImageView(image: UIImage(named:"logo-1"))
        imageView.frame = CGRectMake(0, 0, 130, 40)
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFit
        self.navigationItem.titleView = imageView
        nav?.frame = CGRectMake(0, 0, 400, 100)
        super.viewDidLoad()
        API.sharedInstance.getAllPics(setup)
        print(self.images)
        
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("homecell", forIndexPath: indexPath) as! HomeTableViewCell
        cell.picture = images[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    //MARK: -
    //MARK: Table View Delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return view.frame.width
    }
    

    func  tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        showPopUp(self)

        
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    var popViewController : PopUpViewControllerSwift!
    
    @IBAction func showPopUp(sender: AnyObject) {
        let bundle = NSBundle(forClass: PopUpViewControllerSwift.self)
        if (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
        {
            self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPad", bundle: bundle)
            self.popViewController.title = "This is a popup view"
            self.popViewController.showInView(self.view, withImage: UIImage(named: "nutrition"), withMessage: "", animated: true)
        } else
        {
            if UIScreen.mainScreen().bounds.size.width > 320 {
                if UIScreen.mainScreen().scale == 3 {
                    self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPhone6Plus", bundle: bundle)
                    self.popViewController.title = "This is a popup view"
                    self.popViewController.showInView(self.view, withImage: UIImage(named: "nutrition"), withMessage: "", animated: true)
                } else {
                    self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPhone6", bundle: bundle)
                    self.popViewController.title = "This is a popup view"
                    self.popViewController.showInView(self.view, withImage: UIImage(named: "nutrition"), withMessage: "", animated: true)
                }
            } else {
                self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: bundle)
                self.popViewController.title = "This is a popup view"
                self.popViewController.showInView(self.view, withImage: UIImage(named: "nutrition"), withMessage: "", animated: true)
            }
        }
    }

    
/*
 navigationItem.titleView = UIImageView(image: UIImage(named:"Logo"))
 let item = UIBarButtonItem(customView: UIImageView(image: UIImage(named: "Logo")))
 self.navigationItem.rightBarButtonItem = item
*/
 
    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.dequeueReusableCellWithIdentifier("homecell", forIndexPath: indexPath) as! HomeTableViewCell
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("GraphPopover")
        vc.preferredContentSize = CGSize(width: view.frame.width, height: view.frame.width)
        let popover = vc.popoverPresentationController
        popover?.sourceView = cell.myImageView
    }
    */


    // MARK: - Navigation



}
