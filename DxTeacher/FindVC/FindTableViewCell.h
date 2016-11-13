//
//  FindTableViewCell.h
//  DxTeacher
//
//  Created by Stray on 16/10/28.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindListViewCell.h"

@interface FindTableViewCell : UITableViewCell

@property (nonatomic , strong) FindListViewCell *listView;

@property (nonatomic , copy) NSDictionary *info;


@end
