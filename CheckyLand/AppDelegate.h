//
//  AppDelegate.h
//  CheckyLand
//
//  Created by Sami Shamsan on 10/28/14.
//  Copyright (c) 2014 com.Sami.CheckyLand. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@class LoginViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LoginViewController *viewController;

@end
