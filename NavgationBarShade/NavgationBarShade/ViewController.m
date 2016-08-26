//
//  ViewController.m
//  NavgationBarShade
//
//  Created by 刘明 on 16/8/26.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "ViewController.h"
#import "TittleView.h"
#import "UINavigationBar+LMBackground.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic) CGFloat halfHeight;

@property (nonatomic, strong) TittleView *tittleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"导航栏渐变透明";
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    self.tableView = tableView;
    
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    
    _halfHeight = [UIScreen mainScreen].bounds.size.height * 0.4 - 64;

    
    [tableView setContentInset:UIEdgeInsetsMake(([UIScreen mainScreen].bounds.size.height) * 0.4 - 64, 0, 0, 0)];
    
    TittleView *tittleView = [[TittleView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 50)];
    
    self.tittleView = tittleView;
    
    [tittleView setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:tittleView];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;//导航栏的背景色是黑色, 字体为白色
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];//用于去除导航栏的底线，也就是周围的边线
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self.navigationController.navigationBar LMReset];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    UIColor *color = [UIColor colorWithRed:243/255.0 green:165/255.0 blue:39/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    
    NSLog(@"%f",offsetY);
    if (offsetY >= - _halfHeight - 64) {
        CGFloat alpha = MIN(1, (_halfHeight + 64 + offsetY)/_halfHeight);
        [self.navigationController.navigationBar LMSetBackgroundColor:[color colorWithAlphaComponent:alpha]];
        
        _tittleView.alpha = 1 - alpha;
    } else {
        
        [self.navigationController.navigationBar LMSetBackgroundColor:[color colorWithAlphaComponent:0]];
//
//        [self.navigationController.navigationBar LMSetBackgroundColor:[UIColor orangeColor]];
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    if (indexPath.item % 2 == 1) {
        
        cell.backgroundColor = [UIColor lightGrayColor];
    }else{
        
        cell.backgroundColor = [UIColor whiteColor];

    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"UITableViewCell---%zd",indexPath.item];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
