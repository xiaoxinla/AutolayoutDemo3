//
//  CollectionCell.m
//  AutoLayoutDemo3
//
//  Created by LiuYihan on 15/7/7.
//  Copyright (c) 2015年 Xiaoxin. All rights reserved.
//

#import "CollectionCell.h"

@interface CollectionCell()

@property (strong, nonatomic) UIImageView *thumbnailImage;
@property (strong, nonatomic) UILabel *authorLabel;
@property (strong, nonatomic) UILabel *discribeLabel;

@end

@implementation CollectionCell


- (void)setModel:(CollectionCellModel *)model {
    _model = model;
    [self.thumbnailImage setImage:model.thumbnail];
    [self.authorLabel setText:model.author];
    [self.discribeLabel setText:model.discribe];
}

@end
