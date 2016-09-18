//
//  GraphViewController.swift
//  Carrot
//
//  Created by Talha Baig on 9/18/16.
//  Copyright © 2016 Talha Baig. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        picture.image = UIImage(named: "Calendar")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
