//
//  AppDelegate.h
//  syncApp
//
//  Created by Gaurav Amrutiya on 18/07/18.
//  Copyright © 2018 Gaurav Amrutiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

