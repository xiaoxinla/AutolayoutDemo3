//
//  ViewController.m
//  AutoLayoutDemo3
//
//  Created by LiuYihan on 15/7/6.
//  Copyright (c) 2015年 Xiaoxin. All rights reserved.
//

#import "RootViewController.h"
#import "TableCell.h"
#import "CollectionViewController.h"

@interface RootViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.tableView = [[UITableView alloc] init];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.title = @"Table";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Collection" style:UIBarButtonItemStylePlain target:self action:@selector(jumpToCollection)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self setupData];
    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViews{
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
}

- (void)setupData {
    NSDictionary *dic1 = @{@"icon":@"pic1",@"name":@"jax",@"title":@"what fuck",@"content":@"cojawfoasjdfowejowjefoawoef"};
    NSDictionary *dic2 = @{@"icon":@"pic2",@"name":@"jaxwoifjaowiejowajfeoeofjowaejfojwaefojweaojfowejfoawjefoewfoowaejfoawef",@"title":@"what fuckwefjoiwfjawejifoawejfoijweaofjoaewjfojfoewjfoajwfoajfowajfawieoiew",@"content":@"cojawfoasjdfowejowjefoawoefwefjowejfawiojefoiwaeofijaojwiefjoiawjeifoiwfeajoiwefoijwfoijfewjoifwiejo"};
    NSDictionary *dic3 = @{@"icon":@"pic3",@"name":@"jax啊搜附近问哦金佛文件佛阿尔法鸡尾酒",@"title":@"what fuckwjefoiwejfoewjfoiewfjm.xmvoiavm收到了吗服务冷风",@"content":@"cojawfoasjdfowejowjefoawoef坡脚为佛泾渭分明怎么sdfm.mxcwoeo。什么。村民续完了看我快睡着了昆明V迷罗马拉开门位OMS吗fosajfaweijofjoawasdvxzc.v失联飞机啊我分解为福建是在浪费Joe无附件为福建啊我"};
    self.dataArray = @[dic1,dic2,dic3];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"cellIdentifier";
    TableCell *tableCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!tableCell){
        tableCell = [[TableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [self configureCell:tableCell atIndexPath:indexPath];
    return tableCell;
}

- (void)configureCell:(TableCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row % 3;
    NSDictionary *data = self.dataArray[row];
    TableCellModel *cellModel = [[TableCellModel alloc] initWithDictionary:data];
    cell.cellModel = cellModel;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"cellIdentifier";
    static TableCell *cell = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell){
            cell = [[TableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
    });
    [self configureCell:cell atIndexPath:indexPath];
    
    return [self calculateHeightForCell:cell];
}
/*
 *调用calculateHeightForCell:计算cell的高度，先调用setNeedsLayout和layoutIfNeeded让cell去布局子视图，然后调用systemLayoutSizeFittingSize:让AutoLayout系统去计算大小, 参数UILayoutFittingCompressedSize的意思是告诉AutoLayout系统使用尽可能小的尺寸以满足约束，返回的结果里+1.0f是分割线的高度
 */
- (CGFloat)calculateHeightForCell:(TableCell *)cell {
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1;
}

- (void)jumpToCollection{
    CollectionViewController *collectionViewController = [[CollectionViewController alloc] init];
    [self.navigationController pushViewController:collectionViewController animated:YES];
}


@end
