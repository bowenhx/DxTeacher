//
//  GrowLogViewController.m
//  DxTeacher
//
//  Created by ligb on 16/11/15.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#define SPACE 20  //图片间隔20
#import "GrowLogViewController.h"
#import "ItemViewBtn.h"
#import "GrowLogDetailViewController.h"

@interface GrowLogViewController ()
{
    
}
@end

@implementation GrowLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"成长日志";
    
}
- (void)loadItemView:(NSArray *)array{
    [self.dataSource setArray:array];
    float btn_wh = (self.screen_W - SPACE * 4) / 3;
    for (int i= 0; i<array.count; i++) {
        float addBtnX = SPACE + (SPACE + btn_wh) * (i%3);
        float addBtnY = 84 + (SPACE + btn_wh) * (i/3);
        
        ItemViewBtn *iView = [[ItemViewBtn alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh)];
        iView.item = array[i];
        iView.tag = i;
        [self.view addSubview:iView];
        iView.itemBtn.tag = i;
        [iView.itemBtn addTarget:self action:@selector(didSelectIndex:) forControlEvents:UIControlEventTouchUpInside];
        //[iView.labTitle setY:iView.labTitle.y + 15];
        iView.itemBtn.layer.borderWidth = 1;
        iView.itemBtn.layer.borderColor = [UIColor colorLineBg].CGColor;
        iView.itemBtn.layer.cornerRadius = 2;
    }

}
- (void)loadNewData{
    NSDictionary *info = [SavaData parseDicFromFile:User_File];
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getChildList",@"uid":info[@"id"]} completion:^(BNetData *model, NSString *netErr) {
        [self.view removeHUDActivity];
        
        NSLog(@"data = %@",model.data);
        if (model.status == 0) {
         
            [self loadItemView:model.data];
          
        }else{
            [self.view showHUDTitleView:model.message image:nil];
        }
        
    }];

}

- (void)didSelectIndex:(UIButton *)btn{
    GrowLogDetailViewController *growDetailVC = [[GrowLogDetailViewController alloc] initWithNibName:@"GrowLogDetailViewController" bundle:nil];
    growDetailVC.title = [NSString stringWithFormat:@"%@的成长日志",self.dataSource[btn.tag][@"user_name"]];
    growDetailVC.aidIndex = [self.dataSource[btn.tag][@"grade_id"] integerValue];
    [self.navigationController pushViewController:growDetailVC animated:YES];
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
