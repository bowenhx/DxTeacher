//
//  IDImagePickerCoordinator.h
//  DxManager
//
//  Created by ligb on 16/10/8.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IDImagePickerCoordinator : NSObject

- (UIImagePickerController *)cameraVC;
@property (nonatomic , copy) void (^backImage)(UIImage *image,NSURL *url);
@end
