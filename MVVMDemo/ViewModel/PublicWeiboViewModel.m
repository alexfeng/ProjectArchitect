//
//  PublicWeiboViewModel.m
//  MVVMDemo
//
//  Created by Alex on 15/8/6.
//  Copyright (c) 2015年 CDEC. All rights reserved.
//

#import "PublicWeiboViewModel.h"
#import "NetRequestClass.h"
#import "PublicDetailViewController.h"

@implementation PublicWeiboViewModel

- (void)fetchPublicWeiBo {
    NSDictionary *parameter = @{TOKEN:ACCESSTOKEN,
                                COUNT:@"100"
                                };
    
    [NetRequestClass netRequestGETWithRequestURL:REQUESTPUBLICURL parameter:parameter returnValueBlock:^(id returnValue) {
        DDLog(@"%@", returnValue);
        [self fetchValueSuccessWithDic:returnValue];
    } errorCodeBlock:^(id errorCode) {
        DDLog(@"%@",errorCode);
        [self errorCodeWithDic:errorCode];
    } failureBlock:^{
        [self netFailure];
        DDLog(@"网络异常");
    }];
}


- (void)fetchValueSuccessWithDic:(NSDictionary *)returnValue {
    NSArray *statuses = returnValue[STATUSES];
    
    NSMutableArray *publicModelArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
    
    for (NSUInteger i = 0; i < statuses.count; i++) {
        PublicModel *publicModel = [[PublicModel alloc] init];
        
        // 设置时间
        NSDateFormatter *iosDataFormater = [[NSDateFormatter alloc] init];
        iosDataFormater.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
        
        // 必须设置，否则无法解析
        iosDataFormater.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        NSDate *date = [iosDataFormater dateFromString:statuses[i][CREATETIME]];
        
        // 目的格式
        NSDateFormatter *resultFormatter = [[NSDateFormatter alloc] init];
        [resultFormatter setDateFormat:@"MM月dd日 HH:mm"];
        
        publicModel.date = [resultFormatter stringFromDate:date];
        publicModel.userName = statuses[i][USER][USERNAME];
        publicModel.text = statuses[i][WEIBOTEXT];
        publicModel.imageUrl = [NSURL URLWithString:statuses[i][USER][HEADIMAGEURL]];
        publicModel.userId = statuses[i][USER][UID];
        publicModel.weiboId = statuses[i][WEIBOID];
        
        [publicModelArray addObject:publicModel];
        
    }
    
    self.returnBlock(publicModelArray);
}

- (void)errorCodeWithDic:(NSDictionary *)errorDic {
    self.errorBlock(errorDic);
}

- (void)netFailure {
    self.failureBlock();
}

- (void)weiboDetailWithPublicModel:(PublicModel *)publicModel withViewController:(UIViewController *)superController {
    DDLog(@"%@,%@,%@",publicModel.userId,publicModel.weiboId,publicModel.text);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    PublicDetailViewController *detailController = [storyboard instantiateViewControllerWithIdentifier:@"PublicDetailViewController"];
    detailController.publicModel = publicModel;
    [superController.navigationController pushViewController:detailController animated:YES];
}

@end
