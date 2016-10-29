//
//  UserViewController.m
//  DxTeacher
//
//  Created by Stray on 16/10/24.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "UserViewController.h"
#import "AppDefine.h"
#import "UIViewController+MMDrawerController.h"


@interface UserViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation UserViewController

+ (UserViewController *)share{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataSource setArray:@[@"通讯录",@"我的审核",@"我的特色班",@"我的考勤",@"园所通知",@"教学计划",@"我的收藏",@"和睦家庭",@"设置"]];
    
    [self.tableView setTableHeaderView:[self headView]];
}
- (UIView *)headView{
    NSDictionary *info = [SavaData parseDicFromFile:User_File];
    NSLog(@"info = %@",info);
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240, 220)];
    headView.backgroundColor = [UIColor clearColor];
    //头像
    UIImageView *headImg = [[UIImageView alloc] initWithFrame:CGRectMake((headView.w - 70)/2, 70, 70, 70)];
    //headImg.layer.borderWidth = 1;
    [headImg img_setImageWithURL:info[@"avatar"] placeholderImage:[UIImage imageNamed:@"userDefineIcon"]];
    [headView addSubview:headImg];
    
    //用户名
    UILabel *userName = [[UILabel alloc] initWithFrame:CGRectMake(headImg.x, headImg.max_Y + 5, headImg.w, 25)];
    userName.textAlignment = NSTextAlignmentCenter;
    userName.textColor = [UIColor whiteColor];
    userName.text = info[@"nick_name"];
    [headView addSubview:userName];
    //内容电话
    UILabel *textLab = [[UILabel alloc] initWithFrame:CGRectMake(userName.x - 50, userName.max_Y, userName.w + 100, 25)];
    textLab.font = [UIFont systemFontOfSize:13];
    textLab.textAlignment = NSTextAlignmentCenter;
    textLab.textColor = [UIColor whiteColor];
    textLab.text = [NSString stringWithFormat:@"%@ 大象顺义园所",info[@"mobile"]];
    [headView addSubview:textLab];
    
    return headView;
}

- (void)loadNewView{
//    UIView *backView = [[UIView alloc] init];
//    backView.backgroundColor = @"#3399fe".color;
//    self.tableView.backgroundView = backView;
    self.tableView.backgroundColor = @"#3399fe".color;
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = @"#3399fe".color;
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *centVC = [storyBoard instantiateInitialViewController];
    [self.mm_drawerController setCenterViewController:centVC withCloseAnimation:YES completion:nil];
    
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
