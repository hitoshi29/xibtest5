//
//  LeftViewController.m
//  xibtest5
//
//  Created by ohshiro on 2014/03/09.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // セルに表示するアイテム数に修正
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //[self performSegueWithIdentifier:@"detail" sender:self];
    
    // セルの各行にアイテムの行番号目のデータを設定
    //NSDictionary *item = [self.items objectAtIndex:indexPath.row];
    //cell.textLabel.text = [item objectForKey:@"category_name"];
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //testcardviewを汎用的に別クラスで作成する。
    //例えば、testcardview画面にボタンを配置して、tagにindexを設定する。
    //これで遷移したときに、どの問題なのか把握できる。
    //testcardview.titlebtn.tag = indexpath.row;
    
    //[cell.contentView addSubview:testcardview];
    
    return cell;
}

/*
 *  セルを選択したときに呼ばれるメソッド
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 左メニューを閉じる
    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
        NSLog(@"leftclose");
        // 閉じるアニメーション完了時の処理
        // メインビュー側での処理等を行う
    }];
}


@end
