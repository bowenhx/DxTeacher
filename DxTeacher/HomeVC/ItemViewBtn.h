//
//  ItemViewBtn.h
//  DxManager
//
//  Created by ligb on 16/9/19.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ItemViewBtn : UIView


@property (nonatomic , copy) NSString *itemImgs;

@property (nonatomic , copy) NSString *titles;

@property (nonatomic , copy) NSArray *items;

@property (nonatomic , strong) UIButton *itemBtn;

@property (nonatomic , strong) UILabel *labTitle;

@property (nonatomic , copy) NSDictionary *item;
@end
