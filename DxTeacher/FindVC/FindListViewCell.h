//
//  FindListViewCell.h
//  DxTeacher
//
//  Created by Stray on 16/10/28.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindListViewCell : UIView

+ (instancetype)findListViewCell;

@property (weak, nonatomic) IBOutlet UILabel *labType;

@property (weak, nonatomic) IBOutlet UILabel *labTitle;

@property (weak, nonatomic) IBOutlet UILabel *labAbout;

@property (weak, nonatomic) IBOutlet UILabel *labSection;

@property (weak, nonatomic) IBOutlet UIButton *btnMore;

@end
