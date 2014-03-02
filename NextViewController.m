//
//  NextViewController.m
//  xibtest5
//
//  Created by ohshiro on 2014/01/23.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "NextViewController.h"
#import "Next2ViewController.h"
#import "DefClass.h"

@interface NextViewController (){
    NSString *message;
}
@end

@implementation NextViewController

//プロパティを参照するイメージ
@synthesize message;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //前の画面からの文言を設定する
    self.strlabel.text = message;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * 前の画面に戻るボタン
 */
- (IBAction)btn_goback:(id)sender {
    //遷移元に戻る（uiviewの場合）
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    //遷移元に戻る（navigationControllerの場合）
    [self.navigationController popViewControllerAnimated:YES];
}

/*
 * 画面の色を変えるボタン
 */
- (IBAction)btn_change_color:(id)sender {
    UIColor *color = [UIColor colorWithRed:0.10196078431372549 green:0.7372549019607844 blue:0.611764705882353 alpha:1.0];
    self.view.backgroundColor = color;
}

/*
 * ActionSheetを呼び出すボタン
 */
- (IBAction)btn_call_actionsheet:(id)sender {
        //タイトルやボタンタイトルを指定して Action Sheet のインスタンスを作成
        //この命令のなかで delegate を指定。
        UIActionSheet *sheet =[[UIActionSheet alloc]
                               initWithTitle:@"選択してください"
                               delegate:self
                               cancelButtonTitle:@"キャンセル"
                               destructiveButtonTitle:@"画面に戻る"
                               otherButtonTitles:@"選択肢１", @"選択肢２", @"選択肢３", nil];
        
        //Action Sheet のスタイルを指定
        [sheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
        
        //表示するビューを指定して Action Sheet を表示
        [sheet showInView:self.view];
}

// actionsheetのボタンが押された時のコールバックイベント処理
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    UILabel *selectLabel = self.strlabel;
    
    switch (buttonIndex) {
        case 0:
            self.view.backgroundColor = [UIColor whiteColor];
            [selectLabel setText:strDef];
            break;
            
        case 1:
            self.view.backgroundColor = [UIColor redColor];
            [selectLabel setText:[actionSheet buttonTitleAtIndex:buttonIndex]];
            break;
            
        case 2:
            self.view.backgroundColor = [UIColor yellowColor];
            [selectLabel setText:[actionSheet buttonTitleAtIndex:buttonIndex]];
            break;
            
        case 3:
            self.view.backgroundColor = [UIColor blueColor];
            [selectLabel setText:[actionSheet buttonTitleAtIndex:buttonIndex]];
            break;
            
        default:
            break;
    }
}


/*
 * labelの文言を変更するボタン
 */
- (IBAction)btn_change_label:(id)sender {
    self.strlabel.text = @"ちゃんとボタン押されたよ！！";
}

/*
 * 次の画面へ遷移するボタン
 */
- (IBAction)btn_go_nextview:(id)sender {
    //UIViewController *con = [[Next2ViewController alloc] init];
    //UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:con];
    //Next2ViewController *tableView = [[Next2ViewController alloc] initWithNibName:@"Next2ViewController" bundle:nil];
    //[self presentViewController:tableView animated:YES completion:nil];
    
    Next2ViewController *tableView = [[Next2ViewController alloc] init];
    [self.navigationController pushViewController:tableView animated:YES];
}
@end
