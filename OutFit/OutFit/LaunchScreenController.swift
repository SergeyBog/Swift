//
//  LaunchScreenController.swift
//  OutFit
//
//  Created by Sergey Bohachenko on 21.06.2020.
//  Copyright © 2020 Sergey Bohachenko. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController {

    
    @IBOutlet weak var loadingLabel: UILabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2.0, animations: {
            self.loadingLabel.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.size.height)
            self.view.backgroundColor=UIColor.systemGray
        })
            
    }
}

        
    
    

  

