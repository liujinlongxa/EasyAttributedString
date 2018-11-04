//
//  ViewController.swift
//  EasyAttributedString
//
//  Created by liujinlongxa on 11/02/2018.
//  Copyright (c) 2018 liujinlongxa. All rights reserved.
//

import UIKit
import EasyAttributedString

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = """
        We have not one, not two, but three exciting new books for you this season: Machine Learning by Tutorials, Push Notifications by Tutorials, and Advanced iOS App Architecture! We think you’ll really enjoy what we have planned for these books. Read on below to see what’s in store for you!
        We have not one, not two, but three exciting new books for you this season: Machine Learning by Tutorials, Push Notifications by Tutorials, and Advanced iOS App Architecture! We think you’ll really enjoy what we have planned for these books. Read on below to see what’s in store for you!
        """
        label.attributedText = text.eas
            .font(UIFont.systemFont(ofSize: 18))
            .foregroundColor(UIColor.red)
            .backgroundColor(UIColor.green)
            .ligature(0)
            .kern(2)
            .lineSpacing(5, range: NSRange(location: 0, length: 20))
            .paragraphSpacing(10)
            .alignment(.center)
            .headIndent(10, range: NSRange(location: 0, length: 10))
            .attributedString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

