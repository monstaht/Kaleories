//
//  TestViewController.swift
//  Carrot
//
//  Created by Talha Baig on 9/17/16.
//  Copyright © 2016 Talha Baig. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var picture: UIImage? {
        didSet{
            imageView.frame = CGRectMake(view.frame.minX, view.frame.minY, view.frame.width, view.frame.height/2)
            imageView.image = self.picture
            imageView.clipsToBounds = true
            imageView.contentMode = .ScaleAspectFill
        }
    }
    
    var selections: [String]?
    var imageView = UIImageView()
    var tableView: UITableView?
    var spinner:UIActivityIndicatorView?
    var url: String?
    
    override func viewDidLoad() {
        print("im here")
        super.viewDidLoad()
        view.addSubview(imageView)
        selections = ["lets", "test", "test", "test", "test", "test", "test", "test"]
        view.backgroundColor = UIColor(red: 185, green: 233, blue: 173, alpha: 1.0)
        spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        spinner?.transform = CGAffineTransformMakeScale(1.5, 1.5)
        spinner?.hidden = false
        spinner?.center = CGPointMake(view.frame.midX , view.frame.midY + 128)
        spinner?.hidesWhenStopped = true
        spinner?.startAnimating()
        view.addSubview(spinner!)
        fetchSuggestions()
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selections!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = selections![indexPath.row]
        cell.textLabel?.textColor = UIColor.grayColor()
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
        let stepper = UIStepper()
        stepper.transform = CGAffineTransformMakeScale(1.1, 1.1)
        cell.accessoryView = stepper
        cell.detailTextLabel?.text = String(stepper.value)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    private func fetchSuggestions() {
        spinner?.startAnimating()
        //let url = NSURL(string: "http://feelgrafix.com/data_images/out/28/992756-cheese.jpg")
        let imageData = UIImageJPEGRepresentation(self.picture!,0.0)
        //let imageData:NSData = NSData.init(contentsOfURL: url!)!
        let base64String:String = imageData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        /*
        API.sharedInstance.getSuggestions(base64String) { (suggestions, url) in
            self.selections = suggestions
            self.url = url
        }
        */
        
        self.spinner?.stopAnimating()
        self.loadTableView()
    }
    
    private func loadTableView(){
        let tableView = UITableView()
        tableView.registerClass(SuggestionTableViewCell.self, forCellReuseIdentifier: "suggestioncell")
        tableView.frame = CGRectMake(view.frame.minX, view.frame.midY, view.frame.width, view.frame.height / 2)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        tableView.backgroundColor = UIColor.redColor()
        view.addSubview(tableView)
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
