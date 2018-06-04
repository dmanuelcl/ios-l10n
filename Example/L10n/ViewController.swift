//
//  ViewController.swift
//  L10n
//
//  Created by Dani Manuel Céspedes Lara on 11/26/2017.
//  Copyright (c) 2017 Dani Manuel Céspedes Lara. All rights reserved.
//

import UIKit
import L10n

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.label.text = MessagesStrings.localize(.textFromCodeExample)

        let welcomeMessage = MessagesStrings.localize(.welcomeMessage, ["Mr.", "iOS Developer"])
        print(welcomeMessage) //Will print "Welcome to use L10n Mr. iOS Developer"

        let byeMessage = MessagesStrings.localize(.byeMessage)
        print(byeMessage) //Will print "See you soon"

        let byeMessageAlt = MessagesStrings.byeMessage.localized
        print(byeMessageAlt) //Will print "See you soon"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

