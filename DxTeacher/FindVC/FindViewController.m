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
#import "BLoopImageView.h"

@interface FindViewController ()<BLoopImageViewDelegate>
@property (nonatomic , strong) BLoopImageView *headView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"发现";
}

- (BLoopImageView *)headView{
    if (!_headView) {
        float height = 0;
        if (self.screen_W > 320){
            height = 200;
        }else{
            height = 170;
        }
        _headView = [[BLoopImageView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, height) delegate:self imageItems:nil isAuto:YES];
        //        _headView.layer.borderColor = [UIColor greenColor].CGColor;
        //        _headView.layer.borderWidth = 1;
    }
    return _headView;
}
//处理Head展示图片无限循环
- (void)refreshHeadImages:(NSArray *)images
{
    if (_headView.itemsArr.count) {
        for (UIView *view in _headView.subviews) {
            [view removeFromSuperview];
        }
    }
    //添加最后一张图 用于循环
    int length = (unsigned)images.count;
    NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:length+2];
    if (length > 1)
    {
        //        NSDictionary *dict = images[length-1];
        BLoopImageItem *item = [[BLoopImageItem alloc] initWithTitle:@"" image:images[length-1] tag:-1];//initWithDict:dict tag:-1];
        [itemArray addObject:item];
    }
    for (int i = 0; i < length; i++)
    {
        NSString *img = images[i];
        BLoopImageItem *item = [[BLoopImageItem alloc] initWithTitle:@"" image:img tag:i];//initWithDict:dict tag:i];
        [itemArray addObject:item];
    }
    //添加第一张图 用于循环
    if (length >1)
    {
        NSString *img = images[0];
        BLoopImageItem *item = [[BLoopImageItem alloc] initWithTitle:@"" image:img tag:length];//initWithDict:dict tag:length];
        [itemArray addObject:item];
    }
    [self.headView setItemsArr:itemArray];
}

- (void)loadNewView{
    _scrollView.layer.borderWidth = 1;
    _scrollView.layer.borderColor = [UIColor redColor].CGColor;
    //添加循环轮播图片view
    [self.scrollView addSubview:self.headView];
    
    NSArray *images = @[
                        @[@"kqgl_1_unpressed",@"vi_jztxl",@"教堂与课件"],
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
        float addBtnY = self.headView.max_Y + (SPACE + btn_wh) * (i/3);
        
        ItemViewBtn *iView = [[ItemViewBtn alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh)];
        iView.itemImgs = images[i][1];
        iView.titles = images[i][2];
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
              UILabel *lineY = [[UILabel alloc] initWithFrame:CGRectMake(iView.max_X, addBtnY, 1, iView.h*2)];
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
