//
//  UIDateView.swift
//  Carrot
//
//  Created by Jay Chia on 18/9/16.
//  Copyright © 2016 Talha Baig. All rights reserved.
//

import UIKit

class UIDateView: UIView {
    
    init(frame: CGRect, date: Int) {
        self.date = date
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var date: Int
    var msg = UILabel(frame: CGRectMake(0, 20, 0, 20))
    

}
