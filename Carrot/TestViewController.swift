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
    
    //let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "suggestioncell")
    var selections: [String]?
    var imageView = UIImageView()
    var tableView: UITableView?
    var spinner:UIActivityIndicatorView?
    var url: String?
    var values: [Int]?
    
    override func viewDidLoad() {
        print("im here")
        super.viewDidLoad()
       // tableView?.registerClass(UITableViewCell(style: UITableViewCellStyle.Subtitle).self, forCellReuseIdentifier: "suggestioncell")
        view.addSubview(imageView)
        selections = ["lets", "test", "test", "test", "test", "test", "test", "test"]
        values = [Int](count: selections!.count, repeatedValue: 0)
        view.backgroundColor = UIColor(red: 185/255, green: 233/255, blue: 173/255, alpha: 1.0)
        spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        spinner?.transform = CGAffineTransformMakeScale(1.5, 1.5)
        //spinner?.transform = CGAffineTransformTranslate(spinner!.transform, -40, 0)
        spinner?.hidden = false
        spinner?.center = CGPointMake(view.frame.midX , view.frame.midY + 128)
        spinner?.hidesWhenStopped = true
        spinner?.startAnimating()
        view.addSubview(spinner!)
        let button = UIButton(frame: CGRectMake(view.frame.minX, view.frame.maxY - 75, view.frame.width, view.frame.height/8))
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
        //button.titleLabel?.transform = CGAffineTransformTranslate((button.titleLabel?.transform)!, 0, -20)
        //button.textLabel?.textColor = UIColor.grayColor()
        button.addTarget(self, action: #selector(TestViewController.buttonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        button.setTitle("Submit", forState: .Normal)
        button.backgroundColor = UIColor(red: 185/255, green: 233/255, blue: 173/255, alpha: 1.0)
        view.addSubview(button)
        fetchSuggestions()
        // Do any additional setup after loading the view.
    }
    
    func buttonPressed (sender: UIButton!){
        print("button is succuesssful")
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selections!.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        values![indexPath.row]++
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "suggestioncell")
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.textLabel?.text = selections![indexPath.row]
        cell.textLabel?.textColor = UIColor.grayColor()
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 28)
        let stepper = UIStepper()
        stepper.tintColor = UIColor(red: 185/255, green: 233/255, blue: 173/255, alpha: 1.0)
        stepper.transform = CGAffineTransformMakeScale(1.1, 1.1)
        //let detailTextLabel = UILabel()
        cell.detailTextLabel?.text = "work please"
        cell.accessoryView = stepper
        print("im here as well")
        print(cell.detailTextLabel)
        cell.detailTextLabel?.text = String(values![indexPath.row])
        
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
        
        API.sharedInstance.getSuggestions(base64String) { (suggestions, url) in
            self.selections = suggestions
            self.url = url
            self.values = [Int](count: self.selections!.count, repeatedValue: 0)
            
            dispatch_async(dispatch_get_main_queue()) {
                self.spinner?.stopAnimating()
                self.loadTableView()
            }
        }
    }
    
    private func loadTableView(){
        tableView = UITableView()
        tableView!.registerClass(SuggestionTableViewCell.self, forCellReuseIdentifier: "suggestioncell")
        tableView!.frame = CGRectMake(view.frame.minX, view.frame.midY, view.frame.width, view.frame.height / 2.5)
        tableView!.dataSource = self
        tableView!.delegate = self
        tableView!.reloadData()
        tableView!.backgroundColor = UIColor(red: 185, green: 233, blue: 173, alpha: 1.0)
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
