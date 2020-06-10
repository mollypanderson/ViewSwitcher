//
//  GreenViewController.swift
//  ViewSwitcher
//
//  Created by Molly Anderson on 6/9/20.
//  Copyright © 2020 Molly Anderson. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func greenButtonPressed(sender: UIButton) {
           let alert = UIAlertController(title: "Green View Button Pressed",
                                           message: "You pressed the button on the green view",
                                           preferredStyle: .alert)
       let action = UIAlertAction(title: "Yes, I did", style: .default,
                                      handler: nil)
       alert.addAction(action)
           present(alert, animated: true, completion: nil)
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
