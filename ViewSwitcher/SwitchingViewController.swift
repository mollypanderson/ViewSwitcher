//
//  SwitchingViewController.swift
//  ViewSwitcher
//
//  Created by Molly Anderson on 6/9/20.
//  Copyright © 2020 Molly Anderson. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        yellowViewController = storyboard?.instantiateViewController(withIdentifier: "Yellow")
            as! YellowViewController
        blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue")
            as! BlueViewController
        greenViewController = storyboard?.instantiateViewController(withIdentifier: "Green")
            as! GreenViewController
        
        yellowViewController.view.frame = view.frame
        switchViewController(from: nil, to: yellowViewController)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        if blueViewController != nil
            && blueViewController!.view.superview == nil {
            blueViewController = nil
        }
        if yellowViewController != nil
            && yellowViewController!.view.superview == nil {
            yellowViewController = nil
        }
        if greenViewController != nil
            && greenViewController!.view.superview == nil {
            greenViewController = nil
        }
        
    }
    
    private var blueViewController: BlueViewController!
    private var yellowViewController: YellowViewController!
    private var greenViewController: GreenViewController!
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        // Create the new view controller, if required
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil { yellowViewController =
                storyboard?.instantiateViewController(withIdentifier: "Yellow") as! YellowViewController
            }
        } else if greenViewController?.view.superview == nil {
            if greenViewController == nil { greenViewController =
                storyboard?.instantiateViewController(withIdentifier: "Green") as! GreenViewController
            }
        } else if blueViewController?.view.superview == nil {
            if blueViewController == nil { blueViewController =
                storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
            }
        }
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        // Switch view controllers
        if yellowViewController != nil
            && yellowViewController!.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight,
                                          for: view, cache: true)
            blueViewController.view.frame = view.frame
            switchViewController(from: yellowViewController,
                                 to: blueViewController)
        } else if blueViewController != nil
        && blueViewController!.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight,
                                          for: view, cache: true)
            greenViewController.view.frame = view.frame
            switchViewController(from: blueViewController,
                                 to: greenViewController)
        } else { UIView.setAnimationTransition(.flipFromLeft,
                                               for: view, cache: true)
            yellowViewController.view.frame = view.frame
            switchViewController(from: greenViewController,
                                 to: yellowViewController)
        }
        
        
        UIView.commitAnimations()
    }
    
    private func switchViewController(from fromVC:UIViewController?,
                                      to toVC:UIViewController?) {
        if fromVC != nil {
            fromVC!.willMove(toParent: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParent()
        }
            
        if toVC != nil {
            self.addChild(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParent: self)
        }
        
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
