//
//  SendManageViewController.m
//  DxTeacher
//
//  Created by Stray on 16/10/29.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#define SPACE 20  //图片间隔20
#import "SendManageViewController.h"
#import "AppDefine.h"
#import "ItemViewBtn.h"

@interface SendManageViewController ()

@end

@implementation SendManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布管理";
    
    
}

- (void)loadNewView{
    NSArray *images = @[
                        @[@"tztg_unpressed",@"tztg_pressed",@"通知通告"],
                        @[@"jcsj_unpressed",@"jcsj_pressed",@"精彩瞬间"],
                        @[@"mzsp_unpressed",@"mzsp_pressed",@"每周食谱"],
                        @[@"kcjh_unpressed",@"kcjh_pressed",@"课程计划"],
                        @[@"ysaq_unpressed",@"ysaq_pressed",@"园所安全"]
                        ];
    
    [self addItemView:images];
    
}

- (void)addItemView:(NSArray *)items{
    float btn_wh = (self.screen_W - SPACE * 4) / 3;
    for (int i= 0; i<items.count; i++) {
        float addBtnX = SPACE + (SPACE + btn_wh) * (i%3);
        float addBtnY = 84 + (SPACE + btn_wh) * (i/3);
        
        ItemViewBtn *iView = [[ItemViewBtn alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh)];
        iView.items = items[i];
        iView.tag = i;
        [self.view addSubview:iView];
        iView.itemBtn.tag = i;
        [iView.itemBtn addTarget:self action:@selector(didSelectIndex:) forControlEvents:UIControlEventTouchUpInside];
        [iView.labTitle setY:iView.labTitle.y + 15];
        iView.itemBtn.layer.borderWidth = 1;
        iView.itemBtn.layer.borderColor = [UIColor colorLineBg].CGColor;
        iView.itemBtn.layer.cornerRadius = 3;
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
