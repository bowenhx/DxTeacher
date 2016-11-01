//
//  AddressViewController.m
//  DxTeacher
//
//  Created by ligb on 16/11/1.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "AddressViewController.h"
#import "TeacherTableViewCell.h"
#import "AppDefine.h"

@interface AddressViewController ()
{
    __weak IBOutlet UIView *_headView;
    
    __weak IBOutlet UIButton *_addressBtn1;
    
    __weak IBOutlet UIButton *_addressBtn2;
    
    __weak IBOutlet UITableView *_tableView;
}
@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";
}
- (void)loadNewView{
    _headView.layer.borderWidth = 1;
    _headView.layer.borderColor = [UIColor colorLineBg].CGColor;
    
    [_addressBtn1 setTitleColor:[UIColor colorAppBg] forState:UIControlStateSelected];
    [_addressBtn2 setTitleColor:[UIColor colorAppBg] forState:UIControlStateSelected];
}
- (void)loadNewData{
    
}

- (IBAction)selectAddressType:(UIButton *)sender {
    if (sender.tag == 100) {
        
    }
    
}
#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
- (NSArray *)itemsArr:(NSInteger)section{
    NSArray *items = self.dataSource[section][@"teachers"];
    if ([items isKindOfClass:[NSArray class]] && items.count) {
        return items;
    }else{
        return @[];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self itemsArr:section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TeacherTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"teacherCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([[self itemsArr:indexPath.section] count]) {
        cell.info = [self itemsArr:indexPath.section][indexPath.row];
        
    }
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screen_W, 35)];
    //headView.backgroundColor = [UIColor colorCellLineBg];
    UILabel *labTitle = [[UILabel alloc] initWithFrame:CGRectMake(8, 5, 60, 25)];
    labTitle.backgroundColor = [UIColor colorAppBg];
    labTitle.layer.cornerRadius = 3;
    labTitle.clipsToBounds = YES;
    labTitle.textColor = [UIColor whiteColor];
    labTitle.font = [UIFont systemFontOfSize:14];
    labTitle.textAlignment = NSTextAlignmentCenter;
    labTitle.text = self.dataSource[section][@"grade"];
    [headView addSubview:labTitle];
    
    //画线
    UILabel *labLine = [[UILabel alloc] initWithFrame:CGRectMake(15, headView.h-1, self.screen_W-15, 1)];
    labLine.backgroundColor = [UIColor colorCellLineBg];
    [headView addSubview:labLine];
    return headView;
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
