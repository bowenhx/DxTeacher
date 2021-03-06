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
#import "FindListViewCell.h"
#import "CoursewareViewController.h"

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
    //添加循环轮播图片view
    [self.scrollView addSubview:self.headView];
}
- (void)loadItemNewViews:(NSArray *)items{
//    _scrollView.layer.borderWidth = 1;
//    _scrollView.layer.borderColor = [UIColor grayColor].CGColor;
    
    [self.dataSource setArray:items];
    
    
//    NSArray *images = @[
//                        @[@"kqgl_1_unpressed",@"vi_jztxl",@"教堂与课件"],
//                        @[@"xwjll_1_unpressed",@"vi_jxzd",@"教学指导"],
//                        @[@"fbgl_1_unpressed",@"vi_czlj",@"成长路径"],
//                        @[@"jcsj_1_unpressed",@"vi_jchd",@"精彩活动"],
//                        @[@"dxfm_1_unpressed",@"vi_wntj",@"为您推荐"],
//                        @[@"czrz-_1_unpressed",@"vi_rmkj",@"热门课件"]
//                        ];
    
    float btn_wh = (self.screen_W - SPACE * 4) / 3;
    
    float line_Y = 0.0;
    for (int i= 0; i<items.count; i++) {
        float addBtnX = SPACE + (SPACE + btn_wh) * (i%3);
        float addBtnY = self.headView.max_Y + (SPACE + btn_wh) * (i/3);
        
        ItemViewBtn *iView = [[ItemViewBtn alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh)];
        
        NSString *imageURL = [NSString stringWithFormat:@"%@%@",BASE_IMG_URL,items[i][@"img_url"]];
        
        iView.itemImgs = imageURL;
        iView.titles = items[i][@"title"];
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
    
    
    FindListViewCell *listView = [[FindListViewCell alloc] initWithFrame:CGRectMake(0, line_Y, self.screen_W, 70)];
//    listView.layer.borderWidth = 1;
//    listView.layer.borderColor = [UIColor greenColor].CGColor;
    listView.labLine.backgroundColor = @"#cccccc".color;
    [_scrollView addSubview:listView];
    
    
    FindListViewCell *listImgView = [FindListViewCell findListImgView];
    listImgView.frame = CGRectMake(0, listView.max_Y, self.screen_W, 100);
    listImgView.labLine.backgroundColor = @"#cccccc".color;
    [_scrollView addSubview:listImgView];
    
   
}
- (void)loadNewData{
    NSArray *items = [NSArray arrayWithObjects:
                      @"http://d-smrss.oss-cn-beijing.aliyuncs.com/customerportrait/004/903/847d2925-7d03-40dd-90d9-429d13aabab8_100x100.jpg",
                      @"http://d-smrss.oss-cn-beijing.aliyuncs.com/customerportrait/004/888/4f564995-a919-4c7f-ae8f-d8d0bda1d7f4_100x100.jpg",
                      @"http://d-smrss.oss-cn-beijing.aliyuncs.com/customerportrait/004/869/2ebc752a-5176-4f16-b7b5-2233d4ddcc87_100x100.jpg",
                      @"http://d-smrss.oss-cn-beijing.aliyuncs.com/customerportrait/004/888/4f564995-a919-4c7f-ae8f-d8d0bda1d7f4_100x100.jpg",
                      @"http://d-smrss.oss-cn-beijing.aliyuncs.com/customerportrait/004/903/847d2925-7d03-40dd-90d9-429d13aabab8_100x100.jpg", nil];
    
    [self refreshHeadImages:items];
    
    
    [self loadItemData];
}
- (void)loadItemData{
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getFind6Class"} completion:^(BNetData *model, NSString *netErr) {
        [self.view removeHUDActivity];
        NSLog(@"data = %@",model.data);
        if (model.status == 0) {
            NSArray *items = model.data;
            if ([items isKindOfClass:[NSArray class]] && items.count) {
                [self loadItemNewViews:items];
            }
            
        }else{
            [self.view showHUDTitleView:model.message image:nil];
        }
        
    }];
}
- (void)didSelectIndex:(UIButton *)btn{
    NSLog(@"btn.tag = %ld",btn.tag);
//    switch (btn.tag) {
//        case 0:
//        {//教堂与课件
            CoursewareViewController *couresewareVC = [[CoursewareViewController alloc] initWithNibName:@"CoursewareViewController" bundle:nil];
            couresewareVC.aid = [self.dataSource[btn.tag][@"id"] integerValue];
            couresewareVC.navigationItem.title = self.dataSource[btn.tag][@"title"];
            [self.navigationController pushViewController:couresewareVC animated:YES];
//        }
//            break;
//        case 1:
//        {//
//            
//        }
//            break;
//        case 2:
//        {
//            
//        }
//            break;
//        case 3:
//        {
//            
//        }
//            break;
//        case 4:
//        {
//            
//        }
//            break;
//        case 5:
//        {
//            
//        }
//            break;
//        case 6:
//        {
//            
//        }
//            break;
//        case 7:
//        {
//            
//        }
//            break;
//        case 8:
//        {
//            
//        }
//            break;
//        case 9:
//        {
//            
//        }
//            break;
//            
//        default:
//            break;
//    }
    
    
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
