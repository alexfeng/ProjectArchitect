//
//  ViewModelClass.m
//  MVVMDemo
//
//  Created by Alex on 15/8/6.
//  Copyright (c) 2015年 CDEC. All rights reserved.
//

#import "ViewModel.h"
#import "NetRequestClass.h"

@implementation ViewModel

- (void)netWorkStateWithNetConnectBlock: (NetWorkBlock)netConnectBlock withURLString:(NSString *)urlString {
    BOOL netState = [NetRequestClass netWorkReachabilityWithURLString:urlString];
    netConnectBlock(netState);
}

- (void)setBlockWithReturnBlock:(ReturnValueBlock)returnBlock errorBlock:(ErrorCodeBlock)errorBlock failureBlock:(FailureBlock)failureBlock {
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}
@end
