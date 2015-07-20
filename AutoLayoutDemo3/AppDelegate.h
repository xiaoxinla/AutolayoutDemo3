//
//  AppDelegate.h
//  AutoLayoutDemo3
//
//  Created by LiuYihan on 15/7/6.
//  Copyright (c) 2015年 Xiaoxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RootViewController *rootViewController;
@property (strong, nonatomic) UINavigationController *rootNavigationController;

@end

