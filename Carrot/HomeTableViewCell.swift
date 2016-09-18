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
    var info = UIView()
    
    var picture: UIImage? {
        didSet{
            myImageView = UIImageView(frame: CGRectMake(0, 0, frame.width, frame.width))
            myImageView.clipsToBounds = true
            myImageView.contentMode = .ScaleAspectFit
            myImageView.image = picture
            info = UIView(frame: CGRectMake(0, 0, frame.width, 30))
            info.clipsToBounds = true
            info.backgroundColor = UIColor(red: 0, green: 50, blue: 70, alpha: 1)
            self.bringSubviewToFront(info)
            addSubview(myImageView)
            addSubview(info)
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
