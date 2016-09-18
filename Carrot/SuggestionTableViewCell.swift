//
//  SuggestionTableViewCell.swift
//  Carrot
//
//  Created by Talha Baig on 9/18/16.
//  Copyright © 2016 Talha Baig. All rights reserved.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {

    var suggestionName: String? {
        didSet{
            textLabel?.text = suggestionName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // let stepper = UIStepper(frame: CGRectMake(self.frame.midX, self.frame.midY, )
      //  stepper.center = CGPointMake(self.frame.midx + 150, self.frame.y  + 20)
        
    }
    
   // }

  //  override func setSelected(selected: Bool, animated: Bool) {
    //    super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    //}

}
