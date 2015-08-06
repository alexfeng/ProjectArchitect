//
//  PublicCell.h
//  MVVMDemo
//
//  Created by Alex on 15/8/6.
//  Copyright (c) 2015年 CDEC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicModel.h"

@interface PublicCell : UITableViewCell

- (void)setValueWithDic:(PublicModel *)publicModel;

@end
