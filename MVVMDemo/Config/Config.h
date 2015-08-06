//
//  Config.h
//  MVVMDemo
//
//  Created by Alex on 15/8/6.
//  Copyright (c) 2015年 CDEC. All rights reserved.
//

#ifndef MVVMDemo_Config_h
#define MVVMDemo_Config_h

#pragma mark -
#pragma mark 定义返回请求数据的block类型

typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock) ();
typedef void (^NetWorkBlock) (BOOL netConnetState);

#define DDLog(xx, ...) NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__,##__VA_ARGS__)

#define ACCESSTOKEN @"2.00NofgBD0L1k4p505b275991t6RNOB"

#pragma mark -
#pragma mark 请求公共微博的网络接口

#define REQUESTPUBLICURL @"https://api.weibo.com/2/statuses/public_timeline.json"

#define SOURCE @"source"
#define TOKEN  @"access_token"
#define COUNT  @"count"

#define STATUSES        @"statuses"
#define CREATETIME      @"created_at"
#define WEIBOID         @"id"
#define WEIBOTEXT       @"text"
#define USER            @"user"
#define UID             @"id"
#define HEADIMAGEURL    @"profile_image_url"
#define USERNAME        @"screen_name"

#endif
