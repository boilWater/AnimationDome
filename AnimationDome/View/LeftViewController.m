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
#import "LeftViewController.h"
#import "LeftViewCell.h"
#import "LeftViewCell+ItemConfigureForCell.h"
#import "ArrayDataSource.h"
#import <MMDrawerController/MMDrawerController.h>
#import <MMDrawerController/UIViewController+MMDrawerController.h>
#import "GroupAnimationController.h"
#import "FadeAnimationController.h"
#import "AffineAnimationController.h"
#import "ComplexAnimation.h"

@interface LeftViewController ()<UITableViewDelegate>

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ArrayDataSource *arrayDataSource;

@end

static NSString * const identifer = @"LeftViewCell";

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = [NSArray arrayWithObjects:@"UIView 放射动画",@"基础 Animation",@"帧 Animation",@"组合 Animation",@"fade Animation",@"复杂 Animation", nil];
    
    [self initView];
   
    [self initTableView];
}
-(void)initView
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 249, UISCREEN_HEIGHT)];
    self.tableView.delegate = self;
    
    TakenConfigureCellBlock configureCellBlock = ^(LeftViewCell *cell, id item){
        [cell ItemConfigureForCell:item];
    };
    self.arrayDataSource = [[ArrayDataSource alloc] initItems:self.array cellIdentifer:identifer takenConfigureCellBlock:configureCellBlock];
    self.tableView.dataSource = self.arrayDataSource;
    [self.tableView registerNib:[LeftViewCell nib] forCellReuseIdentifier:identifer];
    
    [self.view addSubview:self.tableView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *controller;
    switch (indexPath.row)
    {
        case 0:
        {
            controller = [[AffineAnimationController alloc] init];
            break;
        }
        case 1:
        {
            controller = [[ViewController alloc] init];
            break;
        }
        case 2:
        {
            controller = [[CALayerViewController alloc] init];
            break;
        }
        case 3:
        {
            controller = [[GroupAnimationController alloc] init];
            break;
        }
        case 4:
        {
            controller = [[FadeAnimationController alloc] init];
            break;
        }
        case 5:
        {
            controller = [[ComplexAnimation alloc] init];
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
