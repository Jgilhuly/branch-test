//
//  DLController.swift
//  branch-test
//
//  Created by John Gilhuly on 4/17/16.
//  Copyright © 2016 John Gilhuly. All rights reserved.
//

import Foundation
import Branch

class DLController: UIViewController, BranchDeepLinkingController {
    @IBOutlet weak var imageV: UIImageView!
    
    func configureControlWithData(data: [NSObject : AnyObject]!) {
        let pictureUrl = data["product_picture"] as! String
        print (pictureUrl)
        
        // show the picture
//        if let url = NSURL(string: pictureUrl) {
//            if let data = NSData(contentsOfURL: url) {
//                imageV.image = UIImage(data: data)
//            }        
//        }
    }
    
    var deepLinkingCompletionDelegate: BranchDeepLinkingControllerCompletionDelegate?
    func closePressed() {
        self.deepLinkingCompletionDelegate!.deepLinkingControllerCompleted()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        imageV.image = UIImage(named: "1")
    }
}