//
//  CellModel.h
//  AutoLayoutDemo3
//
//  Created by LiuYihan on 15/7/7.
//  Copyright (c) 2015年 Xiaoxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableCellModel : NSObject

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *content;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
