//
//  DetailViewController.h
//  xibtest5
//
//  Created by ohshiro on 2014/02/12.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic,strong) UILabel* titleLabel;
@property (nonatomic,strong) UILabel* bodyLabel;
@property (nonatomic,strong) UIButton* btn1;

@property(strong, nonatomic) IBOutlet NSArray *items;

//外部参照用プロパティ
@property (nonatomic, retain) NSDictionary *examData;

@end
