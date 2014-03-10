//
//  AppDelegate.h
//  xibtest5
//
//  Created by ohshiro on 2014/01/18.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h" // 追加
#import "IIViewDeckController.h"
#import "LeftViewController.h" // 左側スライド画面
#import "RightViewController.h" // 右側スライド画面

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController; // 追加



@end
