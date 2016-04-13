//
//  ViewController.swift
//  branch-test
//
//  Created by John Gilhuly on 4/11/16.
//  Copyright © 2016 John Gilhuly. All rights reserved.
//

import UIKit
import Branch

class ViewController: UIViewController {

    
    @IBOutlet weak var linkField: UITextField!
    @IBOutlet weak var createLink: UIButton!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var desktopURLField: UITextField!
    @IBOutlet weak var prop1Field: UITextField!
    @IBOutlet weak var iosURLField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createLink(sender: AnyObject) {
        let branchUniversalObject: BranchUniversalObject = BranchUniversalObject(canonicalIdentifier: "item/12345")
        branchUniversalObject.title = "My Content Title"
        branchUniversalObject.contentDescription = "My Content Description"
        branchUniversalObject.imageUrl = "https://example.com/mycontent-12345.png"
        branchUniversalObject.addMetadataKey("property1", value: "blue")
        branchUniversalObject.addMetadataKey("property2", value: "red")
        
        let linkProperties: BranchLinkProperties = BranchLinkProperties()
        linkProperties.feature = "sharing"
        linkProperties.channel = "facebook"
        linkProperties.addControlParam("$desktop_url", withValue: "http://example.com/home")
        linkProperties.addControlParam("$ios_url", withValue: "http://example.com/ios")
        
        if titleField.text != nil {
            branchUniversalObject.title = titleField.text
        }
        if descriptionField.text != nil {
            branchUniversalObject.contentDescription = descriptionField.text
        }
        if prop1Field.text != nil {
            branchUniversalObject.addMetadataKey("property1", value: prop1Field.text)
        }
        if iosURLField.text != nil {
            linkProperties.addControlParam("$ios_url", withValue: iosURLField.text)
        }
        if desktopURLField.text != nil {
            linkProperties.addControlParam("$desktop_url", withValue: desktopURLField.text)
        }
        
        branchUniversalObject.getShortUrlWithLinkProperties(linkProperties,  andCallback: { (url: String?, error: NSError?) -> Void in
            if error == nil {
                print("got my Branch link to share: %@", url)
                self.linkField.text = url
            }
        })
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

