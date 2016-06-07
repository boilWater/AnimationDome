//
//  BaseViewController.m
//  AnimationDome
//
//  Created by liangbai on 16/6/7.
//  Copyright © 2016年 liangbai. All rights reserved.
//

#import "BaseViewController.h"
#import "Animation-PrefixHeader.pch"
#import "TitleButton.h"

@interface BaseViewController ()

@property (nonatomic, strong) NSArray *operationArrayTitle;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];
    [self initNavigationController];
}
-(void)initNavigationController{
    UIBarButtonItem *leftBItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(doBack)];
    
    self.navigationItem.leftBarButtonItem = leftBItem;
    
}
-(void)initData{
    _operationArrayTitle = [self operationArrayTitle];
}

-(void)initView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = [self controllerTitle];
    
    NSInteger numberItems = _operationArrayTitle.count;
    if (_operationArrayTitle && numberItems > 0) {
        NSInteger row = numberItems/4 == 0 ? numberItems/4 : numberItems/4+1;
        UIView *countView = [[UIView alloc] initWithFrame:CGRectMake(0, UISCREEN_HEIGHT - row*50-40, UISCREEN_WITH, row*50+20)];
        [self.view addSubview:countView];
        for (int i=0; i<numberItems; i++) {
            TitleButton *button = [[TitleButton alloc] initWithFrame:[self frameForButtonAtIndex:i totalNumber:numberItems] withTitle:[self.operationArrayTitle objectAtIndex:i]];
            [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
            button.tag = i;
            
            [countView addSubview:button];
        }
        
    }
    
}

-(CGRect)frameForButtonAtIndex:(NSInteger)index totalNumber:(NSInteger)totalNumber{
    //每一行最多显示4个
    NSUInteger maxColumnNum = 4;
    //每个按钮的列间距
    CGFloat columnMargin = 20;
    //每个按钮的行间距
    CGFloat rowMargin = 20;
    //每个按钮的宽度
    CGFloat width = (UISCREEN_WITH - columnMargin*5)/4;
    //每个按钮的高度
    CGFloat height = 30;
    
    //每个按钮的偏移
    CGFloat offsetX = columnMargin+(index%maxColumnNum)*(width+columnMargin);
    CGFloat offsetY = rowMargin+(index/maxColumnNum)*(height+rowMargin);
    
    return CGRectMake(offsetX, offsetY, width, height);
}

-(NSString *)controllerTitle{
    return @"ControllerTitle";
}
-(void)click:(UIButton *)bt{
}

-(void)doBack{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
