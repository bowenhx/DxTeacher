//
//  UserViewController.m
//  DxTeacher
//
//  Created by Stray on 16/10/24.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "UserViewController.h"
#import "AppDefine.h"

@interface UserViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)loadNewView{
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = @"#3399fe".color;
    self.tableView.backgroundView = backView;
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
