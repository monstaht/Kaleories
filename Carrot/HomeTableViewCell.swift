//
//  HomeTableViewCell.swift
//  Carrot
//
//  Created by Talha Baig on 9/17/16.
//  Copyright © 2016 Talha Baig. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    var myImageView = UIImageView()
    var info: UIDateView?
    
    var picture: UIImage? {
        didSet{
            myImageView = UIImageView(frame: CGRectMake(0, 0, frame.width, frame.width))
            myImageView.clipsToBounds = true
            myImageView.contentMode = .ScaleAspectFit
            myImageView.image = picture
            info = UIDateView(frame: CGRectMake(0, frame.height - 20, frame.width, 20), date: 110494)
            info!.clipsToBounds = true
            info!.backgroundColor = UIColor(red: 200, green: 250, blue: 200, alpha: 0.5)
            bringSubviewToFront(info!)
            addSubview(myImageView)
            addSubview(info!)
            self.selectionStyle = .None
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = CGRectMake(0, 0, frame.width, frame.width)
    }
    
}
