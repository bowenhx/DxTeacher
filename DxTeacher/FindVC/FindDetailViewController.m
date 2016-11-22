//
//  FindDetailViewController.m
//  DxTeacher
//
//  Created by ligb on 16/11/22.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "FindDetailViewController.h"

@interface FindDetailViewController ()

@end

@implementation FindDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)loadNewData{

    [self.view showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getNewsContent",@"cid":@(_cid)} completion:^(BNetData *model, NSString *netErr) {
        [self.view removeHUDActivity];
        
        NSLog(@"data = %@",model.data);
        if (model.status == 0) {
            //请求成功
            [self.dataSource setArray:@[model.data]];
//            [_tableView reloadData];
            
            if (self.dataSource.count == 0) {
                [self.view showHUDTitleView:@"此分类暂无数据" image:nil];
            }
            
        }else{
            [self.view showHUDTitleView:model.message image:nil];
        }
        
    }];
    
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
