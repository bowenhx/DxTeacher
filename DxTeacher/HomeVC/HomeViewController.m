//
//  HomeViewController.m
//  DxTeacher
//
//  Created by Stray on 16/10/24.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#define SPACE 0  //图片间隔20

#import "HomeViewController.h"

#import "ItemViewBtn.h"
#import "WorkManageViewController.h"



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
                        @[@"kqgl_1_unpressed",@"kqgl_1_pressed",@"考勤管理"],
                        @[@"xwjll_1_unpressed",@"xwjll_1_pressed",@"行为记录"],
                        @[@"fbgl_1_unpressed",@"fbgl_1_pressed",@"发布管理"],
                        @[@"jcsj_1_unpressed",@"jcsj_1_pressed",@"精彩瞬间"],
                        @[@"dxfm_1_unpressed",@"dxfm_1_pressed",@"大象FM"],
                        @[@"czrz-_1_unpressed",@"czrz_1_pressed",@"成长日志"],
                        @[@"yytgl_1_unpressed",@"yytgl_1_pressed",@"用药条管理"],
                        @[@"ystz_1_unpressed",@"ystz_1_pressed",@"园所通知"],
                        @[@"wdsh_1_unpressed",@"wdsh_1_pressed",@"我的审核"],
                        @[@"aqtx_1_unpressed",@"aqtx_1_pressed",@"安全提醒"]
                        ];
    
    float btn_wh = (self.screen_W - SPACE * 4) / 3;
    
    float line_Y = 0.0;
    for (int i= 0; i<images.count; i++) {
        float addBtnX = SPACE + (SPACE + btn_wh) * (i%3);
        float addBtnY = 84 + (SPACE + btn_wh) * (i/3);
        
        ItemViewBtn *iView = [[ItemViewBtn alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh)];
        iView.items = images[i];
        iView.tag = i;
        [self.scrollView addSubview:iView];
        iView.itemBtn.tag = i;
        [iView.itemBtn addTarget:self action:@selector(didSelectIndex:) forControlEvents:UIControlEventTouchUpInside];
        
        //判断是否变化，当Y值变化时，再画
        if (line_Y != iView.max_Y) {
            //画横线
            UILabel *lineX = [[UILabel alloc] initWithFrame:CGRectMake(0, iView.max_Y, self.screen_W, 1)];
            lineX.backgroundColor = @"#cccccc".color;
            [self.scrollView addSubview:lineX];
        }
       
        line_Y = iView.max_Y;
        
        //只需要画两条就行
        if (i < 2) {
            //画竖线
            UILabel *lineY = [[UILabel alloc] initWithFrame:CGRectMake(iView.max_X, 84, 1, self.screen_H)];
            lineY.backgroundColor = @"#cccccc".color;
            [self.scrollView addSubview:lineY];
        }
        
        
        
        
    }

    _scrollView.contentSize = CGSizeMake(self.screen_W, self.screen_H + 100);
}
- (void)didSelectIndex:(UIButton *)btn{
    NSLog(@"btn.tag = %ld",btn.tag);
    switch (btn.tag) {
        case 0:
        {//考勤管理
            WorkManageViewController *workManageVC = [[WorkManageViewController alloc] initWithNibName:@"WorkManageViewController" bundle:nil];
            [self.navigationController pushViewController:workManageVC animated:YES];
        }
            break;
        case 1:
        {//
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
        case 6:
        {
            
        }
            break;
        case 7:
        {
            
        }
            break;
        case 8:
        {
            
        }
            break;
        case 9:
        {
            
        }
            break;
            
        default:
            break;
    }
   
    
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
