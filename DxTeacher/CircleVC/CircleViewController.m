//
//  CircleViewController.m
//  DxTeacher
//
//  Created by Stray on 16/10/24.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "CircleViewController.h"
#import "TrendsTableViewCell.h"
#import "ItemVIewsHeight.h"
#import "AppDefine.h"

@interface CircleViewController ()
{
    __weak IBOutlet UITableView *_tableView;
    
}
@property (nonatomic , strong) UITableView *typeTabView;
@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     self.navigationItem.title = @"班级圈";
}

- (void)loadNewView{
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.frame = CGRectMake(120, 0, self.screen_W - 240, 40);
    titleBtn.layer.borderWidth = 1;
    [titleBtn setTitle:@"班级圈" forState:0];
    [titleBtn addTarget:self action:@selector(selectTitleType:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleBtn;
}
//- (UITableView *)typeTabView{
//    
//}

- (void)selectTitleType:(UIButton *)button{
    
}
- (void)loadNewData{
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getNewsList",@"aid":@(52)} completion:^(BNetData *model, NSString *netErr) {
        [self.view removeHUDActivity];
        
        NSLog(@"data = %@",model.data);
        if (model.status == 0) {
            //请求成功
            [self.dataSource setArray:model.data];
            [_tableView reloadData];
            
            if (self.dataSource.count == 0) {
                [self.view showHUDTitleView:@"此分类暂无数据" image:nil];
            }
            
        }else{
            [self.view showHUDTitleView:model.message image:nil];
        }
        
    }];

}
#pragma mark
#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *xibName = @"TrendsTableViewCell";
    TrendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.info = self.dataSource[indexPath.row];
    cell.btnCheck.tag = indexPath.row;
    cell.imagesView.viewController = self;
    //[cell.btnCheck addTarget:self action:@selector(didDetailAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
        
    
}

- (CGFloat)itemsImages:(NSDictionary *)item{
    NSArray *items = item[@"albums"];
    return [ItemVIewsHeight loadItmesCounts:items.count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [self itemsImages:self.dataSource[indexPath.row]];
    return 172 + height;
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
