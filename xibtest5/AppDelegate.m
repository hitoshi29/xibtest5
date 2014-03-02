//
//  AppDelegate.m
//  xibtest5
//
//  Created by ohshiro on 2014/01/18.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CustomView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];*/
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // 次の2行を追加
    ViewController* topMenu = [[ViewController alloc] init];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:topMenu];
    
    // controller
    //self.deckController = [self generateControllerStack];
    //self.window.rootViewController = self.deckController;
    
    //self.viewController = [[ViewController alloc] init];
    //self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}
/*
- (IIViewDeckController*)generateControllerStack {
    // center
    CenterViewController *centerController = [[CenterViewController alloc] initWithNibName:@"CenterViewController" bundle:nil];
    
    // navigation
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:centerController];
    
    // left
    LeftViewController *leftController = [[LeftViewController alloc] initWithNibName:@"LeftViewController" bundle:nil];
    
    // deck
    IIViewDeckController* deckController =  [[IIViewDeckController alloc] initWithCenterViewController:naviController
                                                                                    leftViewController:leftController];
    deckController.rightSize = 100;
    
    return deckController;
}*/

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
