//
//  Next2ViewController.h
//  xibtest5
//
//  Created by ohshiro on 2014/01/28.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Next2ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(strong, nonatomic) IBOutlet NSArray *items;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
