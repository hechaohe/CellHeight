//
//  DetailController.m
//  TestCellHeight
//
//  Created by hc on 2017/3/11.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "DetailController.h"

@interface DetailController ()
@property(strong,nonatomic)UIWindow *window;
@property(strong,nonatomic)UIButton *button;
@end

@implementation DetailController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setStatusBarBackgroundColor:[UIColor whiteColor]];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self setStatusBarBackgroundColor:[UIColor clearColor]];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Celll"];
    
    
    [self performSelector:@selector(createButton) withObject:nil afterDelay:1];

    
}
- (void)createButton
{
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"哈哈" forState:UIControlStateNormal];
    _button.frame = CGRectMake(0, 0, 80, 80);
    [_button addTarget:self action:@selector(resignWindow) forControlEvents:UIControlEventTouchUpInside];
    _window = [[UIWindow alloc]initWithFrame:CGRectMake(100, [UIScreen mainScreen].bounds.size.height - 80, 80, 80)];
    _window.windowLevel = UIWindowLevelAlert+1;
    _window.backgroundColor = [UIColor redColor];
    _window.layer.cornerRadius = 40;
    _window.layer.masksToBounds = YES;
    [_window addSubview:_button];
    [_window makeKeyAndVisible];//关键语句,显示window
    
}
- (void)resignWindow
{
    NSLog(@"haha");
    [_window resignKeyWindow];
    _window = nil;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Celll"];
    cell.backgroundColor = [UIColor brownColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}
//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
@end
