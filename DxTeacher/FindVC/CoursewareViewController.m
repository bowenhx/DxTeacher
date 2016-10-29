//
//  CoursewareViewController.m
//  DxTeacher
//
//  Created by Stray on 16/10/29.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "CoursewareViewController.h"
#import "AppDefine.h"
#import "CustomTableView.h"
#import "CustomItemView.h"

@interface CoursewareViewController ()
@property (weak, nonatomic) IBOutlet CustomItemView *customView;

@property (nonatomic , strong) NSMutableArray *itemViews;

@end

@implementation CoursewareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"教堂与课件";
}
- (void)loadNewView{
    [super loadNewView];
    
    //初始化页面view
    _itemViews = [[NSMutableArray alloc] initWithCapacity:4];
    for (int i =0; i<4; i++) {
        CustomTableView *view = [[CustomTableView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, self.screen_H-64)];
        view.homeVC = self;
//        view.layer.borderWidth = 1;
//        view.layer.borderColor = [UIColor redColor].CGColor;
        [_itemViews addObject:view];
    }
    
    //item 页面布局
    [_customView addItemView:_itemViews title:@[@"领域教案",
                                                @"主题教案",
                                                @"特色教案",
                                                @"课件广场"] height: self.screen_H-64];
    

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
