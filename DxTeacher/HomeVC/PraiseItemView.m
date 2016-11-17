//
//  PraiseItemView.m
//  DxTeacher
//
//  Created by ligb on 16/11/17.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//
#define SPACE 5  //图片间隔20
#import "PraiseItemView.h"
#import "AppDefine.h"

@implementation PraiseItemView

- (void)setItems:(NSArray *)items{
    NSLog(@"self.width = %f",self.w);
    
    float btn_wh = (self.w - SPACE * 6) / 5;
    for (int i= 0; i<items.count; i++) {
        float addBtnX = SPACE + (SPACE + btn_wh) * (i%5);
        float addBtnY = 5 + (SPACE + btn_wh) * (i/5);
        
         UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(addBtnX, addBtnY, btn_wh, btn_wh)];
        [imageView img_setImageWithURL:items[i][@"img_url"] placeholderImage:nil];
        imageView.layer.borderWidth = 1;
        [self addSubview:imageView];
    }
}

@end
