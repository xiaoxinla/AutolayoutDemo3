//
//  CellModel.m
//  AutoLayoutDemo3
//
//  Created by LiuYihan on 15/7/7.
//  Copyright (c) 2015年 Xiaoxin. All rights reserved.
//

#import "TableCellModel.h"

@implementation TableCellModel

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self){
        self.image = [UIImage imageNamed:[dict valueForKey:@"icon"]];
        self.name = [dict valueForKey:@"name"];
        self.title = [dict valueForKey:@"title"];
        self.content = [dict valueForKey:@"content"];
    }
    return self;
}

@end
