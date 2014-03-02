//
//  DefClass.h
//  xibtest5
//
//  Created by ohshiro on 2014/01/26.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import <Foundation/Foundation.h>

// defineで定数を定義
//#define CONST_NUM_INT 100
//#define CONST_NUM_FLOAT 3.14
#define CONST_STRING @"定数クラスを呼び出し"

@interface DefClass : NSObject

// constで定数を定義（ヘッダーファイル）
//extern const int kNumInt;
//extern const float kNumFloat;
extern NSString* const strDef;
extern NSString* const title;

@end
