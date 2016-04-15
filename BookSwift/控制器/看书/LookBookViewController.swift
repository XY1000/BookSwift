//
//  LookBookViewController.swift
//  BookSwift
//
//  Created by tmp on 16/4/15.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit



class LookBookViewController: UIViewController, UINavigationControllerDelegate{

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        
        if operation == UINavigationControllerOperation.Push {
            
         return TransitionAnimation.transitionAnimation(transitionType.Push)
           
        }else {
            
            return TransitionAnimation.transitionAnimation(transitionType.Pop)
        }
        
       
    }
    
   
}

