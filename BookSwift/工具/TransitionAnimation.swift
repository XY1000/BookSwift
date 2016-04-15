//
//  TransitionAnimationViewController.swift
//  BookSwift
//
//  Created by tmp on 16/4/15.
//  Copyright © 2016年 hxy. All rights reserved.
//

import UIKit

enum transitionType : Int {
        
        case Push
        case Pop
}
class TransitionAnimation:NSObject,UIViewControllerAnimatedTransitioning {

   
    
    init(type1:transitionType) {
        
        type = type1
    }
    
    class func transitionAnimation(type:transitionType) -> TransitionAnimation {
        
        
        return TransitionAnimation(type1: type)
        
    }
  
    
    var type:transitionType!
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        return 1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        
        if self.type == transitionType.Push {
            
            self.doPushAnimation(transitionContext)
            
        }else {
            
            self.doPopAnimation(transitionContext)
        }
        
    }
    
    private func doPushAnimation(transitionContext: UIViewControllerContextTransitioning){
        
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let tempView:UIView = (fromVC?.view.snapshotViewAfterScreenUpdates(false))!
        
        tempView.frame = (fromVC?.view.frame)!
        
        let containerView = transitionContext.containerView()
        
        containerView?.addSubview((toVC?.view)!)
        containerView?.addSubview(tempView)
        
        fromVC?.view.hidden = true
        containerView?.insertSubview((toVC?.view)!, atIndex: 0)
        
        
        let point = CGPointMake(0, 0.5)
        
        tempView.frame = CGRectOffset(tempView.frame, (point.x - tempView.layer.anchorPoint.x) * tempView.frame.size.width, (point.y - tempView.layer.anchorPoint.y) * tempView.frame.size.height)
        tempView.layer.anchorPoint = point
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            
            tempView.layer.transform = CATransform3DMakeRotation(CGFloat(-M_PI_2), 0, 1, 0)
            
            }) { (finished) -> Void in
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                
                if transitionContext.transitionWasCancelled() {
                    
                    tempView.removeFromSuperview()
                    fromVC?.view.hidden = false
                }
                
        }
        
        
        print("push")
    }
    
    private func doPopAnimation(transitionContext: UIViewControllerContextTransitioning) {
        
        print("pop")
    }

    /*
    - (void)doPushAnimation:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //对tempView做动画，避免bug;
    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    tempView.frame = fromVC.view.frame;
    UIView *containerView = [transitionContext containerView];
    
    NSLog(@"大小 = %f",containerView.frame.size.width);
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempView];
    fromVC.view.hidden = YES;
    [containerView insertSubview:toVC.view atIndex:0];
    
    /*
    self.frame = CGRectOffset(self.frame, (point.x - self.layer.anchorPoint.x) * self.frame.size.width, (point.y - self.layer.anchorPoint.y) * self.frame.size.height);
    self.layer.anchorPoint = point;
    
    */
    
    [tempView setAnchorPointTo:CGPointMake(0, 0.5)];
    
    
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
    tempView.layer.transform = CATransform3DMakeRotation(-M_PI_2, 0, 1, 0);
    
    } completion:^(BOOL finished) {
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    if ([transitionContext transitionWasCancelled]) {
    [tempView removeFromSuperview];
    fromVC.view.hidden = NO;
    }
    }];
    
    
    }
    
    
    
    - (void)doPopAnimation:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    //拿到push时候的
    UIView *tempView = containerView.subviews.lastObject;
    [containerView addSubview:toVC.view];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
    tempView.layer.transform = CATransform3DIdentity;
    fromVC.view.subviews.lastObject.alpha = 1.0;
    tempView.subviews.lastObject.alpha = 0.0;
    } completion:^(BOOL finished) {
    if ([transitionContext transitionWasCancelled]) {
    [transitionContext completeTransition:NO];
    }else{
    [transitionContext completeTransition:YES];
    [tempView removeFromSuperview];
    toVC.view.hidden = NO;
    }
    }];
    
    }

    */
    
}
