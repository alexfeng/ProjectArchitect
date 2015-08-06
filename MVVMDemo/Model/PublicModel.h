//
//  PublicModel.h
//  MVVMDemo
//
//  Created by Alex on 15/8/6.
//  Copyright (c) 2015年 CDEC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicModel : NSObject

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *weiboId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSURL *imageUrl;

@end
