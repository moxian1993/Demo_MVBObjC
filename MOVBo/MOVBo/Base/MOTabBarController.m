//
//  MOTabBarController.m
//  MOVBo
//
//  Created by Xian Mo on 2020/9/3.
//

#import "MOTabBarController.h"
#import "MONaviController.h"
#import "MOTabBar.h"

@interface MOTabBarController ()

@end

@implementation MOTabBarController

- (instancetype)init {
    if (self = [super init]) {
        [self setupAppearance];
        [self setupTabBar];
    }
    return self;
}

- (void)setupAppearance {
    NSArray *classes = @[@"Home", @"Message", @"Discover", @"Profile"];
    
    for (NSString *name in classes) {
        Class clz = NSClassFromString(@"MO".a(name).a(@"Controller"));
        //tabbar_discover_selected
        MONaviController *navi = [[MONaviController alloc] initWithRootViewController:clz.new];
        NSString *imgName = @"tabbar_".a(name.lowercaseString);
        UIImage *image = [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectedImage = [[UIImage imageNamed:(imgName.a(@"_selected"))] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        navi.tabBarItem.title = name;
        [navi.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColor.whiteColor} forState:UIControlStateNormal];
        navi.tabBarItem.image = image;
        navi.tabBarItem.selectedImage = selectedImage;
        [self addChildViewController:navi];
    }
}

- (void)setupTabBar {
    [self setValue:MOTabBar.new forKey:@"tabBar"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}


@end
