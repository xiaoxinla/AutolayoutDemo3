//
//  CollectionCellModel.m
//  AutoLayoutDemo3
//
//  Created by LiuYihan on 15/7/7.
//  Copyright (c) 2015年 Xiaoxin. All rights reserved.
//

#import "CollectionCellModel.h"

@implementation CollectionCellModel

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        self.thumbnail = [UIImage imageNamed:dict[@"thumbnail"]];
        self.author = dict[@"author"];
        self.discribe = dict[@"discribe"];
    }
    return self;
}

@end
