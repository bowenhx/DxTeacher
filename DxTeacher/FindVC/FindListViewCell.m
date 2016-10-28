//
//  FindListViewCell.m
//  DxTeacher
//
//  Created by Stray on 16/10/28.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "FindListViewCell.h"
#import "UIView+Ex.h"

@implementation FindListViewCell

+ (instancetype)findListViewCell{
    FindListViewCell *findView = [[[NSBundle mainBundle] loadNibNamed:@"FindListViewCell" owner:nil options:nil] lastObject];
    [findView setW:[UIScreen mainScreen].bounds.size.width];
    return findView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
