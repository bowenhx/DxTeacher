//
//  AppDelegate.m
//  DxTeacher
//
//  Created by Stray on 16/10/24.
//  Copyright © 2016年 XXTechnology Co.,Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "UserViewController.h"

@interface AppDelegate ()

@property (nonatomic , strong) MMDrawerController * drawerController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UserViewController *leftVC = [[UserViewController alloc] initWithNibName:@"UserViewController" bundle:nil];
    
    //使用Storyboard初始化根界面
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *centVC = [storyBoard instantiateInitialViewController];
    
    self.drawerController = [[MMDrawerController alloc]
                             initWithCenterViewController:centVC
                             leftDrawerViewController:leftVC
                             rightDrawerViewController:nil];
    [self.drawerController setShowsShadow:NO];
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setMaximumLeftDrawerWidth:240.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    MMExampleDrawerVisualStateManager *examleType = [MMExampleDrawerVisualStateManager sharedManager];
    examleType.leftDrawerAnimationType = MMDrawerAnimationTypeSwingingDoor;
    
    [self.drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [examleType drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
                                          green:173.0/255.0
                                           blue:234.0/255.0
                                          alpha:1.0];
    [self.window setTintColor:tintColor];
    [self.window setRootViewController:self.drawerController];
    
    
    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //使用Storyboard初始化根界面
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    self.window.rootViewController = [storyBoard instantiateInitialViewController];
    
    
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
