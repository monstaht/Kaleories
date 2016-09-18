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
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images.append(UIImage(named: "Pizza")!)
        images.append(UIImage(named: "Red Bull")!)
        images.append(UIImage(named: "Carrots")!)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .None
        tableView.reloadData()
        self.modalPresentationStyle = UIModalPresentationStyle.Popover
        let poppc = self.popoverPresentationController
        poppc?.delegate = self
        poppc?.backgroundColor = UIColor.blackColor()
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
        let cell = tableView.dequeueReusableCellWithIdentifier("homecell") as! HomeTableViewCell
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewControllerWithIdentifier("GraphPopover")
        let otherpop = vc.popoverPresentationController
        vc.modalPresentationStyle = UIModalPresentationStyle.Popover
        otherpop?.sourceView = cell.myImageView
        otherpop?.sourceRect = cell.frame
        otherpop?.backgroundColor = UIColor.blackColor()
        let poppc  = self.popoverPresentationController
        poppc?.sourceView = cell.myImageView
        poppc?.sourceRect = cell.frame
        poppc?.backgroundColor = UIColor.blackColor()
        
        presentViewController(vc, animated: true, completion: nil)
        
        
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
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
