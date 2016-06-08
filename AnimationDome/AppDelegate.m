//
//  AppDelegate.m
//  AnimationDome
//
//  Created by liangbai on 16/5/31.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import "AppDelegate.h"
#import <MMDrawerController/MMDrawerController.h>
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#import "AffineAnimationController.h"
#import "LeftViewController.h"
#import "BaseNavigationController.h"


@interface AppDelegate ()

@property(nonatomic, strong) MMDrawerController *drawerController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIViewController *leftView = [[LeftViewController alloc] init];
    UIViewController *homeView = [[AffineAnimationController alloc] init];
    
    UINavigationController *leftNVC = [[BaseNavigationController alloc] initWithRootViewController:leftView];
    UINavigationController *homeNVC = [[BaseNavigationController alloc] initWithRootViewController:homeView];
    
    self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:homeNVC leftDrawerViewController:leftNVC];
    
    self.drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    self.drawerController.maximumLeftDrawerWidth = 249;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setBackgroundColor:[UIColor clearColor]];
    [self.window setRootViewController:self.drawerController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
