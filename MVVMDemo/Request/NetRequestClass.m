//
//  NetRequestClass.m
//  MVVMDemo
//
//  Created by Alex on 15/8/6.
//  Copyright (c) 2015年 CDEC. All rights reserved.
//

#import "NetRequestClass.h"
#import"AFNetworking.h"

@interface NetRequestClass ()

@end

@implementation NetRequestClass


+ (BOOL)netWorkReachabilityWithURLString:(NSString *)urlString {
    __block BOOL netState = NO;
    
    NSURL *baseURL = [NSURL URLWithString:urlString];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                netState = YES;
                break;
            
            case AFNetworkReachabilityStatusNotReachable:
                netState = NO;
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
    return netState;
}

+ (void)netRequestPOSTWithRequestURL:(NSString *)requestUrlString
                            parameter:(NSDictionary *)parameter
                     returnValueBlock:(ReturnValueBlock )block
                       errorCodeBlock:(ErrorCodeBlock)errorBlock
                         failureBlock:(FailureBlock)failureBlock {
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    
    AFHTTPRequestOperation *operation = [manager POST:requestUrlString parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        DDLog(@"%@",dic);
        
        block(dic);
        /***************************************
         在这做判断如果有dic里有errorCode
         调用errorBlock(dic)
         没有errorCode则调用block(dic
         ******************************/

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock();
    }];
	
    operation.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [operation start];
}

+ (void)netRequestGETWithRequestURL:(NSString *)requestUrlString
                           parameter:(NSDictionary *)parameter
                    returnValueBlock:(ReturnValueBlock )block
                      errorCodeBlock:(ErrorCodeBlock)errorBlock
                        failureBlock:(FailureBlock)failureBlock {
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    
    AFHTTPRequestOperation *operation = [manager GET:requestUrlString parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        DDLog(@"%@",dic);
        
        block(dic);
        /***************************************
         在这做判断如果有dic里有errorCode
         调用errorBlock(dic)
         没有errorCode则调用block(dic
         ******************************/
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock();
    }];
    
    operation.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [operation start];
	
}
@end
