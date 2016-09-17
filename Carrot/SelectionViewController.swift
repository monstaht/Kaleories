//
//  SelectionViewController.swift
//  Carrot
//
//  Created by Talha Baig on 9/17/16.
//  Copyright © 2016 Talha Baig. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    
    var picture: UIImage? {
        didSet{
            image.image = oldValue
        }
    }
    
    var selections: [[String]]?
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //selections[0] = send a get request
    }
    
  /*
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0//(selections?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
       // cell.textLabel?.text = selections![indexPath.row][indexPath.section]
        return cell
    }
 */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
