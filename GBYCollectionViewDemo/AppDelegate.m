//
//  AppDelegate.m
//  GBYCollectionViewDemo
//
//  Created by YD_Dev_BinY on 2022/1/26.
//

#import "AppDelegate.h"
#import "GBYHomeViewController.h"
#import "GBYTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    GBYTabBarController *tabBar = [[GBYTabBarController alloc] init];
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
