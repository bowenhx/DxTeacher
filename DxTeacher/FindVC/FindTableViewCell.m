//
//  FindTableViewCell.m
//  DxTeacher
//
//  Created by Stray on 16/10/28.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "FindTableViewCell.h"

@interface FindTableViewCell()
{
    
}

@end;
@implementation FindTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _listView = [FindListViewCell findListViewCell];
    [self addSubview:_listView];
}

- (void)setInfo:(NSDictionary *)info{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
