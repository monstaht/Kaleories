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
            myImageView.clipsToBounds = true
            myImageView.contentMode = .ScaleAspectFill
            myImageView.frame = CGRectMake(0, 0, frame.width, frame.height)
            myImageView.image = picture
            info = UIDateView(frame: CGRectMake(0, frame.height-80, frame.width, 40), date: 110494)
            info!.clipsToBounds = true
            info!.backgroundColor = UIColor(red: 150, green: 250, blue: 150, alpha: 0.5)
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
    }
    
}
