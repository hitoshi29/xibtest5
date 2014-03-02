//
//  DetailViewController.m
//  xibtest5
//      xibを使用せずに画面を作成する
//
//  Created by ohshiro on 2014/02/12.
//  Copyright (c) 2014年 wappen. All rights reserved.
//

#import "DetailViewController.h"
#import "DefClass.h"

@interface DetailViewController (){
    UIView* cardView;
    UIView* titleView;
    NSDictionary* examData;
    UIView* footerView;
    UIView* bodyView;
    UIScrollView* scrollView;
    UIButton* btn;
}

@end

@implementation DetailViewController

//プロパティを参照するイメージ
@synthesize examData;

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

    [self cardView];
    [self getExamData];
    [self titleView];
    [self bodyView];
    [self footerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 *  サーバーからJSON形式でデータを取得
 */
- (void)getExamData
{
    //使用する時は正しいURLを使用する
    // カテゴリを引数に問題を取得するAPIを用意する
    NSURL *url = [NSURL URLWithString:@"http://chie-no-wa.info/chieappscript/exam_all_sel.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        // アプリデータの配列をプロパティに保持
        self.items = [jsonDictionary objectForKey:@"data"];
        //NSLog(@"%@",self.items);
    }];
}

/*
 *　背景を設定するメソッド
 */
- (void) cardView
{
    cardView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, 320, 400)];
    cardView.clipsToBounds = YES;
    cardView.backgroundColor = [UIColor colorWithRed:100/255.0 green:240/255.0 blue:200/255.0 alpha:0.5];
    [self.view addSubview:cardView];
}

/*
 *　タイトルを設定するメソッド
 */
- (void) titleView
{
    titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 60, 320, 50)];
    titleView.backgroundColor = [UIColor colorWithRed:160/255.0 green:240/255.0 blue:100/255.0 alpha:1.0];
    
    // 表示するコントロールを作成
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 50)];

    // DBから取得した結果をexamDataに設定する
    NSString* test = [examData objectForKey:@"category_name"];
    //NSLog(@"%@",test);
    // 文字列連結する方法
    _titleLabel.text = [NSString stringWithFormat:@"%@ %@",title,[examData objectForKey:@"category_name"]];
    
    NSArray *ar = self.items;
    for(NSDictionary *d in ar){
        NSLog(@"exam_title:%@",[d objectForKey:@"exam_title"]);
    }
    
    // titleViewにaddしたあと、titleView自体をviewにaddする
    [titleView addSubview:_titleLabel];
    [self.view addSubview:titleView];
}

/*
 *　タイトルを設定するメソッド
 */
- (void) bodyView
{
    bodyView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 430)];
    //bodyView.backgroundColor = [UIColor colorWithRed:180/255.0 green:240/255.0 blue:100/255.0 alpha:0.5];
    // 表示するコントロールを作成(表示位置を調整する)
    // 4s,5で縦の長さが異なるため、マジックナンバーとせず値を算出する
    _bodyLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 320, 320)];

    // DBから取得した結果をexamDataに設定する
    //NSString* test = [examData objectForKey:@"category_name"];
    //NSLog(@"%@",test);
    // 文字列連結する方法
    _bodyLabel.text = @"ここに本文が入ります。DBから取得した内容を表示する。今はまだApi作成中。長い文章はなるべく綺麗に表示したい。改行とか絶対必要だよね。本当はマージンとかも取ってみたいけど。なんか、UILabelのプロパティでは出来ず、カスタムビュークラスを作ると出来るらしい。次回試してみよう。しかし、色のセンスが全くないな。スクロールしない。なぜだろうか？文字数が増えれば自動改行なのか？分からないので沢山沢山沢山改訂見る。書いてみる。そう！書いてみるー！！！！！テストテストテストかな。もっと書かないと超えないかな？？？";
    // ラベルのテキストの位置を設定
    _bodyLabel.textAlignment = NSTextAlignmentLeft;
    _bodyLabel.numberOfLines = 0;
    //_bodyLabel.lineBreakMode = UILineBreakModeWordWrap;
    
    // titleViewにaddしたあと、titleView自体をviewにaddする
    [bodyView addSubview:_bodyLabel];
    
    //int size = self.view.bounds.size.height - self.navigationController.navigationBar.bounds.size.height;
    //NSLog(@"item.count=%d",size);
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 110, 320, 320)];   // titleとfootterの差分を指定する
    //scrollView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:200/255.0 alpha:0.5];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.scrollEnabled = YES;
    scrollView.contentSize = bodyView.bounds.size;
    [scrollView addSubview:bodyView];
    
    //[self.view addSubview:bodyView];
    [self.view addSubview:scrollView];
}

/*
 *　フッターを設定するメソッド
 */
- (void) footerView
{
    footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 430, 320, 50)];
    footerView.clipsToBounds = YES;
    footerView.backgroundColor = [UIColor colorWithRed:50/255.0 green:260/255.0 blue:100/255.0 alpha:1.0];
    
    [footerView addSubview:[self answerButton]];
    [self.view addSubview:footerView];
}

/*
 *　ボタンを設定するメソッド
 */
- (UIButton *) answerButton
{
    btn = [[UIButton alloc]initWithFrame:CGRectMake(90, 10, 150, 20)];
    [btn setTitle:@"クリックしてね" forState:UIControlStateNormal];
    // 左寄せ
    //btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
    
    return btn;
}

-(void)clickBtn:(UIButton*)button{
    NSLog(@"click test");
}


@end
