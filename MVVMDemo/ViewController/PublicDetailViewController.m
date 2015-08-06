//
//  PublicDetailViewController.m
//  MVVMDemo
//
//  Created by Alex on 15/8/6.
//  Copyright (c) 2015年 CDEC. All rights reserved.
//

#import "PublicDetailViewController.h"
#import "UIKit+AFNetworking.h"

@interface PublicDetailViewController ()

@property (nonatomic, strong) IBOutlet UIImageView *headImageView;
@property (nonatomic, strong) IBOutlet UILabel *userNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) IBOutlet UITextView *textLabel;

@end

@implementation PublicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _userNameLabel.text = _publicModel.userName;
    _timeLabel.text = _publicModel.date;
    _textLabel.text = _publicModel.text;
    [_headImageView setImageWithURL:_publicModel.imageUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
