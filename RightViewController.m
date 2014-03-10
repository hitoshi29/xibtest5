//
//  RightViewController.m
//  xibtest5
//
//  Created by ohshiro on 2014/03/09.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    /*self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;*/

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // CustomView.xibを読み込んで、表示する
        NSArray *rightObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomView"
                                                                 owner: self
                                                               options: nil];
        
        UIView* customView = [rightObjects objectAtIndex: 0];
        
        //貼付ける
        [self.view addSubview: customView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
