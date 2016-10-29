//
//  ItemViewBtn.m
//  DxManager
//
//  Created by ligb on 16/9/19.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "ItemViewBtn.h"
#import "AppDefine.h"

@implementation ItemViewBtn

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setItemImgs:(NSString *)itemImgs{
    _itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _itemBtn.frame = self.bounds;
    [_itemBtn setImage:[UIImage imageNamed:itemImgs] forState:0];
    _itemBtn.imageEdgeInsets = UIEdgeInsetsMake(-15, 0, 15, 0);
//    _itemBtn.layer.borderWidth = 1;
//    _itemBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    _itemBtn.layer.cornerRadius = 6;
    
    [self addSubview:_itemBtn];

}

- (void)setTitles:(NSString *)titles{
    _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, self.h-50, self.w, 20)];
    _labTitle.text = titles;
    _labTitle.font = [UIFont systemFontOfSize:13];
    _labTitle.textAlignment = NSTextAlignmentCenter;
    _labTitle.textColor = [UIColor darkGrayColor];
    [self addSubview:_labTitle];
    
}

- (void)setItems:(NSArray *)items{
    _itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _itemBtn.frame = self.bounds;
    [_itemBtn setImage:[UIImage imageNamed:items[0]] forState:0];
    [_itemBtn setImage:[UIImage imageNamed:items[1]] forState:UIControlStateHighlighted];
    _itemBtn.imageEdgeInsets = UIEdgeInsetsMake(-15, 0, 15, 0);
//    _itemBtn.layer.borderWidth = 1;
//    _itemBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    _itemBtn.layer.cornerRadius = 6;
    [self addSubview:_itemBtn];
    
    
    _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, self.h-50, self.w, 20)];
    _labTitle.text = items[2];
    _labTitle.font = [UIFont systemFontOfSize:13];
//    _labTitle.highlightedTextColor = 
    _labTitle.textColor = @"#7d7d7d".color;
    _labTitle.textAlignment = NSTextAlignmentCenter;
    _labTitle.textColor = [UIColor darkGrayColor];
    [self addSubview:_labTitle];
}
@end
