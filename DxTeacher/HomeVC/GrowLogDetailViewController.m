//
//  GrowLogDetailViewController.m
//  DxTeacher
//
//  Created by ligb on 16/11/15.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "GrowLogDetailViewController.h"
#import "TrendsTableViewCell.h"
#import "DetailViewController.h"
#import "ItemVIewsHeight.h"


@interface GrowLogDetailViewController ()
{
    NSInteger _page;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation GrowLogDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)loadNewData{
    
}
//请求列表数据
- (void)setAidIndex:(NSInteger)aidIndex{
    _aidIndex = aidIndex;
    [self.view showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getChildCZRZ",@"childid":@(aidIndex),@"page":@(_page)} completion:^(BNetData *model, NSString *netErr) {
        [self.view removeHUDActivity];
        
        NSLog(@"data = %@",model.data);
        if (model.status == 0) {
            //请求成功
            NSArray *array = model.data;
            if ( _page == 1 ) {
                if ([array isKindOfClass:[NSArray class]] && array.count) {
                    [self.dataSource setArray:model.data];
                    [_tableView.mj_footer resetNoMoreData];
                }
            }else{
                if ([array isKindOfClass:[NSArray class]] && array.count) {
                    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        [self.dataSource addObject:obj];
                    }];
                }else{
                    [self.view showHUDTitleView:@"没有更多数据" image:nil];
                    [_tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            
            [_tableView reloadData];
            
            if (self.dataSource.count == 0) {
                [self.view showHUDTitleView:@"暂无数据" image:nil];
            }
            
        }else{
            [self.view showHUDTitleView:model.message image:nil];
        }
        
        [_tableView endRefreshing];
        
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
    [cell.btnCheck setTitle:@"详情" forState:UIControlStateNormal];
    [cell.btnCheck addTarget:self action:@selector(didDetailAction:) forControlEvents:UIControlEventTouchUpInside];
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
- (void)didDetailAction:(UIButton *)btn{
    DetailViewController *detail = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detail.cid = [self.dataSource[btn.tag][@"id"] integerValue];
    [self.navigationController pushViewController:detail animated:YES];
}
#pragma mark PoppingTableViewDelegate
- (void)selectItem:(id)obj index:(NSInteger)index{
    _page = 1;
    if (index == 0) {
        self.aidIndex = 52;
    }else{
        self.aidIndex = index + 61;
    }
    
    NSLog(@"obj = %@,aid = %ld",obj,(long)self.aidIndex);
    
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
