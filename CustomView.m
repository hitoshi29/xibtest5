//
//  CustomView.m
//  xibtest5
//
//  Created by ohshiro on 2014/01/19.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UINib *nib = [UINib nibWithNibName:@"CustomView" bundle:nil];
        self = [nib instantiateWithOwner:nil options:nil][0];
        self.customTextField.text = @"プログラムで表示を変える";
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
