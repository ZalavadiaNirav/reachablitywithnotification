//
//  ViewController.m
//  syncApp
//
//  Created by Gaurav Amrutiya on 18/07/18.
//  Copyright © 2018 Gaurav Amrutiya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachablityDidChanged:) name:kRealReachabilityChangedNotification object:nil];
    
//    GLobalRealReachability.hostForPing = @"www.apple.com";
//    GLobalRealReachability.hostForCheck = @"www.youOwnHostExample.com";
    
    ReachabilityStatus status = [GLobalRealReachability currentReachabilityStatus];
    NSLog(@"Initial reachability status:%@",@(status));
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
}

-(void)reachablityDidChanged:(NSNotification *)noti
{
    RealReachability *objReach=(RealReachability *)[noti object];
    ReachabilityStatus status = [objReach currentReachabilityStatus];
    ReachabilityStatus previousStatus = [objReach previousReachabilityStatus];

    NSLog(@"currentStatus:%@ previousStatus:%@",@(status),@(previousStatus));
    
//    [self setupFlagLabelWithStatus:status
//                        accessType:[GLobalRealReachability currentWWANtype]];
}

- (void)setupFlagLabelWithStatus:(ReachabilityStatus)status
                      accessType:(WWANAccessType)accessType
{
    NSMutableString *labelStr = [@"" mutableCopy];
    
    switch (status)
    {
        case RealStatusNotReachable:
        {
            [labelStr appendString:@"Network unreachable! "];
            break;
        }
            
        case RealStatusViaWiFi:
        {
            [labelStr appendString:@"Network wifi! "];
            break;
        }
            
        case RealStatusViaWWAN:
        {
            [labelStr appendString:@"WWAN in charge! "];
            break;
        }
            
        case RealStatusUnknown:
        {
            [labelStr appendString:@"Unknown status! Needs debugging! "];
            break;
        }
            
        default:
        {
            [labelStr appendString:@"Status error! Needs debugging! "];
            break;
        }
    }
    NSLog(@"reachable by=%@",labelStr);
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
