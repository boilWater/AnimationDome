//
//  LeftViewController.m
//  AnimationDome
//
//  Created by liangbai on 16/6/2.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import "LeftViewController.h"
#import "Animation-PrefixHeader.pch"
#import "CALayerView/CALayerViewController.h"
#import "ViewController.h"
#import <MMDrawerController/MMDrawerController.h>
#import <MMDrawerController/UIViewController+MMDrawerController.h>

@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [NSArray arrayWithObjects:@"View Animation",@"CALayer Animation", nil];
    
    [self initView];
    [self initTableView];
}
-(void)initView
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 249, UISCREEN_HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *indentifier = @"left_cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    cell.textLabel.text = _array[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *controller;
    switch (indexPath.row)
    {
        case 0:
        {
            controller = [[ViewController alloc] init];
            break;
        }
        case 1:
        {
            controller = [[CALayerViewController alloc] init];
            break;
        }
        default:
            break;
    }
    [self.mm_drawerController closeDrawerAnimated:YES completion:NULL];
    [(UINavigationController *)self.mm_drawerController.centerViewController pushViewController:controller animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
