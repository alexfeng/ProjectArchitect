//
//  NetRequestClass.h
//  MVVMDemo
//
//  Created by Alex on 15/8/6.
//  Copyright (c) 2015年 CDEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"

@interface NetRequestClass : NSObject

#pragma mark -
#pragma mark 检测网络是否可达

+ (BOOL)netWorkReachabilityWithURLString:(NSString *)urlString;

#pragma mark -
#pragma mark POST 请求

+ (void)netRequestPOSTWithRequestURL:(NSString *)requestUrlString
                            parameter:(NSDictionary *)parameter
                     returnValueBlock:(ReturnValueBlock )block
                       errorCodeBlock:(ErrorCodeBlock)errorBlock
                         failureBlock:(FailureBlock)failureBlock;

#pragma mark -
#pragma mark GET 请求

+ (void)netRequestGETWithRequestURL:(NSString *)requestUrlString
                           parameter:(NSDictionary *)parameter
                    returnValueBlock:(ReturnValueBlock )block
                      errorCodeBlock:(ErrorCodeBlock)errorBlock
                        failureBlock:(FailureBlock)failureBlock;


@end
