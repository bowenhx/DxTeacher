//
//  DeedViewController.m
//  DxTeacher
//
//  Created by Stray on 16/10/29.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
//
#define SPACE 20  //图片间隔20
#import "DeedViewController.h"
#import "AppDefine.h"
#import "ItemViewBtn.h"

@interface DeedViewController ()

@end

@implementation DeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"行为记录";
}
- (void)loadNewView{
    [self.rightBtn setImage:[UIImage imageNamed:@"dte_vi_Add_1"] forState:0];
    [self.rightBtn setTitle:@"添加" forState:0];
    
   
   
    
    NSArray *items = @[@[@"vi_xwjl_add",@"全班"]];
    
    [self addItemView:items];
    
}

- (void)addItemView:(NSArray *)items{
    float btn_wh = (self.screen_W - SPACE * 4) / 3;
    for (int i= 0; i<items.count; i++) {
        float addBtnX = SPACE + (SPACE + btn_wh) * (i%3);
        float addBtnY = 84 + (SPACE + btn_wh) * (i/3);
        
        ItemViewBtn *iView = [[ItemViewBtn alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh)];
        iView.itemImgs = items[i][0];
        iView.titles = items[i][1];
        iView.tag = i;
        [self.view addSubview:iView];
        iView.itemBtn.tag = i;
        [iView.itemBtn addTarget:self action:@selector(didSelectIndex:) forControlEvents:UIControlEventTouchUpInside];
        [iView.labTitle setY:iView.labTitle.y + 15];
        iView.itemBtn.layer.borderWidth = 1;
        iView.itemBtn.layer.borderColor = [UIColor colorLineBg].CGColor;
        iView.itemBtn.layer.cornerRadius = 2;
    }
}
- (void)didSelectIndex:(UIButton *)btn{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
