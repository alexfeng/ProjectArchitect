//
//  PublicCell.m
//  MVVMDemo
//
//  Created by Alex on 15/8/6.
//  Copyright (c) 2015年 CDEC. All rights reserved.
//

#import "PublicCell.h"
#import "UIKit+AFNetworking.h"


@interface PublicCell ()

@property (nonatomic, strong) IBOutlet UILabel *userName;
@property (nonatomic, strong) IBOutlet UILabel *date;
@property (nonatomic, strong) IBOutlet UIImageView *headImageView;
@property (nonatomic, strong) IBOutlet UITextView *weiboText;

@end

@implementation PublicCell

- (void)setValueWithDic:(PublicModel *)publicModel {
    _userName.text = publicModel.userName;
    _date.text = publicModel.date;
    _weiboText.text = publicModel.text;
    [_headImageView setImageWithURL:publicModel.imageUrl];
}

- (void) setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
