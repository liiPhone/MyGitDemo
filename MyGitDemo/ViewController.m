//
//  ViewController.m
//  MyGitDemo
//
//  Created by liquan on 2017/10/31.
//  Copyright © 2017年 liquan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic)UITableView *tabelView;
@property(nonatomic,strong)UILabel *titleLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    NSLog(@"%@",NSStringFromCGRect(statusBarFrame));
    [self.view addSubview:self.tabelView];
    [self.tabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
    
    UIButton *leftButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftButton setTitle:@"左按钮大家" forState:UIControlStateNormal];
    
    [leftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightButton setTitle:@"右按钮" forState:UIControlStateNormal];
    
    [rightButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.titleView = self.titleLabel;
   // AdjustsScrollViewInsetNever(self, self.tabelView);
    
}

-(UITableView *)tabelView{
    if (!_tabelView) {
        _tabelView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tabelView.delegate = self;
        _tabelView.dataSource = self;
        //_tabelView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0,0,0,CGFLOAT_MIN)];
        _tabelView.estimatedRowHeight = 0;
        _tabelView.estimatedSectionHeaderHeight = 0;
        _tabelView.estimatedSectionFooterHeight = 0;
        
        [_tabelView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

        
    }
    return _tabelView;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.text = @"这个标题\n有点长";
        _titleLabel.textAlignment  = NSTextAlignmentCenter;
        _titleLabel.numberOfLines= 0;
        _titleLabel.backgroundColor = [UIColor orangeColor];
        _titleLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTitle)];
        [_titleLabel addGestureRecognizer:tap];
    }
    return _titleLabel;
}
-(void)clickTitle{
    NSLog(@"点击了标题");
}
-(void)viewSafeAreaInsetsDidChange{
    [super viewSafeAreaInsetsDidChange];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"这是tableView的测试";
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
