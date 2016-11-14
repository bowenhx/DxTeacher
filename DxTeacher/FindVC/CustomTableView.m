//
//  CustomTableView.m
//  DxManager
//
//  Created by ligb on 16/9/7.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "CustomTableView.h"
#import "TrendsTableViewCell.h"
#import "AppDefine.h"
#import "ItemVIewsHeight.h"
#import "FindTableViewCell.h"
#import "FMVideoTableViewCell.h"

@interface CustomTableView ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger       _commentId;
}


@end

@implementation CustomTableView

- (void)dealloc{

}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
    }
    return self;
}
- (NSMutableArray *)dataSource{
    if (nil == _dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _dataSource;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.layer.borderWidth = 1;
//        _tableView.layer.borderColor = [UIColor redColor].CGColor;
        [self addSubview:_tableView];
        
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        
        //寬度
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)]];
        
        //高度
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)]];
        
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(beginRefreshingAction)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(uploadingAction)];
    }
    return _tableView;
}
//下拉刷新
- (void)beginRefreshingAction{
    _page = 1;
    self.index = _index;
}
//上拉加载更多
- (void)uploadingAction{
    _page ++;
    self.index = _index;
}
- (void)setIndex:(NSUInteger)index{
    _index = index;
    
    [self showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getNewsList",@"aid":@(index),@"page":@(_page)} completion:^(BNetData *model, NSString *netErr) {
        [self removeHUDActivity];
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
                    [self showHUDTitleView:@"没有更多数据" image:nil];
                    [_tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            
            if (self.dataSource.count == 0) {
                [self.dataSource removeAllObjects];
                [self showHUDTitleView:@"此分类暂无数据" image:nil];
            }
            
        }else{
            [self showHUDTitleView:model.message image:nil];
        }
        
        [_tableView reloadData];
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
    if ([self.homeVC.navigationItem.title isEqualToString:@"热门课件"]) {
        static NSString *xibName = @"FMVideoTableViewCell";
        
        FMVideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.viewController = self.homeVC;
        cell.findInfo = self.dataSource[indexPath.row];
        cell.btnVideoImg.tag = indexPath.row;
        [cell.btnVideoImg addTarget:self action:@selector(didSelectCollect:) forControlEvents:UIControlEventTouchUpInside];
        return cell;

    }else{
        static NSString *xibName = @"FindTableViewCell";
        FindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:xibName];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.info = self.dataSource[indexPath.row];
        //    cell.btnCheck.tag = indexPath.row;
        //    cell.imagesView.viewController = self.homeVC;
        //    [cell.btnCheck addTarget:self action:@selector(didDetailAction:) forControlEvents:UIControlEventTouchUpInside];
        return cell;

    }
    
}
- (void)didSelectCollect:(UIButton *)btn{
    if (btn.selected) {
        //取消收藏
    }else{
        //添加收藏
        
    }
    
    NSDictionary *info = [SavaData parseDicFromFile:User_File];
    NSDictionary *dict = @{@"action":@"doFavorite",
                           @"uid":info[@"id"],
                           @"cid":self.dataSource[btn.tag][@"id"],
                           @"title":self.dataSource[btn.tag][@"title"],
                           @"type":@(!btn.selected)
                           };
    
    
    [self showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:dict completion:^(BNetData *model, NSString *netErr) {
        [self removeHUDActivity];
        NSLog(@"data = %@",model.data);
        
        if (netErr) {
            [self showHUDTitleView:netErr image:nil];
        }else if (model.status == 0) {
            [self showSuccess:model.message];
            self.index = _index;
        }else{
            [self showHUDTitleView:model.message image:nil];
        }
        
    }];
     
    
    
    
}
- (void)didDetailAction:(UIButton *)btn{

    
//    DetailViewController *detailVC = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
//    detailVC.info = self.dataSource[btn.tag];
//    [self.homeVC.navigationController pushViewController:detailVC animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.homeVC.navigationItem.title isEqualToString:@"热门课件"]) {
        return 225;
    }
       return 70;
}

@end
