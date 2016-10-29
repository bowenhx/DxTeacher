//
//  HomeCustomTableView.m
//  DxManager
//
//  Created by ligb on 16/9/7.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "HomeCustomTableView.h"
#import "TrendsTableViewCell.h"
#import "AppDefine.h"
#import "ItemVIewsHeight.h"

@interface HomeCustomTableView ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger       _commentId;
}

@property (nonatomic , assign) BOOL addNotCent;
@end

@implementation HomeCustomTableView

- (void)dealloc{
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.addNotCent = YES;
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
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    }
    return _tableView;
}


- (void)setIndex:(NSUInteger)index{
    _index = index;
    [self showHUDActivityView:@"正在加载" shade:NO];
    [[ANet share] post:BASE_URL params:@{@"action":@"getNewsList",@"aid":@(index)} completion:^(BNetData *model, NSString *netErr) {
        [self removeHUDActivity];
        
        NSLog(@"data = %@",model.data);
        if (model.status == 0) {
            //请求成功
            [self.dataSource setArray:model.data];
            [_tableView reloadData];
            
            if (self.dataSource.count == 0) {
                [self showHUDTitleView:@"此分类暂无数据" image:nil];
            }
            
        }else{
            [self showHUDTitleView:model.message image:nil];
        }
        
    }];
    
}
- (void)handleNotification:(NSNotification *)notification{
    NSDictionary *info = [notification object];
    NSLog(@"info -= %@",info);

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
    cell.imagesView.viewController = self.homeVC;
    [cell.btnCheck addTarget:self action:@selector(didDetailAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;

    
}
- (void)didDetailAction:(UIButton *)btn{
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)itemsImages:(NSDictionary *)item{
    NSArray *items = item[@"albums"];
    return [ItemVIewsHeight loadItmesCounts:items.count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [self itemsImages:self.dataSource[indexPath.row]];
    if (self.index == 68) {//互动投诉 高度
        NSArray *comment = self.dataSource[indexPath.row][@"comment"];
        float comH = comment.count * 25;
        return 195 + height + comH;
    }
    return 172 + height;
}
@end
