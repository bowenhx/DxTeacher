//
//  HomeViewController.m
//  DxTeacher
//
//  Created by Stray on 16/10/24.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#define SPACE 0  //图片间隔20

#import "HomeViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "ItemViewBtn.h"




@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(showLeftVCAction)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)loadNewView{
//    self.scrollView.layer.borderWidth = 1;
//    self.scrollView.layer.borderColor = [UIColor redColor].CGColor;
    
    
    NSArray *images = @[
                        @[@"vi_jztxl",@"通讯录"],
                        @[@"vi_kqg",@"考勤管理"],
                        @[@"vi_bjqgl",@"班级圈管理"],
                        @[@"vi_dxfm",@"大象FM"],
                        @[@"vi_spjkgl",@"视频监控管理"],
                        @[@"vi_yytgl",@"用药条管理"],
                        @[@"vi_jxjh",@"教学计划"],
                        @[@"vi_ystz",@"园所通知"],
                        @[@"vi_hdts",@"互动投诉"],
                        @[@"vi_tcwj",@"调查问卷"]
                        ];
    
    float btn_wh = (self.screen_W - SPACE * 4) / 3;
    
    
    for (int i= 0; i<images.count; i++) {
        float addBtnX = SPACE + (SPACE + btn_wh) * (i%3);
        float addBtnY = 84 + (SPACE + btn_wh) * (i/3);
        
        ItemViewBtn *iView = [[ItemViewBtn alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh)];
        iView.itemImgs = images[i][0];
        iView.titles = images[i][1];
        [self.scrollView addSubview:iView];
        iView.itemBtn.tag = i;
        [iView.itemBtn addTarget:self action:@selector(didSelectIndex:) forControlEvents:UIControlEventTouchUpInside];
        
       
        if (i == images.count -1) {
            break;
        }
        NSLog(@"i == %ld",(long)i);
            //画线
        UILabel *lineX = [[UILabel alloc] initWithFrame:CGRectMake(0, iView.max_Y, self.screen_W, 1)];
        lineX.backgroundColor = [UIColor redColor];
        [self.scrollView addSubview:lineX];
        
        
        UILabel *lineY = [[UILabel alloc] initWithFrame:CGRectMake(iView.max_X, 84, 1, self.screen_H)];
        lineY.backgroundColor = [UIColor redColor];
        [self.scrollView addSubview:lineY];
        
      
    }

    _scrollView.contentSize = CGSizeMake(self.screen_W, self.screen_H + 100);
}
- (void)didSelectIndex:(UIButton *)btn{
    NSLog(@"btn.tag = %ld",btn.tag);
}

- (void)showLeftVCAction{
      [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
