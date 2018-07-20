//
//  ViewController.h
//  syncApp
//
//  Created by Gaurav Amrutiya on 18/07/18.
//  Copyright © 2018 Gaurav Amrutiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+SimpleKVO.h"
#import <RealReachability/RealReachability.h>

@interface ViewController : UIViewController

-(void)reachablityDidChanged:(NSNotification *)noti;

@end

