//
//  PublicWeiboViewModel.h
//  MVVMDemo
//
//  Created by Alex on 15/8/6.
//  Copyright (c) 2015年 CDEC. All rights reserved.
//

#import "ViewModel.h"
#import "PublicModel.h"
#import <UIKit/UIKit.h>

@interface PublicWeiboViewModel : ViewModel

/**
 *  获取微博列表
 */
- (void)fetchPublicWeiBo;

/**
 *  跳转到微博详情页
 *
 *  @param publicModel     公共Model
 *  @param superController 显示viewController
 */
- (void)weiboDetailWithPublicModel:(PublicModel *)publicModel withViewController:(UIViewController *)superController;
@end
