//
//  TableCellTableViewCell.m
//  AutoLayoutDemo3
//
//  Created by LiuYihan on 15/7/7.
//  Copyright (c) 2015年 Xiaoxin. All rights reserved.
//

#import "TableCell.h"

@interface TableCell()

@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *contentLabel;

@end

@implementation TableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupViews];
        [self setupConstraint];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupViews{
    self.iconImageView = [[UIImageView alloc] init];
    self.nameLabel = [[UILabel alloc] init];
    self.titleLabel = [[UILabel alloc] init];
    self.contentLabel = [[UILabel alloc] init];
    
    self.iconImageView.layer.cornerRadius = 15.0f;
    self.iconImageView.layer.masksToBounds = YES;
    
    CGFloat prefferedWidth = [UIScreen mainScreen].bounds.size.width - 60;
    
    self.nameLabel.numberOfLines = 1;
    self.nameLabel.preferredMaxLayoutWidth = prefferedWidth;    //告诉Autolayout系统，label的最大宽度，便于计算高度
    self.nameLabel.textColor = [UIColor grayColor];
    
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.preferredMaxLayoutWidth = prefferedWidth;
    
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.preferredMaxLayoutWidth = prefferedWidth;
    
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
}

- (void)setupConstraint{
    float padding = 15.0f;
    [self.iconImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(padding);
        make.right.equalTo(self.nameLabel.left).offset(-padding);
        make.left.equalTo(self.contentView).offset(padding);
        make.size.equalTo(CGSizeMake(30, 30));
    }];
    
    [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(padding).priority(752);   //设置优先级，当遇到无法同时满足的约束时，会优先选择优先级高的约束
        make.right.equalTo(self.contentView).offset(-padding);
    }];
    
    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.bottom).offset(padding);
        make.right.equalTo(self.nameLabel);
        make.left.equalTo(self.iconImageView);
    }];
    
    [self.contentLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.bottom).offset(padding);
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.titleLabel);
        make.bottom.equalTo(self.contentView).offset(-padding).priority(749);
    }];
}

- (void)setCellModel:(TableCellModel *)cellModel{
    _cellModel = cellModel;
    [self.iconImageView setImage:cellModel.image];
    [self.nameLabel setText:cellModel.name];
    [self.titleLabel setText:cellModel.title];
    [self.contentLabel setText:cellModel.content];
}

@end
