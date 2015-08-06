//
//  PublicTableViewController.m
//  MVVMDemo
//
//  Created by Alex on 15/8/6.
//  Copyright (c) 2015年 CDEC. All rights reserved.
//

#import "PublicTableViewController.h"
#import "PublicWeiboViewModel.h"
#import "SVProgressHUD.h"
#import "PublicCell.h"

@interface PublicTableViewController ()

@property (nonatomic, strong) NSArray *publicModelArray;

@end

@implementation PublicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PublicWeiboViewModel *publicViewModel = [[PublicWeiboViewModel alloc] init];
    [publicViewModel setBlockWithReturnBlock:^(id returnValue) {
        [SVProgressHUD dismiss];
        _publicModelArray = returnValue;
        [self.tableView reloadData];
        DDLog(@"%@", _publicModelArray);
    } errorBlock:^(id errorCode) {
        [SVProgressHUD dismiss];
    } failureBlock:^{
        [SVProgressHUD dismiss];
    }];
    
    [publicViewModel fetchPublicWeiBo];
    
    [SVProgressHUD showWithStatus:@"正在获取用户信息" maskType:SVProgressHUDMaskTypeBlack];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger numberOfSections = 0;
    numberOfSections = 1;
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = 0;
    numberOfRows = _publicModelArray.count;
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PublicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PublicCell" forIndexPath:indexPath];
    [cell setValueWithDic:_publicModelArray[indexPath.row]];
    
    return cell;
}


#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"DEBUG: didSelectRowAtIndexPath: %@" ,indexPath);
    PublicWeiboViewModel *publicViewModel = [[PublicWeiboViewModel alloc] init];
    [publicViewModel weiboDetailWithPublicModel:_publicModelArray[indexPath.row] withViewController:self];
}

@end
