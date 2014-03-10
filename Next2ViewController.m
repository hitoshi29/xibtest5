//
//  Next2ViewController.m
//  xibtest5
//
//  Created by ohshiro on 2014/01/28.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "Next2ViewController.h"
#import "DetailViewController.h"

@interface Next2ViewController (){
    // クラス拡張
    // ヘッダーファイル側で公開したくないインスタンス変数やプロパティ、メソッドの宣言に使うようです
    UITableView *cardTableView;
    DetailViewController *detailView;
    MKMapView* _mapView;
}
@end

@implementation Next2ViewController

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
    
    // 空の配列を用意
    self.items = [NSArray array];

    //[self cardTableView];
    
    // TableViewに表示するデータをサーバーから取得
    [self getJSON];
    
    // これがないと値が表示されない
    self.tableView.dataSource = self;
    // これがないとセルクリックイベントが呼び出されない
    self.tableView.delegate = self;
    
    // 事前にセルを登録する
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.allowsSelectionDuringEditing = YES;
    self.tableView.backgroundColor = [UIColor colorWithRed:180/255.0 green:240/255.0 blue:120/255.0 alpha:0.3];
    
    // Uncomment the following line to preserve selection between presentations.
    //self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // スワイプジェスチャーを作成して、登録する。
    UISwipeGestureRecognizer *swipe
    = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    // スワイプの方向は右方向を指定する。
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    // スワイプ動作に必要な指は1本と指定する。
    swipe.numberOfTouchesRequired = 1;
    [self.tableView addGestureRecognizer:swipe];
    
    //_mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 10, 320, 100)];
    //[self.mapView addSubview:_mapView];

}

- (void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 *  サーバーからJSON形式でデータを取得
 */
- (void)getJSON
{
    //使用する時は正しいURLを使用する
    NSURL *url = [NSURL URLWithString:@"http://chie-no-wa.info/chieappscript/category_sel.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        // アプリデータの配列をプロパティに保持
        self.items = [jsonDictionary objectForKey:@"data"];
        
        // TableView をリロード
        [self.tableView reloadData];
    }];
}

/*
 *　tableviewの背景を設定するメソッド
 */
- (void) cardTableView
{
    cardTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, 320, 400)];
    cardTableView.clipsToBounds = NO;
    cardTableView.backgroundColor = [UIColor colorWithRed:100/255.0 green:240/255.0 blue:200/255.0 alpha:0.2];
    cardTableView.dataSource = self;
    cardTableView.delegate = self;
    cardTableView.rowHeight = 175;
    cardTableView.allowsSelection = NO;
    cardTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:cardTableView];
}

// スワイプされた際に呼び出される処理。
// NavigationViewで、現在の画面から一つ前の画面に戻る。
-(void)swipe:(UISwipeGestureRecognizer *)gesture {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    NSLog(@"section");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // セルに表示するアイテム数に修正
    NSLog(@"item.count=%d",[self.items count]);
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //[self performSegueWithIdentifier:@"detail" sender:self];
    
    // セルの各行にアイテムの行番号目のデータを設定
    NSDictionary *item = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = [item objectForKey:@"category_name"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
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
    // テーブルを更新
    [self.tableView reloadData];
    
    for (NSInteger index=0; index<[self.tableView numberOfRowsInSection:0]; index++) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
        // ①選択したセルだけチェックする
        if (indexPath.row == index) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    
    detailView = [[DetailViewController alloc] init];
    detailView.examData = [self.items objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detailView animated:YES];
}



@end
