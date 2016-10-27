//
//  WorkManageViewController.m
//  DxTeacher
//
//  Created by Stray on 16/10/27.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "WorkManageViewController.h"
#import "AppDefine.h"



@interface WorkManageViewController ()
{
    __weak IBOutlet UISegmentedControl *_segmentedControl;
    
    __weak IBOutlet UITableView *_tableView;
    
}
@end

@implementation WorkManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"考勤管理";
    
    
}

- (void)loadNewView{
    [super loadNewView];
    _segmentedControl.tintColor = [UIColor colorAppBg];
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
