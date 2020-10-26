//
//  ViewController.swift
//  SideMenuiOS
//
//  Created by Poorna Jayasinghe on 2020-10-27.
//

import UIKit

class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let transition = SlideInTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func menuPressed(_ sender: UIBarButtonItem) {
        
        let sideMenuTableViewController = storyboard!.instantiateViewController(identifier: "sideMenuTableViewController") as! SideMenuTableViewController
        sideMenuTableViewController.transitioningDelegate = self
        sideMenuTableViewController.modalPresentationStyle = .overCurrentContext
        
        sideMenuTableViewController.clickedItem = { itemNumber in
            print("Index path \(itemNumber) clicked")
            
            if itemNumber == 1 {
                self.presentViewControllerByStoryboardId(storyboardId: "messageViewController")
                return
            }
            
            if itemNumber == 2 {
                self.presentViewControllerByStoryboardId(storyboardId: "profileViewController")
                return
            }
        }
        
        self.present(sideMenuTableViewController, animated: true, completion: nil)
    }
    
    private func presentViewControllerByStoryboardId(storyboardId: String) {
        let viewController = self.storyboard!.instantiateViewController(identifier: storyboardId) as! UINavigationController
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
}

