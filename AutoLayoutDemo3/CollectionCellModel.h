//
//  CollectionCellModel.h
//  AutoLayoutDemo3
//
//  Created by LiuYihan on 15/7/7.
//  Copyright (c) 2015年 Xiaoxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionCellModel : NSObject

@property (strong, nonatomic) UIImage *thumbnail;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *discribe;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
