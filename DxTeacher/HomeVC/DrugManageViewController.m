//
//  DrugManageViewController.m
//  DxTeacher
//
//  Created by Stray on 16/10/29.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "DrugManageViewController.h"

@interface DrugManageViewController ()
{
    __weak IBOutlet UITableView *_tableView;
    
}
@end

@implementation DrugManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"用药条管理";
    
    
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
