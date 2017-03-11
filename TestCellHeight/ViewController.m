//
//  ViewController.m
//  TestCellHeight
//
//  Created by hc on 2017/3/10.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "DetailController.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *strArr;
@property (nonatomic,strong) NSArray *picArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _strArr = @[@"我们一起憧憬的客栈庭中小径旁，有绿树小花开得悠然，清晨浅热中有小鸟轻轻呢喃",
                @"我们一起憧憬的客栈庭中小径旁有绿树小花开得悠然清晨浅热中有小鸟轻轻呢喃我们一起憧憬的客栈由你来做饭我品尝咸淡客人们围成一圈扯淡酣醉欢笑如朋友一般",
                @"我们一起憧憬的客栈庭中小径旁，有绿树小花开得悠然，清晨浅热中有小鸟轻轻呢喃，我们一起憧憬的客栈由你来做饭，我品尝咸淡客人们围成一圈，扯淡酣醉欢笑如朋友一般，我们一起憧憬的客栈，面对着有微风吹皱水面的湖湾，远近的灯光懒散，庭院树下的你的旁边，有轻醺的我在甜蜜的微鼾，我们一起憧憬的客栈，你是我的另一半，我是你的另一半，我们一起憧憬的客栈，你是我甜蜜的负担，是我永远的初禅",
                @"我们一起憧憬的客栈,\n庭中小径旁，\n有绿树小花开得悠然，\n清晨浅热中有小鸟轻轻呢喃，\n我们一起憧憬的客栈,\n由你来做饭，\n我品尝咸淡客人们围成一圈，\n扯淡酣醉欢笑如朋友一般，\n我们一起憧憬的客栈，\n面对着有微风吹皱水面的湖湾，\n远近的灯光懒散，\n庭院树下的你的旁边，\n有轻醺的我在甜蜜的微鼾，\n我们一起憧憬的客栈，\n你是我的另一半，\n我是你的另一半，\n我们一起憧憬的客栈，\n你是我甜蜜的负担，\n是我永远的初禅,\n我们一起憧憬的客栈庭中小径旁，\n有绿树小花开得悠然，\n清晨浅热中有小鸟轻轻呢喃，\n我们一起憧憬的客栈由你来做饭，\n我品尝咸淡客人们围成一圈，\n扯淡酣醉欢笑如朋友一般，\n我们一起憧憬的客栈，\n面对着有微风吹皱水面的湖湾，\n远近的灯光懒散，\n庭院树下的你的旁边，\n有轻醺的我在甜蜜的微鼾，\n我们一起憧憬的客栈，\n你是我的另一半，\n我是你的另一半，\n我们一起憧憬的客栈，\n你是我甜蜜的负担，\n是我永远的初禅"];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    _picArr = @[@"pic1",@"pic2",@"pic3",@"pic4"];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    self.tableView.estimatedRowHeight = 100;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_strArr count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellStr = _strArr[indexPath.row];
    
    CGSize strSize = [cellStr boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 96, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    if (strSize.height > 66) {
        return strSize.height + 40;
    } else {
        return 86;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    cell.str.text = _strArr[indexPath.row];
    cell.pic.image = [UIImage imageNamed:[_picArr objectAtIndex:indexPath.row]];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailController *vc = [[DetailController alloc] init];
    vc.showStr = [_strArr objectAtIndex:indexPath.row];
    vc.showImage = [UIImage imageNamed:[_picArr objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
