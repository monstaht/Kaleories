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
        let dd = String(date/10000)
        let yy = String(date%100)
        let mm = String((date%10000)/100)
        msg = UILabel(frame: CGRect(x: 10, y: 0, width: frame.width, height: 40))
        self.msg.text = dd + "/" + mm + "/" + yy
        super.init(frame: frame)
        self.addSubview(msg)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var date: Int
    let msg: UILabel
    

}
