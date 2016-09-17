//
//  TestViewController.swift
//  Carrot
//
//  Created by Talha Baig on 9/17/16.
//  Copyright © 2016 Talha Baig. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UITableViewDelegate {

    var picture: UIImage? {
        didSet{
            imageView.image = oldValue
        }
    }
    
    var selections: [[String]]?
    var imageView = UIImageView()
    var tableView = UITableView()
    var spinner:UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.frame = CGRectMake(view.frame.minX, view.frame.minY, view.frame.width, view.frame.height / 2)
        picture = UIImage(named: "Pizza")
        view.addSubview(imageView)
        spinner = UIActivityIndicatorView()
        spinner?.stopAnimating()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func fetchImage() {
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
                let contentsOfURL = NSData(contentsOfURL: url) // blocks! can't be on main queue!
                let base64String = imageData?.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
                api.getSuggestions(base64String) { [suggestions] in
                    selections[0] = suggestions
                }
                // now that we got the data from the network
                // we want to put it up in the UI
                // but we can only do that on the main queue
                // so we queue up a closure here to do that
                dispatch_async(dispatch_get_main_queue()) {
                    spinner?.stopAnimating()
                    loadTableView()

                }
            }
    }
    
    private func loadTableView(){
        tableView.frame = CGRectMake(view.frame.midX, view.frame.midY, view.frame.width, view.frame.height / 2)
        
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
