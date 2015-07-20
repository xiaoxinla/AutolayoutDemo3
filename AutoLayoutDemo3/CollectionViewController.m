//
//  CollectionViewController.m
//  AutoLayoutDemo3
//
//  Created by LiuYihan on 15/7/7.
//  Copyright (c) 2015年 Xiaoxin. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionCell.h"

@interface CollectionViewController ()

@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) UICollectionView *collectionView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"Collection";
    [self setupData];
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupData {
    NSDictionary *dic1 = @{@"image":@"pic4",@"author":@"ojjwofjaowjfoafoajefoaw",@"discribe":@"aoijfawoejfawofelksdfkldffdklzdmslkvdsz"};
    NSDictionary *dic2 = @{@"image":@"pic5",@"author":@"sfefoizcwoir3szfmwo3a.zpq3j",@"discribe":@"23rjfowekfmkawmfwfealmfwkfmlkWMFOKM2OMFOQJMTGDFKOMLDSIMV.XKMVKLDFMGOI3GMAOIGMAOIGMAODSIMGOImlsdmgsr"};
    NSDictionary *dic3 = @{@"image":@"pic6",@"author":@"没沉默佛额外缴费你在哪个ie",@"discribe":@"n哦啊费哦呜发我倪泽额ufinqiewf字符new泽肤ia"};
    NSDictionary *dic4 = @{@"image":@"pic7",@"author":@"哦我iajfawoiefjajfoaiwjiofwoiafjao爱违法iwawfhin你vuwnae按覅额外部分爱ufhaweafhiw 哈我覅无法挨罚iwfnavina爱抚你问iawufhawif阿发iwn",@"discribe":@"哦iwejfoawjfmiozsaifoiawjfgaiuawng老子V迷这里在vnaga 啊啊个给那位哥这个了怎么总，新农保何荣噶发现你是个"};
    self.dataArray = @[dic1,dic2,dic3,dic4];
}

- (void)setupView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"CollectionCell";
    CollectionCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    if (!collectionCell) {
        collectionCell = [[CollectionCell alloc] init];
    }
    [self configCell:collectionCell AtIndexpath:indexPath];
    return collectionCell;
};

- (void)configCell:(CollectionCell *)cell AtIndexpath:(NSIndexPath *)indexpath {
    NSInteger row = indexpath.row % 4;
    NSDictionary *data = self.dataArray[row];
    CollectionCellModel *model = [[CollectionCellModel alloc] initWithDictionary:data];
    cell.model = model;
    [cell setBackgroundColor:[UIColor greenColor]];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 60;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width/2-10, 200);
}

@end
