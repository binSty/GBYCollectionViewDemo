//
//  GBYBaseViewController.m
//  StytemThemeDemo
//
//  Created by YD_Dev_BinY on 2022/1/20.
//

#import "GBYBaseViewController.h"

@interface GBYBaseViewController () <UINavigationControllerDelegate>

@end

@implementation GBYBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setBaseControllerInit];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)setBaseControllerInit {
    self.navigationView = [[GBYNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kNavigationBarHeight)];
    @weakify(self);
    self.navigationView.navigationBackButtonClickBlock = ^{
        @strongify(self);
        [self backBtnClickMethod];
    };
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationView.hidden = NO;
    }else {
        self.navigationView.hidden = YES;
    }
    [self.view addSubview:self.navigationView];
}

- (void)backBtnClickMethod {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark
#pragma mark -- UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.navigationController.interactivePopGestureRecognizer.enabled = self.navigationController.viewControllers.count > 1 ? YES : NO;
}

@end
