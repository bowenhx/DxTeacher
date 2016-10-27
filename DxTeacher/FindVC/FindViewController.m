//
//  FindViewController.m
//  DxTeacher
//
//  Created by Stray on 16/10/24.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#define SPACE 0  //图片间隔20
#import "FindViewController.h"
#import "ItemViewBtn.h"

@interface FindViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"发现";
}
- (void)loadNewView{
    
    NSArray *images = @[
                        @[@"kqgl_1_unpressed",@"kqgl_1_pressed",@"教堂与课件"],
                        @[@"xwjll_1_unpressed",@"vi_jxzd",@"教学指导"],
                        @[@"fbgl_1_unpressed",@"vi_czlj",@"成长路径"],
                        @[@"jcsj_1_unpressed",@"vi_jchd",@"精彩活动"],
                        @[@"dxfm_1_unpressed",@"vi_wntj",@"为您推荐"],
                        @[@"czrz-_1_unpressed",@"vi_rmkj",@"热门课件"]
                        ];
    
    float btn_wh = (self.screen_W - SPACE * 4) / 3;
    
    float line_Y = 0.0;
    for (int i= 0; i<images.count; i++) {
        float addBtnX = SPACE + (SPACE + btn_wh) * (i%3);
        float addBtnY = 84 + (SPACE + btn_wh) * (i/3);
        
        ItemViewBtn *iView = [[ItemViewBtn alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh)];
        iView.itemImgs = images[i][1];
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
        {//教堂与课件
        
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
