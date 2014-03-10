//
//  ViewController.m
//  xibtest5
//
//  Created by ohshiro on 2014/01/18.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "NextViewController.h"
#import "IIViewDeckController.h"

@interface ViewController (){
    UIView *CustomView;
    UIView *CustomView2;
}

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // CustomView.xibを読み込んで、表示する
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomView"
                                                                 owner: self
                                                               options: nil];
        
        NSArray *topLevelObjects2 = [[NSBundle mainBundle] loadNibNamed:@"CustomView2"
                                                                 owner: self
                                                               options: nil];
        
        //今回はviewを生成したので、UIView* に代入
        //UIView* test = [topLevelObjects objectAtIndex: 0];
        UIView* test2 = [topLevelObjects2 objectAtIndex: 0];
        //貼付ける
        //[self.view addSubview: test];
        [self.view addSubview: test2];
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // FB風スライドメニュー実装
    UIBarButtonItem *leftBarBtnItem
    = [[UIBarButtonItem alloc] initWithTitle:@"左画面" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
    
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
    
    UIBarButtonItem *rightBarBtnItem
    = [[UIBarButtonItem alloc] initWithTitle:@"右画面" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleRightView)];
    
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sayHello:(id)sender {
    self.helloLabel.text = @"HelloWorldだぜ！！ちくしょう！";
    
    NextViewController *nextVC;
    //nextVC = [[NextViewController alloc]initWithNibName:@"NextViewController" bundle:nil];
    nextVC = [[NextViewController alloc] init];
    nextVC.message = self.txtField.text;
    
    //uiviewでの画面遷移
    //[self presentViewController:nextVC animated:YES completion:nil];

    //navigationControllerの場合の画面遷移
    [self.navigationController pushViewController:nextVC animated:YES];
}

//キーボードを消すイベント処理
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // ここにtextデータの処理
    // キーボードを閉じる
    [self.txtField resignFirstResponder];
}



@end
