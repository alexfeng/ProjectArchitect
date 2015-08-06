//
//  ViewModelClass.h
//  MVVMDemo
//
//  Created by Alex on 15/8/6.
//  Copyright (c) 2015年 CDEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"

@interface ViewModel : NSObject

@property (nonatomic, strong) ReturnValueBlock returnBlock;
@property (nonatomic, strong) ErrorCodeBlock errorBlock;
@property (nonatomic, strong) FailureBlock failureBlock;

/**
 *  获取网络的链接状态
 *
 *  @param netConnectBlock 网络链接block快
 *  @param urlString       链接的网址
 */
- (void)netWorkStateWithNetConnectBlock: (NetWorkBlock)netConnectBlock withURLString:(NSString *)urlString;

/**
 *  传入交互的block块
 *
 *  @param returnBlock  返回的block
 *  @param errorBlock   错误code的block
 *  @param failureBlock 失败的block
 */
- (void)setBlockWithReturnBlock:(ReturnValueBlock)returnBlock errorBlock:(ErrorCodeBlock)errorBlock failureBlock:(FailureBlock)failureBlock;

@end
