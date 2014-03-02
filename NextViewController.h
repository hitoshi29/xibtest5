//
//  NextViewController.h
//  xibtest5
//
//  Created by ohshiro on 2014/01/23.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextViewController : UIViewController <UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UIView *view;

- (IBAction)btn_goback:(id)sender;
- (IBAction)btn_change_color:(id)sender;
- (IBAction)btn_call_actionsheet:(id)sender;
- (IBAction)btn_change_label:(id)sender;
- (IBAction)btn_go_nextview:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *strlabel;

//外部参照用プロパティ
@property (nonatomic, retain) NSString *message;

@end
