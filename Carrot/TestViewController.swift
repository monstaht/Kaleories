//
//  TestViewController.swift
//  Carrot
//
//  Created by Talha Baig on 9/17/16.
//  Copyright © 2016 Talha Baig. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UITableViewDataSource{
    
    var picture: UIImage? {
        didSet{
            imageView.frame = CGRectMake(view.frame.minX, view.frame.minY, view.frame.width, view.frame.width)
            imageView.image = self.picture
            imageView.clipsToBounds = true
            imageView.contentMode = .ScaleAspectFill
        }
    }
    
    var selections: [String]?
    var imageView = UIImageView()
    var tableView: UITableView?
    var spinner:UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView =
      //  view.addSubview(imageView)
        selections = ["lets", "test", "test", "test", "test", "test", "test", "test"]
        spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
        spinner?.frame = CGRectMake(view.frame.midX, view.frame.midY, view.frame.width / 3, view.frame.width / 3)
        view.addSubview(spinner!)
        spinner?.startAnimating()
        fetchSuggestions()
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selections!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = selections![indexPath.row]
        return cell
    }
    
    private func fetchSuggestions() {
        // fire up the spinner
        // because we're about to fork something off on another thread
        spinner?.startAnimating()
        // put a closure on the "user initiated" system queue
        // this closure does NSData(contentsOfURL:) which blocks
        // waiting for network response
        // it's fine for it to block the "user initiated" queue
        // because that's a concurrent queue
        // (so other closures on that queue can run concurrently even as this one's blocked)
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) {
            let imageData = UIImageJPEGRepresentation(self.picture!, 0.0)
            let base64String = imageData?.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
            API.sharedInstance.getSuggestions(base64String!, completion: { [weak self](suggestion) in
                self?.selections = suggestion
                print(suggestion)
                print(self?.selections)
            })
            //UI initiated in non - UI thread
            self.loadTableView()
            // now that we got the data from the network
            // we want to put it up in the UI
            // but we can only do that on the main queue
            // so we queue up a closure here to do that
            dispatch_async(dispatch_get_main_queue()) { [weak self] in
                self!.spinner?.stopAnimating()
                
            }
        }
    }
    
    private func loadTableView(){
        tableView = UITableView()
        tableView!.frame = CGRectMake(view.frame.minX, view.frame.midY, view.frame.width, view.frame.height / 2)
        tableView!.dataSource = self
        tableView!.reloadData()
        view.addSubview(tableView!)
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
