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
