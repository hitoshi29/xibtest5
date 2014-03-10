//
//  ViewController.h
//  xibtest5
//
//  Created by ohshiro on 2014/01/18.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *helloLabel;
- (IBAction)sayHello:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *txtField;

@end
